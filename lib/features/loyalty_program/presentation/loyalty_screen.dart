import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steak_dream/features/loyalty_program/presentation/bloc/loyalty_bloc.dart';
import 'package:steak_dream/features/loyalty_program/presentation/bloc/loyalty_state.dart';
import 'widgets/loyalty_progress_card.dart';

@RoutePage()
class LoyaltyScreen extends StatelessWidget {
  const LoyaltyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<LoyaltyBloc, LoyaltyState>(
        builder: (context, state) {
          if (state is LoyaltyLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoyaltyLoaded) {
            return LoyaltyProgressCard(loyalty: state.loyalty);
          } else if (state is LoyaltyError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
