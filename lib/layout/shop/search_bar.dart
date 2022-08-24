import 'package:flutter/material.dart';

import '../../network/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/components/constants.dart';
Widget searchBar() =>  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: SizedBox(
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: HexColor("#F8F8F8"),
              ),
            ),
            filled: true,
            fillColor: HexColor('#F6F6F6'),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'Search',
            hintStyle: GoogleFonts.roboto(
              fontSize: 20,
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: HexColor("#F8F8F8"),
                // color: Colors.white
              ),
            ),
          ),
        ),
      ),
    ),
    const SizedBox(
      width: 16,
    ),
    Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HexColor(AHMED),
      ),
      child: IconButton(
        onPressed: () {
          DioHelper.getData(query: {}, path: 'PRODUCTS').then((value) {
            print(value.data.toString());
          });
        },
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
      ),
    ),
  ],
);