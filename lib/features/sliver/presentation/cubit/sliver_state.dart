part of 'sliver_cubit.dart';

abstract class SliverState extends Equatable {
  const SliverState();

  @override
  List<Object> get props => [];
}

class SliverInitialState extends SliverState {}

class SliverLoadingState extends SliverState {}
class SliverLoadedState extends SliverState {
final SliverModel sliverModel;
const SliverLoadedState({required this.sliverModel});
}

class SliverErrorState extends SliverState {
  final String message;

  const SliverErrorState(this.message);

  @override
  List<Object> get props => [message];
}
