import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_odc/models/all_products/products_model.dart';

import '../../../modules/shop/shop_cubit.dart';
import '../../../shared/components/constants.dart';
import '../search_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HashSet<String> products;
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // ShopCubit.get(context).getAllProducts();
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 20,
                ),
                searchBar(),
                ConditionalBuilder(
                  condition: ShopCubit.get(context).productsModel != null,
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                  builder: (context) => GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 15,
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
                          MaterialButton(
                            onPressed: () {
                              print(ShopCubit.get(context)
                                  .productsModel!
                                  .data![index]
                                  .name
                                  .toString()
                                  .toUpperCase());
                            },
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            elevation: 10,
                            color: green,
                            child: Text(
                              'Add To Cart',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
