import 'package:flutter/material.dart';
import 'package:la_vie_odc/layout/shop/shop_home.dart';
import 'package:la_vie_odc/modules/login/login_cubit.dart';
import 'package:la_vie_odc/network/local/cache_helper.dart';
import 'package:la_vie_odc/shared/components/components.dart';
import 'package:la_vie_odc/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // = TabController(length: 2, vsync: this);
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is LoginSuccessfulState) {
            if (state.userModel.type == "Success") {
              CacheHelper.saveData(
                      key: 'refreshToken',
                      value: state.userModel.data!.refreshToken)
                  .then((value) => CacheHelper.saveData(
                          key: 'accessToken',
                          value: state.userModel.data!.accessToken)
                      .then((value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShopHome()))));
            } else {
              print('Error ya zefta');
            }
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/login_background.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.only(
                    top: 200,
                    left: 40,
                    right: 40,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.maxFinite,
                          // height: 300,
                          child: TabBar(
                            controller: _tabController,
                            labelColor: green,
                            unselectedLabelColor: Colors.grey,
                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: const [
                              Tab(
                                text: 'Sign up',
                              ),
                              Tab(
                                text: 'Login',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 300,
                          // height: double.maxFinite,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              signupBuilder(context: context, state: state),
                              loginBuilder(context: context, state: state),
                            ],
                          ),
                        ),
                        textWithLines(),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
