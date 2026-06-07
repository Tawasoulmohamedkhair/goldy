import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/features/sliver/data/model/sliver_model.dart';
import 'package:goldy/features/sliver/data/repo/sliver_repo.dart';

part 'sliver_state.dart';

class SliverCubit extends Cubit<SliverState> {
  final SliverRepo sliverRepo;
  SliverCubit(this.sliverRepo) : super(SliverInitialState());

  Future<void> getSliver() async {
    emit(SliverLoadingState());
    final result = await sliverRepo.getSliver();

    result.fold(
      (error) => emit(SliverErrorState(error)),
      (sliverModel) => emit(SliverLoadedState(sliverModel: sliverModel)),
    );
  }
}
