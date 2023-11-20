import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/home_screen/data/datasources/remot.dart';
import 'package:social_media_app/features/home_screen/data/repositories/get_posts_data_repo.dart';
import 'package:social_media_app/features/home_screen/domain/entities/post_data_entity.dart';
import 'package:social_media_app/features/home_screen/domain/entities/user_entity.dart';
import 'package:social_media_app/features/home_screen/domain/usecases/get_posts_usecase.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  List<PostDataEntity> posts = [];
  UserEntity? currentUser;
  int tab = 0;
  int page = 0;

  HomeScreenCubit() : super(HomeScreenInitial());
  final listViewController = ScrollController();

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  getPosts() async {
    page++;
    emit(GetPostsLoadingSate());
    Random random = Random();

    GetPostsDataRepo getPostsDataRepo =
        GetPostsDataRepo(getPostsDataSource: Remote());
    GetPostsUsecase getPostsUsecase =
        GetPostsUsecase(getPostsDomainRepo: getPostsDataRepo);
    var result = await getPostsUsecase.call(page);
    result.fold((l) async {
      print(l);
      emit(GetPostsFailureSate(failures: l));
    }, (r) {
      posts.addAll(r);

      if (currentUser == null) {
        int index = random.nextInt(r.length);
        currentUser = posts[index].userDataEntity;
      }

      emit(GetPostsSuccessSate());
    });
  }

  Future refresh() async {
    posts.clear();
    await getPosts();
  }

  like(PostDataEntity post) {
    int index = posts.indexOf(post);
    posts[index].postDataEntity.like = !posts[index].postDataEntity.like;
    if (posts[index].postDataEntity.like) {
      posts[index].postDataEntity.likes++;
    } else {
      posts[index].postDataEntity.likes--;
    }
    emit(LikeState());
    emit(HomeScreenInitial());
  }

  goToTop() {
    listViewController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    emit(GoToTop());
    emit(Tab0State());
  }

  changeTab(int index) {
    tab = index;
    if (index == 0) {
      goToTop();
    } else {
      switch (index) {
        case 0:
          emit(Tab0State());

        case 1:
          emit(Tab1State());
        case 2:
          emit(Tab2State());
        case 3:
          emit(Tab3State());
      }
    }
  }
}
