import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_odc/models/user_model/user_model.dart';
import 'package:la_vie_odc/network/local/cache_helper.dart';
import 'package:la_vie_odc/network/remote/dio_helper.dart';
import 'package:la_vie_odc/shared/components/constants.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // TextEditingController emailController = TextEditingController();
  //  TextEditingController passwordController= TextEditingController();

  static LoginCubit get(context) => BlocProvider.of(context);
  late UserModel userModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
            data: {'email': email, 'password': password}, path: LOGIN)
        .then((value) {
      print("@Cubit");
      userModel = UserModel.fromJson(value.data);
      CacheHelper.saveData(
          key: 'accessToken', value: userModel.data!.accessToken);
      print(userModel.data!.accessToken);
      emit(LoginSuccessfulState(userModel));
      print(value.data);
    }).catchError((e) {
      emit(LoginErrorState(e.toString()));
      print(e);
    });
  }

  void userSignup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(data: {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName
    }, path: SIGNUP)
        .then((value) {
      print("@Cubit");

      print(value.toString());
      // emit(LoginSuccessfulState(userModel));
      // print(value.data);
    }).catchError((e) {
      emit(LoginErrorState(e.toString()));
      print(e);
    });
  }
}
