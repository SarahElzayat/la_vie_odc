import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_odc/home.dart';
import 'package:la_vie_odc/layout/login_signup/login_signup.dart';
import 'package:la_vie_odc/layout/shop/shop_home.dart';
import 'package:la_vie_odc/modules/shop/shop_cubit.dart';
import 'package:la_vie_odc/network/local/cache_helper.dart';
import 'package:la_vie_odc/network/remote/dio_helper.dart';
import 'package:la_vie_odc/shared/components/components.dart';
import 'package:la_vie_odc/shared/components/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  DioHelper.init();
   // ShopCubit().getAllProducts();
  token = CacheHelper.getData(key: 'accessToken');
  print(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getAllProducts()..getAllBlogs(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: green,
          textTheme: TextTheme(
            bodyText1: GoogleFonts.roboto(
                fontSize: 18,
                color: myGrey,
                fontWeight: FontWeight.w500),
            bodyText2: GoogleFonts.roboto(
                fontSize: 16,
                color: myGrey,
                fontWeight: FontWeight.w500),
          ),
        ),
        home: CacheHelper.getData(key: 'accessToken') != null
            ? ShopHome()
            : AnimatedSplashScreen(
                splash: splashScreenBuillder(),
                nextScreen: const LoginSignupScreen(),
                duration: 0,
                splashTransition: SplashTransition.fadeTransition,
              ),
      ),
    );
  }
}
