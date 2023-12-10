import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/posts_data_ui_model.dart';
import '../repos/post_repo.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitalFetchEvent>(postsInitalFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitalFetchEvent(
      PostsInitalFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostFetchingLoadingState());
    List<PostsDataUiModel> posts = await PostsRepo.fetchPosts();

    emit(PostFetchingSuccesfulState(posts: posts));
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPost();
    if (success) {
      emit(PostAdditionSuccesssState());
    } else {
      emit(PostAdditionErrorState());
    }
  }
}
