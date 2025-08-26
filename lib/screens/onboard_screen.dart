import 'package:auto_route/auto_route.dart';
import 'package:chef_challenge_project/adaptive_framework.dart';
import 'package:chef_challenge_project/models.dart';
import 'package:chef_challenge_project/route_config/app_router.gr.dart';
import 'package:chef_challenge_project/states/user/user_cubit.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:chef_challenge_project/widgets/custom_button.dart';
import 'package:chef_challenge_project/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  final _nameController = TextEditingController();
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final p = (_pageController.page ?? 0).round();
      if (p != _page) setState(() => _page = p);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Widget _pageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        final isActive = i == _page;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: isActive ? 25 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive
                ? const Color.fromRGBO(219, 122, 43, 1)
                : const Color.fromRGBO(136, 132, 129, 1),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 17, 24, 1),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            scale: 5,
            image: AssetImage('assets/images/onboard_background.png'),
            repeat: ImageRepeat.repeat,
            colorFilter: ColorFilter.mode(
              Color.fromRGBO(255, 255, 255, 0.08),
              BlendMode.srcIn,
            ),
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      BlocSelector<
                        UserCubit,
                        UserState,
                        ({bool nameDefined, bool levelDefined})
                      >(
                        selector: (state) => (
                          nameDefined: state.name != null,
                          levelDefined: state.cookingLevel != null,
                        ),
                        builder: (state, data) => Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                if (!data.nameDefined) {
                                  context.read<UserCubit>().setName('User');
                                }
                                if (!data.levelDefined) {
                                  context.read<UserCubit>().setCookingLevel(
                                    Difficulty.beginner,
                                  );
                                }

                                context.router.replace(
                                  const ExploreShellRoute(),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  'assets/icons/cross.svg',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 700,
                        child: PageView(
                          controller: _pageController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 16,
                                right: 16,
                              ),
                              child: _welcomePage(context),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 16,
                                right: 16,
                              ),
                              child: _detailsPage(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 16,
                                right: 16,
                              ),
                              child: _cookingLevelPage(context),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: _pageIndicator(),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocSelector<UserCubit, UserState, ({Difficulty? cookingLevel, String name})>
  _cookingLevelPage(BuildContext context) {
    return BlocSelector<
      UserCubit,
      UserState,
      ({String name, Difficulty? cookingLevel})
    >(
      selector: (state) =>
          (name: state.name ?? '', cookingLevel: state.cookingLevel),
      builder: (state, data) {
        final bool disableButton =
            data.name.length < 3 || data.cookingLevel == null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "What's Your ",
                        style: GoogleFonts.hedvigLettersSerif(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Cooking Level?',
                        style: GoogleFonts.hedvigLettersSerif(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(219, 122, 43, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const CustomText(
                  text:
                      'Help us customize your experience and set appropriate challenges',
                  nunito: true,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: TextColor.grey,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            getAdaptiveValue(
              context: context,
              mobile: _mobileCookingLevelPageCards(context, data),
              tablet: _tabletCookingLevelPageCards(context, data),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 11,
                      bottom: 11,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(24, 27, 33, 1),
                      border: Border.all(
                        color: const Color.fromRGBO(43, 46, 51, 1),
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      controller: _nameController,
                      onChanged: (value) =>
                          context.read<UserCubit>().setName(value),
                      decoration: const InputDecoration(
                        hint: CustomText(
                          text: 'Enter your name',
                          nunito: true,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: TextColor.grey,
                          maxLines: 1,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    label: "Let's Go!",
                    icon: SvgPicture.asset('assets/icons/rocket.svg'),
                    margin: EdgeInsets.zero,
                    onPressed: disableButton
                        ? null
                        : () =>
                              context.router.replace(const ExploreShellRoute()),
                    color: disableButton
                        ? const Color.fromRGBO(224, 161, 110, 1)
                        : null,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Padding _tabletCookingLevelPageCards(
    BuildContext context,
    ({Difficulty? cookingLevel, String name}) data,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () => context.read<UserCubit>().setCookingLevel(
                Difficulty.beginner,
              ),
              child: _difficultyTabletCard(
                '🍳',
                'Beginner',
                'Just starting',
                Difficulty.beginner == data.cookingLevel,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => context.read<UserCubit>().setCookingLevel(
                Difficulty.intermediate,
              ),
              child: _difficultyTabletCard(
                '👨🏻‍🍳',
                'Intermediate',
                'Cooks often, knows a few recipes',
                Difficulty.intermediate == data.cookingLevel,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () =>
                  context.read<UserCubit>().setCookingLevel(Difficulty.chef),
              child: _difficultyTabletCard(
                '🔥',
                'Chef',
                'Let me cook!',
                Difficulty.chef == data.cookingLevel,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _mobileCookingLevelPageCards(
    BuildContext context,
    ({Difficulty? cookingLevel, String name}) data,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () =>
              context.read<UserCubit>().setCookingLevel(Difficulty.beginner),
          child: _difficultyCard(
            '🍳',
            'Beginner',
            'Just starting',
            Difficulty.beginner == data.cookingLevel,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => context.read<UserCubit>().setCookingLevel(
            Difficulty.intermediate,
          ),
          child: _difficultyCard(
            '👨🏻‍🍳',
            'Intermediate',
            'Cooks often, knows a few recipes',
            Difficulty.intermediate == data.cookingLevel,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () =>
              context.read<UserCubit>().setCookingLevel(Difficulty.chef),
          child: _difficultyCard(
            '🔥',
            'Chef',
            'Let me cook!',
            Difficulty.chef == data.cookingLevel,
          ),
        ),
      ],
    );
  }

  Column _detailsPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: 'Cook, Compete, ',
                style: GoogleFonts.hedvigLettersSerif(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: 'Conquer',
                style: GoogleFonts.hedvigLettersSerif(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(219, 122, 43, 1),
                ),
              ),
            ],
          ),
        ),

        getAdaptiveValue(
          context: context,
          mobile: _mobileDetailsCards(),
          tablet: _tabletDetailsCards(),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: CustomButton(
            label: 'I Am Ready',
            icon: SvgPicture.asset('assets/icons/pot.svg'),
            margin: EdgeInsets.zero,
            onPressed: () => _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ),
      ],
    );
  }

  Padding _tabletDetailsCards() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _detailTabletCard(
            'assets/icons/timer.svg',
            'Time Each Step',
            'Follow recipe steps with built-in timers',
          ),
          const SizedBox(width: 16),
          _detailTabletCard(
            'assets/icons/medal.svg',
            'Beat The Clock',
            'Match or beat expected cooking times',
          ),
          const SizedBox(width: 16),
          _detailTabletCard(
            'assets/icons/analytics.svg',
            'Track Progress',
            'See your improvement over time',
          ),
        ],
      ),
    );
  }

  Column _mobileDetailsCards() {
    return Column(
      children: [
        _detailCard(
          'assets/icons/timer.svg',
          'Time Each Step',
          'Follow recipe steps with built-in timers',
        ),
        const SizedBox(height: 16),
        _detailCard(
          'assets/icons/medal.svg',
          'Beat The Clock',
          'Match or beat expected cooking times',
        ),
        const SizedBox(height: 16),
        _detailCard(
          'assets/icons/analytics.svg',
          'Track Progress',
          'See your improvement over time',
        ),
      ],
    );
  }

  Column _welcomePage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/icons/chef_image.svg',
          width: getAdaptiveValue(context: context, mobile: 320, tablet: 430),
          height: getAdaptiveValue(context: context, mobile: 320, tablet: 430),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 528),
          child: Column(
            children: [
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Master Your ',
                      style: GoogleFonts.hedvigLettersSerif(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Cooking Time',
                      style: GoogleFonts.hedvigLettersSerif(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(219, 122, 43, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const CustomText(
                text:
                    'Turn cooking into an exciting challenge. Race against time, improve your skills, and become a kitchen champion!',
                nunito: true,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: TextColor.grey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: CustomButton(
            label: 'Tell me more',
            icon: SvgPicture.asset('assets/icons/next_arrow.svg'),
            margin: EdgeInsets.zero,
            onPressed: () => _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ),
      ],
    );
  }

  Container _detailCard(String iconUrl, String label1, String label2) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 27, 33, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(219, 122, 43, 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              iconUrl,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Color.fromRGBO(219, 122, 43, 1),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CustomText(
                      text: label1,
                      nunito: true,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: TextColor.white,
                    ),
                  ],
                ),
                CustomText(
                  text: label2,
                  nunito: true,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: TextColor.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _detailTabletCard(String iconUrl, String label1, String label2) {
    return Container(
      width: 235,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 27, 33, 1),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(219, 122, 43, 0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: SvgPicture.asset(
              iconUrl,
              width: 60,
              height: 60,
              colorFilter: const ColorFilter.mode(
                Color.fromRGBO(219, 122, 43, 1),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: label1,
                nunito: true,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: TextColor.white,
              ),
              CustomText(
                text: label2,
                nunito: true,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: TextColor.grey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  AnimatedContainer _difficultyCard(
    String emoji,
    String label1,
    String label2,
    bool selected,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 27, 33, 1),
        borderRadius: BorderRadius.circular(12),
        border: selected
            ? Border.all(color: const Color.fromRGBO(219, 122, 43, 1))
            : null,
      ),
      child: Row(
        children: [
          CustomText(
            text: emoji,
            nunito: true,
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: TextColor.white,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CustomText(
                      text: label1,
                      nunito: true,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: TextColor.white,
                    ),
                  ],
                ),
                CustomText(
                  text: label2,
                  nunito: true,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: TextColor.grey,
                ),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: !selected
                ? SvgPicture.asset(
                    'assets/icons/selection_circle.svg',
                    width: 24,
                    height: 24,
                    colorFilter: selected
                        ? const ColorFilter.mode(
                            Color.fromRGBO(219, 122, 43, 1),
                            BlendMode.srcIn,
                          )
                        : null,
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      if (selected) ...[
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(219, 122, 43, 1),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/check.svg',
                          width: 18,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer _difficultyTabletCard(
    String emoji,
    String label1,
    String label2,
    bool selected,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 235,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 27, 33, 1),
        borderRadius: BorderRadius.circular(16),
        border: selected
            ? Border.all(color: const Color.fromRGBO(219, 122, 43, 1))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: emoji,
                nunito: true,
                fontSize: 38,
                fontWeight: FontWeight.w400,
                color: TextColor.white,
              ),
              const Spacer(),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                child: !selected
                    ? SvgPicture.asset(
                        'assets/icons/selection_circle.svg',
                        width: 24,
                        height: 24,
                        colorFilter: selected
                            ? const ColorFilter.mode(
                                Color.fromRGBO(219, 122, 43, 1),
                                BlendMode.srcIn,
                              )
                            : null,
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          if (selected) ...[
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(219, 122, 43, 1),
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/check.svg',
                              width: 18,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ],
                      ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomText(
                    text: label1,
                    nunito: true,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: TextColor.white,
                  ),
                ],
              ),
              CustomText(
                text: label2,
                nunito: true,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: TextColor.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
