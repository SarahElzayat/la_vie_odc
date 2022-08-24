import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:la_vie_odc/layout/shop/search_bar.dart';
import 'package:la_vie_odc/modules/shop/shop_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_odc/shared/components/constants.dart';

class ShopHome extends StatelessWidget {
  const ShopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);

        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            onPressed: () {
              cubit.changeBottom(2);
            },
            child: Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [cubit.bottomNavBarScreens[cubit.currentIndex]],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              elevation: 30,
              shape: CircularNotchedRectangle(),
              notchMargin: 10,

              // onTap: (index) {
              //   cubit.changeBottom(index);
              // },
              // currentIndex: cubit.currentIndex,
              // shape:
              child: Container(
                height: 60,
                child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // BottomNavigationBarItem(
                    //     icon: Icon(Icons.energy_savings_leaf_outlined), label: ''),
                    // BottomNavigationBarItem(
                    //     icon: Icon(Icons.document_scanner_outlined), label: ''),
                    // BottomNavigationBarItem(
                    //     icon: Icon(Icons.notifications_none), label: ''),
                    // BottomNavigationBarItem(
                    //     icon: Icon(Icons.person_outline), label: ''),
                    IconButton(
                      icon: Icon(
                        Icons.energy_savings_leaf,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        cubit.changeBottom(0);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.document_scanner_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        cubit.changeBottom(1);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        cubit.changeBottom(3);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        cubit.changeBottom(4);
                      },
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
