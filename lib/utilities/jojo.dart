// import 'package:dio/dio.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:open_pms_flutter/models/todo_info.dart';

class Jojo {
  Jojo._();
  static final Jojo _instance = Jojo._();
  factory Jojo() => _instance;


  // final Dio dio = Dio()..options.baseUrl = 'http://127.0.0.1:8000/api/mock/pms';

  Future<List<TodoInfo>> getTodoAll() async {
    return [];
    // var resp = await dio.get<List<dynamic>>('/todo/all');
    // if (resp.statusCode == 200) {
    //   return resp.data!.map((e) => TodoInfo.fromJson(e)).toList();
    // } else {
    //   return [];
    // }
  }
}
