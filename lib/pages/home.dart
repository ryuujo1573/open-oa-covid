import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:open_pms_flutter/generated/bodytemp_service.pbgrpc.dart';
import 'package:open_pms_flutter/models/todo_info.dart';
import 'package:open_pms_flutter/widgets/home_widget.dart';
import 'package:grpc/grpc.dart' as grpc;

import '../utilities/jojo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<TodoInfo>> _futureTodoInfos;

  final _channel = grpc.ClientChannel(
    'localhost',
    port: 8000,
    options: const grpc.ChannelOptions(
      credentials: grpc.ChannelCredentials.insecure(),
    ),
  );
  var homo = <Widget>[];

  @override
  void initState() {
    super.initState();
    _futureTodoInfos = Jojo().getTodoAll();
  }

  @override
  Widget build(BuildContext context) {
    homo = [
      const Center(
        child: Text(
          'Wow, now this is the home page.',
        ),
      ),
      HomeWidget(
        name: const Text("To-Do List"),
        icon: const Icon(Icons.today_rounded),
        children: [
          Expanded(
            child: FutureBuilder<List<TodoInfo>>(
              future: _futureTodoInfos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var info = data[index];

                      return ListTile(
                        leading: Container(
                          color: Colors.black12,
                          child: const Icon(Icons.science),
                        ),
                        title: Text(info.description ?? info.todoType),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
      const HomeWidget(
        name: Text('Annoucements'),
        icon: Icon(Icons.announcement),
        children: [Text("Good Morning, MY NEIGHBORS!")],
      ),
      HomeWidget(
        name: const Text('Temperature Monitor'),
        icon: const Icon(Icons.health_and_safety),
        children: [
          Container(
            height: 40,
            child: Builder(builder: (context) {
              final client = BodyTempServiceClient(_channel);
              var stream =
                  client.listRecent(BodyTempQuery(userId: 'tadokoro-kouji'));

              var list = [];
              return StreamBuilder<BodyTemp>(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return BrnExpandableText(
                      text: snapshot.error.toString(),
                      maxLines: 2,
                    );
                  } else if (snapshot.hasData) {
                    list.add(snapshot.data!);
                    
                  }
                },
              );
            }),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Colors.green, Colors.yellow, Colors.red]
                .map(
                  (e) => GestureDetector(
                    onTap: () async {
                      final client = BodyTempServiceClient(_channel);
                      var result = await client.recordBodyTemp(BodyTempRecord(
                        temp: 114.514,
                        timestamp: 114513,
                        userId: "tadokoro-kouji",
                      ));
                      print('fine! ${result.code}');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: e,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      width: 48,
                      height: 48,
                      child: const Icon(
                        Icons.done,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                )
                .toList(),
          ))
        ],
      ),
    ];
    return Container(
      alignment: Alignment.center,
      color: Colors.grey.shade100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16.0),
        // mainAxisAlignment: MainAxisAlignment.center,
        itemBuilder: ((context, index) => homo[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 30),
        itemCount: homo.length,
      ),
    );
  }
}
