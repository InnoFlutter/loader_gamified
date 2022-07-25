import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:loader_gamified/schulte_table.dart';

import 'loader_gamified_platform_interface.dart';

class LoaderGamified {
  Future<String?> getPlatformVersion() {
    return LoaderGamifiedPlatform.instance.getPlatformVersion();
  }
}

class GamifiedLoader extends StatefulWidget {
  // Loader widget to show before the game
  final Widget loader;

  // Time during which the regular loader will be shown
  final int loaderTimeMs;

  const GamifiedLoader(
      {Key? key, required this.loader, required this.loaderTimeMs})
      : super(key: key);

  @override
  State<GamifiedLoader> createState() => _GamifiedLoaderState();
}

class _GamifiedLoaderState extends State<GamifiedLoader> {
  bool isLoading = true;
  Timer? loadingTimer;

  void stopLoader() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  initState() {
    super.initState();
    setState(() {
      loadingTimer =
          Timer(Duration(milliseconds: widget.loaderTimeMs), stopLoader);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading ? widget.loader : const SchulteTable(),
    );
  }
}
