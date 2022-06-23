import 'package:calculator/calculator_new_app.dart';
import 'package:flutter/material.dart';




class NewContainer extends StatefulWidget {
  final bool darkmood;
  final Widget? child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  NewContainer({required this.darkmood, this.child, this.borderRadius, this.padding});

  @override
  State<NewContainer> createState() => _NewContainerState();
}

class _NewContainerState extends State<NewContainer> {
  bool _isPressed = false;

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;

    });
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    bool darkmode=widget.darkmood;
    return Listener(
        onPointerUp: _onPointerUp,
        onPointerDown: _onPointerDown,
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
              color:darkmode?bacgroundDark:bacgroundLight,
              borderRadius: widget.borderRadius,
              boxShadow: _isPressed
                  ? null
                  : [
                      BoxShadow(
                          color:darkmode?Colors.black54 :Colors.blueGrey.shade200,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: darkmode?Colors.blueGrey.shade600 :Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0)
                    ]),
          child: widget.child,
        ));
  }


}
