import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_pms_flutter/pages/home.dart';
import 'package:open_pms_flutter/pages/personal.dart';
import 'package:open_pms_flutter/pages/workbench.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static var currentPage = 0;
  static var pages = List.unmodifiable([
    const MyHomePage(),
    const WorkbenchPage(),
    const PersonalPage(),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        cardTheme: const CardTheme(
          elevation: 4,
          // color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
      ),
      home: StatefulBuilder(builder: (context, setState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Open PMS"),
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: pages[currentPage],
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (i) => setState(() {
              currentPage = i;
            }),
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                      height: 10,
                      child: Builder(builder: (context) {
                        var iconSize = IconTheme.of(context).size ?? 16;
                        const factor = 1.8;
                        var dimension = iconSize * factor;
                        var radius = iconSize * (factor - 1) / 2;
                        return OverflowBox(
                          maxHeight: double.infinity,
                          maxWidth: double.infinity,
                          child: Container(
                            width: dimension,
                            height: dimension,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: Colors.black12,
                            ),
                            // child: Container(
                            // ),
                          ),
                        );
                      }),
                    ),
                    const Icon(Icons.apps),
                  ],
                ),
                label: "Workbench",
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "User",
              ),
            ],
            currentIndex: currentPage,
          ),
        );
      }),
    );
  }
}
