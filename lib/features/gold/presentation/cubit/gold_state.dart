part of 'gold_cubit.dart';

abstract class GoldState extends Equatable {
  const GoldState();

  @override
  List<Object> get props => [];
}

class GoldInitialState extends GoldState {}

class GoldLoadingState extends GoldState {}

class GoldLoadedState extends GoldState {
  const GoldLoadedState({required this.goldModel});
  final GoldModel goldModel;

  @override
  List<Object> get props => [goldModel];
}

class GoldError extends GoldState {
  final String message;

  const GoldError(this.message);

  @override
  List<Object> get props => [message];
}
