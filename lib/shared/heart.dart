import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorAnimation;
  Animation _sizeAnimation;
  Animation _curveAnimation;
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _curveAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);

    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_curveAnimation);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30),
          weight: 50,
        ),
      ],
    ).animate(_curveAnimation);

    _animationController.addListener(() {
      // print(_animationController.value);
      // print(_colorAnimation.value);
    });

    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isFav = true;
          });
        }
        if (status == AnimationStatus.dismissed) {
          isFav = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) => IconButton(
        icon: Icon(
          Icons.favorite,
          color: _colorAnimation.value,
          size: _sizeAnimation.value,
        ),
        onPressed: () {
          isFav
              ? _animationController.reverse()
              : _animationController.forward();
        },
      ),
    );
  }
}
