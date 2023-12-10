part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostActionState extends PostsState {}

final class PostsInitial extends PostsState {}

class PostFetchingLoadingState extends PostsState {}

class PostFetchingErrorState extends PostsState {}

class PostFetchingSuccesfulState extends PostsState {
  final List<PostsDataUiModel> posts;

  PostFetchingSuccesfulState({required this.posts});
}

class PostAdditionSuccesssState extends PostActionState {}

class PostAdditionErrorState extends PostActionState {}
