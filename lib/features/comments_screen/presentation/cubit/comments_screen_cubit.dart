import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/comments_screen/data/datasources/remote.dart';
import 'package:social_media_app/features/comments_screen/data/repositories/get_comments_data_repo.dart';
import 'package:social_media_app/features/comments_screen/domain/entities/comment_entity.dart';
import 'package:social_media_app/features/comments_screen/domain/usecases/get_comments_usecase.dart';

part 'comments_screen_state.dart';

class CommentsScreenCubit extends Cubit<CommentsScreenState> {
  TextEditingController commentController = TextEditingController();
  List<CommentEntity> comments = [];

  CommentsScreenCubit() : super(CommentsScreenInitial()) {
    focusNode.hasFocus;
  }

  static CommentsScreenCubit get(context) => BlocProvider.of(context);
  final FocusNode focusNode = FocusNode();

  final listController = ScrollController();

  getComments() async {
    emit(GetCommentsLoadingSate());

    GetCommentsDataRepo getCommentsDataRepo =
        GetCommentsDataRepo(getCommentsDataSource: Remote());
    GetCommentsUseCase getCommentsUsecase =
        GetCommentsUseCase(getCommentsDomainRepo: getCommentsDataRepo);
    var result = await getCommentsUsecase.call();
    result.fold((l) async {
      print(l);
      emit(GetCommentsFailureSate(failures: l));
    }, (r) {
      comments.addAll(r);

      emit(GetCommentsSuccessSate());
    });
  }

  like(CommentEntity comment) {
    int index = comments.indexOf(comment);
    comments[index].like = !comments[index].like;
    if (comments[index].like) {
      comments[index].likes++;
    } else {
      comments[index].likes--;
    }
    emit(LikeState());
    emit(CommentsScreenInitial());
  }

  goToTextField() {
    listController.animateTo(listController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    emit(GoToTextField());
    emit(CommentsScreenInitial());
  }

  addComment(CommentEntity commentEntity) {
    commentEntity.body = commentController.text;
    if (commentController.text.trim() != '') {
      comments.add(commentEntity);
      commentController.clear();
      focusNode.unfocus();
      listController.jumpTo(listController.position.maxScrollExtent);
      emit(AddCommentState());
      emit(CommentsScreenInitial());
    }
  }
}
