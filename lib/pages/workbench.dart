import 'package:flutter/material.dart';

class WorkbenchPage extends StatefulWidget {
  const WorkbenchPage({super.key});

  @override
  State<WorkbenchPage> createState() => _WorkbenchPageState();
}

class _WorkbenchPageState extends State<WorkbenchPage> {
  @override
  Widget build(BuildContext context) {
    const aspectRatio = 21 / 9;
    return IconTheme(
      data: const IconThemeData(size: 36),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: aspectRatio,
          mainAxisSpacing: 20,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          var iconDimension = IconTheme.of(context).size ?? 24;
          return Card(
            child: LayoutBuilder(builder: (context, constraints) {
              // assert(
              //     constraints.maxWidth / aspectRatio == constraints.maxHeight);
              var d = (constraints.maxHeight - iconDimension * 1.2) / 2;
              return Padding(
                padding: EdgeInsets.all(d),
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(right: d),
                    width: iconDimension * 1.2,
                    height: iconDimension * 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(d),
                      color: Colors.black12,
                    ),
                    child: Icon(Icons.baby_changing_station),
                  ),
                  Expanded(
                      child: Text(
                    "${constraints.biggest}",
                  ))
                ]),
              );
            }),
          );
        },
      ),
    );
  }
}
