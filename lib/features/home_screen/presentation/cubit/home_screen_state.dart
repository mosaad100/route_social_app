part of 'home_screen_cubit.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class GetPostsLoadingSate extends HomeScreenState {}

class GetPostsSuccessSate extends HomeScreenState {}




class LikeState extends HomeScreenState {}

class GetPostsFailureSate extends HomeScreenState {
  final Failures failures;

  const GetPostsFailureSate({
    required this.failures,
  });
}
