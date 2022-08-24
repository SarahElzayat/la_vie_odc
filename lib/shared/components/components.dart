import 'package:flutter/material.dart';
import 'package:la_vie_odc/network/local/cache_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie_odc/shared/components/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../modules/login/login_cubit.dart';

Widget splashScreenBuillder() {
  // CacheHelper.saveData(key: 'splash', value: true);
  return const Center(
    child: Image(
      image: AssetImage('assets/images/logo.png'),
    ),
  );
}

//
Widget loginBuilder({required context, required state}) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  return Column(
    children: [
      defaultTextFormFiled(
        label: 'Email',
        context: context,
        radius: 5,
        textController: emailController,
      ),
      const SizedBox(
        height: 40,
      ),
      defaultTextFormFiled(
        label: 'Password',
        context: context,
        radius: 5,
        textController: passwordController,
        obsecure: true,
      ),
      SizedBox(
        height: 40,
      ),
      ConditionalBuilder(
        condition: state is! LoginLoadingState,
        builder: (context) => defaultButton(
          text: 'Login',
          backgroundColor: '#1ABC00',
          onPressed: () {
            LoginCubit.get(context).userLogin(
                email: emailController.text, password: passwordController.text);
          },
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
    ],
  );
}

Widget signupBuilder({required context, required state}) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'First name',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(height: 4),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    controller: firstNameController,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last name',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    controller: lastNameController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Email',
        style: Theme.of(context).textTheme.bodyText2,
      ),
      SizedBox(
        height: 4,
      ),
      SizedBox(
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
            //

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          controller: emailController,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Password',
        style: Theme.of(context).textTheme.bodyText2,
      ),
      SizedBox(
        height: 4,
      ),
      SizedBox(
        height: 40,
        // width: 373,
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              // borderSide:  BorderSide(),
            ),
          ),
          controller: passwordController,
        ),
      ),
      SizedBox(
        height: 36,
      ),
      Center(
        child: Container(
          width: double.infinity,
          height: 45,
          child: defaultButton(
              text: 'Sign up',
              backgroundColor: '#1ABC00',
              onPressed: () {
                LoginCubit.get(context).userSignup(
                    email: emailController.text,
                    password: passwordController.text,
                    lastName: lastNameController.text,
                    firstName: firstNameController.text);
              }),
        ),
      ),
    ],
  );
}

Widget defaultTextFormFiled({
  double height = 40,
  double radius = 10,
  required String label,
  double verticalSpacing = 5,
  double horizontalSpacing = 10,
  required context,
  required TextEditingController textController,
  obsecure = false,
  // textColor = Colors.grey,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyText2),
        SizedBox(
          height: verticalSpacing,
          width: horizontalSpacing,
        ),
        SizedBox(
          height: 40,
          // width: 373,
          child: TextFormField(
            obscureText: obsecure,
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                // borderSide:  BorderSide(),
              ),
            ),
          ),
        ),
      ],
    );

Widget defaultButton({
  required String text,
  double fontSize = 16,
  double padding = 5.0,
  String backgroundColor = '#F6F6F6',
  textColor = Colors.white,
  required onPressed,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor(backgroundColor),
        borderRadius: BorderRadius.all(Radius.circular(padding)),
      ),
      child: MaterialButton(
        // color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.roboto(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

Widget textWithLines({text = 'or continue with'}) => Row(
      children: <Widget>[
        Flexible(
          child: Divider(
            color: Colors.grey[300],
            height: 4,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            text,
            style: TextStyle(
                backgroundColor: Colors.white, color: Colors.grey[400]),
          ),
        ),
        Flexible(
          child: Divider(
            color: Colors.grey[300],
            height: 4,
            thickness: 2,
          ),
        ),
      ],
    );
