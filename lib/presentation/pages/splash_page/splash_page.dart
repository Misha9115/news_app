import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:rive/rive.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool get isPlaying => _controller?.isActive ?? false;
  late Timer _timer;
  Artboard? _riveArtboard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load(riv).then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(_controller = SimpleAnimation(ap));
        setState(() => _riveArtboard = artboard);
      },
    );
    _timer =  Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushNamed(
        AppRoutes.loginPage,
      );
    });
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context).pushNamed(
    //     AppRoutes.loginPage,
    //   );
    // });
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.grey.withOpacity(0.1),
        child: SizedBox(
          child: _riveArtboard == null ? const SizedBox() : Rive(artboard: _riveArtboard!),
        ),
      ),
    );
  }
}
