library scratch_award_widget;

import 'package:flutter/material.dart';

class ScratchAwardWidget extends StatefulWidget {
  final Widget child;
  final Size size;
  final Color maskColor;
  final double borderRadius;

  ScratchAwardWidget(this.size, this.child,
      {this.maskColor, this.borderRadius = 5});

  @override
  State<StatefulWidget> createState() {
    return _ScratchAwardWidgetState(maskColor);
  }
}

class _ScratchAwardWidgetState extends State<ScratchAwardWidget> {
  final Color _maskColor;
  List<Offset> _points = <Offset>[];

  _ScratchAwardWidgetState(
      this._maskColor,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Stack(
          children: [
            Center(
              child: widget.child,
            ),
            CustomPaint(
                size: widget.size,
                painter: _ScratchAwardPainter(_points, maskColor: _maskColor)),
            GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                RenderBox referenceBox = context.findRenderObject();
                Offset localPosition =
                referenceBox.globalToLocal(details.globalPosition);
                setState(() {
                  _points = List.from(_points)..add(localPosition);
                });
              },
              onPanEnd: (DragEndDetails details) => _points.add(null),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScratchAwardPainter extends CustomPainter {
  _ScratchAwardPainter(
      this.points, {
        Color maskColor,
      }) {
    maskPaint = new Paint()
      ..color = maskColor ?? Color(0xff000000)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    linePaint = new Paint()
      ..strokeCap = StrokeCap.round
      ..blendMode = BlendMode.clear
      ..strokeWidth = 20.0;
  }

  final List<Offset> points;
  Paint maskPaint;
  Paint linePaint;

  void paint(Canvas canvas, Size size) {
    //保证混合后是无底色的。
    canvas.saveLayer(Offset.zero & size, Paint());

    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), maskPaint);

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], linePaint);
    }

    canvas.restore();
  }

  bool shouldRepaint(_ScratchAwardPainter other) => other.points != points;
}
