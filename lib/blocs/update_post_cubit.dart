import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio_bloc/blocs/update_post_state.dart';
import 'package:dio_bloc/model/post_model.dart';
import 'package:dio_bloc/services/dio_service.dart';
import 'package:flutter/material.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInit());
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  apiPostUpdate(Post post) async {
    print(post.toJson());
    emit(UpdatePostLoading());

    var response = await Network.PUT(
        Network.BASE + Network.API_UPDATE + post.id.toString(),
        Network.paramsUpdate(
            Post(
                userId: post.userId,
                id: post.id,
                title: titleTextEditingController.text,
                body: bodyTextEditingController.text
            )
        )
    );

    if (response != null) {
      emit(UpdatePostLoaded(isUpdate: true));
    } else {
      emit(UpdatePostError(error: "Culdn't update post"));
    }
  }
}