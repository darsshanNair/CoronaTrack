import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    configureAnimations();
  }

  void configureAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animation =
        Tween<double>(begin: 0.2, end: 1.0).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: AnimatedLoadingLogo(
          animation: _animation,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}

class AnimatedLoadingLogo extends AnimatedWidget {
  final Tween<double> _sizeAnimation = Tween<double>(begin: 30.0, end: 100.0);

  AnimatedLoadingLogo({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> _animation = listenable;

    return Opacity(
      opacity: _animation.value,
      child: Image(
        image: AssetImage("assets/images/img_virus.png"),
        width: _sizeAnimation.evaluate(_animation),
        height: _sizeAnimation.evaluate(_animation),
      ),
    );
  }
}
