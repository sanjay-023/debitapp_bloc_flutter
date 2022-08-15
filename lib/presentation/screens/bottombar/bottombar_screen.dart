import 'package:debitapp_bloc/presentation/screens/Articles/articleview.dart';
import 'package:debitapp_bloc/presentation/screens/History/historyview.dart';
import 'package:debitapp_bloc/presentation/screens/add/addview.dart';
import 'package:debitapp_bloc/presentation/screens/home/homeview.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexValueNotifier = ValueNotifier(0);

class BottomBarView extends StatelessWidget {
  BottomBarView({Key? key}) : super(key: key);
  final pages = [
    const HomeView(),
    const HistoryView(),
    const ArticlesView(),
    const AddView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexValueNotifier,
          builder: (context, int index, _) {
            return pages[indexValueNotifier.value];
          }),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: indexValueNotifier,
          builder: (context, int newIndex, _) {
            return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: newIndex,
                selectedItemColor: Colors.black,
                onTap: (index) {
                  indexValueNotifier.value = index;
                },
                items: [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "Home"),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.light), label: "Articles"),
                  BottomNavigationBarItem(
                      icon: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 157, 243, 28),
                            borderRadius: BorderRadius.circular(14)),
                        child: const Icon(Icons.add),
                      ),
                      label: ""),
                ]);
          }),
    );
  }
}
