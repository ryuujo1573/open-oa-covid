import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_pms_flutter/models/todo_info.dart';
import 'package:open_pms_flutter/widgets/home_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<TodoInfo>> _futureTodoInfos;

  @override
  void initState() {
    super.initState();
    var dio = Dio()..options.baseUrl = "http://127.0.0.1:8000/api/v1/pms";

    _futureTodoInfos = dio.get<List<TodoInfo>>('/todo/all').then((value) {
      if (value.statusCode == 200) {
        print('API: 200 OK!');
        return value.data!;
      } else {
        print('API: get nothing!');
        return [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Wow, now this is the home page.',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: HomeWidget(
              name: "To-Do List",
              icon: Icon(Icons.today_rounded),
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
