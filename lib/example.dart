import 'package:flutter/material.dart';
import 'package:scratch_award_widget/scratch_award_widget.dart';

void main() {
  runApp(ScratchPage());
}

class ScratchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 300,
            height: 200,
            child: ScratchAwardWidget(
              Size(300, 200),
              Text(
                "我是抽奖信息",
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
              maskColor: Colors.red,
              borderRadius: 30,
            ),
          ),
        ),
      ),
    );
  }
}
