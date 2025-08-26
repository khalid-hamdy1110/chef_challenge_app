import 'package:auto_route/auto_route.dart';
import 'package:chef_challenge_project/models.dart';
import 'package:chef_challenge_project/states/user/user_cubit.dart';
import 'package:chef_challenge_project/states/user/user_state.dart';
import 'package:chef_challenge_project/widgets/custom_text.dart';
import 'package:chef_challenge_project/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: CustomText(
                  text: 'History',
                  nunito: false,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: TextColor.white,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              BlocSelector<UserCubit, UserState, List<RecipeHistory>>(
                selector: (state) => state.history,
                builder: (context, history) {
                  if (history.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CustomText(
                          text: 'No History',
                          nunito: false,
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                          color: TextColor.white,
                        ),
                      ),
                    );
                  }
                  return SliverList.builder(
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      return RecipeHistoryCard(recipeHistory: history[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
