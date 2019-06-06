# scratch_award_widget

scratch_award_widget

## Getting Started

scratch_award_widget

flutter 刮奖 widget

## Using



```dart
class ScratchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          child: ScratchAwardWidget(
              Size(300, 200),
              Text(
                "我是抽奖信息",
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),maskColor: Colors.red,borderRadius: 30,),
        ),
      ),
    );
  }
}
```
