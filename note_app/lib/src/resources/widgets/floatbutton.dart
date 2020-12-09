import 'package:flutter/material.dart';

class FloatingBt extends StatefulWidget {
  const FloatingBt({
    Key key,
  }) : super(key: key);
  @override
  _FLoatingBtState createState() => _FLoatingBtState();
}

class _FLoatingBtState extends State<FloatingBt>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
//  Curve _curve = Curves.easeOut;
  double _fabHeight = 56;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animationIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.00, 1.00, curve: Curves.linear)));
    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.00, 0.75, curve: Curves.easeOut)));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buttonAdd() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buttonEdit() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: "Edit",
        child: Icon(Icons.edit),
      ),
    );
  }

  Widget buttonDelete() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: "Delete",
        child: Icon(Icons.delete),
      ),
    );
  }

  Widget buttonToggle() {
    return Container(
      child: FloatingActionButton(
        onPressed: animate,
        tooltip: "Toggle",
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
    );
  }

  void animate() {
    if (!isOpen) {
      _animationController.forward();
    } else
      _animationController.reverse();
    isOpen = !isOpen;
  }
}
