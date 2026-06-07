import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/widgets/app_bar_custom.dart';
import 'package:goldy/core/widgets/metal_details_card.dart';
import 'package:goldy/features/sliver/data/repo/sliver_repo.dart';
import 'package:goldy/features/sliver/presentation/cubit/sliver_cubit.dart';

class SliverScreen extends StatefulWidget {
  const SliverScreen({super.key});

  @override
  State<SliverScreen> createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  @override
  void initState() {
    super.initState();

    context.read<SliverCubit>().getSliver();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SliverCubit(SliverRepo())..getSliver(),
      child: Scaffold(
        backgroundColor: AppColors.navBlue,

        appBar: AppBarCustom(
          title: AppStrings.silvertracker,
          color2: AppColors.sliverColor,
        ),

        body: BlocBuilder<SliverCubit, SliverState>(
          builder: (context, state) {
            if (state is SliverLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is SliverErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            if (state is SliverLoadedState) {
              final data = state.sliverModel;

              return MetalDetailsCard(
                name: data.name,
                price: data.price,
                symbol: data.symbol,
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
