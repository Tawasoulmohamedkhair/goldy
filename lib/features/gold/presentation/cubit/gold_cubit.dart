import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/features/gold/data/model/gold_model.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';

part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldRepo goldRepo;

  GoldCubit(this.goldRepo) : super(GoldInitialState());

  Future<void> getGold() async {

    emit(GoldLoadingState());

    final result = await goldRepo.getGold();


    result.fold(
      (error) {
        emit(GoldError(error));
      },
      (goldModel) {
        emit(GoldLoadedState(goldModel: goldModel));
      },
    );
  }
}
