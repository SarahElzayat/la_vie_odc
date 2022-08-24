import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_odc/modules/shop/shop_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/constants.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen>
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
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fill,
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Container(
                        width: double.maxFinite,
                        height: 70,
                        // height: 300,
                        child: TabBar(
                          controller: _tabController,
                          labelColor: green,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(
                              text: 'Blogs',
                            ),
                            Tab(
                              text: 'Forums',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            blogsBuilder(context),
                            forumsBuilder(),
                          ],
                        ),
                      ),
                      // textWithLines(),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}

Widget blogsBuilder(context) {
  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 1,
    // mainAxisSpacing: 50,
    // crossAxisSpacing: 15,
    childAspectRatio: 1 / 1.4,
    children: List.generate(
      ShopCubit.get(context).productsModel!.data!.length,
          (index) => Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: NetworkImage(BASE +
                  ShopCubit.get(context)
                      .productsModel!
                      .data![index]
                      .imageUrl
                      .toString()),
              width: 140,
              height: 170,
              // fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ShopCubit.get(context)
                      .productsModel!
                      .data![index]
                      .name
                      .toString()
                      .toUpperCase(),
                  textAlign: TextAlign.center,

                  // softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  ShopCubit.get(context)
                      .productsModel!
                      .data![index]
                      .price
                      .toString()
                      .toUpperCase() +
                      ' EGP',
                  textAlign: TextAlign.center,

                  // softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  // maxLines: 2,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),

              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget forumsBuilder() {
  return Text('forums');
}
