import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/widgets/app_bar_custom.dart';
import 'package:goldy/core/widgets/metal_details_card.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';
import 'package:goldy/features/gold/presentation/cubit/gold_cubit.dart';

class GoldScreen extends StatefulWidget {
  const GoldScreen({super.key});

  @override
  State<GoldScreen> createState() => _GoldScreenState();
}

class _GoldScreenState extends State<GoldScreen> {
  late final GoldCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = GoldCubit(GoldRepo())..getGold();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: AppColors.navBlue,
        appBar: AppBarCustom(
          title: AppStrings.goldtracker,
          color2: AppColors.goldColor,
          color3: AppColors.goldColor,
        ),
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            if (state is GoldLoadingState) {
              return const Center(child: CircularProgressIndicator(
                color: AppColors.goldColor,
              ));
            } else if (state is GoldError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.red, fontSize: 16),
                  ),
                ),
              );
            } else if (state is GoldLoadedState) {
              final data = state.goldModel;

              return MetalDetailsCard(
                image: AppImages.goldImage,
                color: AppColors.goldColor,
                name: data.name, price: data.price);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
