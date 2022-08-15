import 'package:debitapp_bloc/presentation/screens/home/widgets/custom_sliver.dart';
import 'package:debitapp_bloc/presentation/screens/home/widgets/debit_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage("asset/images/avatar.jpeg")),
                Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.black,
                )
              ]),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 177, 217, 248),
        body: const SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: CustomSliverAppBarDelegate(expandedHeight: 220)),
              SliverToBoxAdapter(child: DebitListWidget())
            ],
          ),
        ));
  }
}
