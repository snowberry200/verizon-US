import 'package:flutter/cupertino.dart';
import 'package:my_verizon/layout/desktop.dart';
import 'package:my_verizon/layout/mobile.dart';
import 'package:my_verizon/layout/tablet.dart';

const desktopScreenSize = 1200;
const tabletScreenSize = 800;
const mobileScreenSize = 300;

class LayOutWidget extends StatefulWidget {
  const LayOutWidget({super.key});
  static bool isMobile(context) =>
      MediaQuery.of(context).size.width < tabletScreenSize;
  static bool isTablet(context) =>
      MediaQuery.of(context).size.width > mobileScreenSize &&
      MediaQuery.of(context).size.width <= tabletScreenSize;
  static bool isDesktop(context) =>
      MediaQuery.of(context).size.width >= desktopScreenSize;

  @override
  State<LayOutWidget> createState() => _LayOutWidgetState();
}

class _LayOutWidgetState extends State<LayOutWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= desktopScreenSize) {
          return DesktopScreen(key: UniqueKey());
        } else if (constraints.maxWidth < desktopScreenSize &&
            constraints.maxWidth >= tabletScreenSize) {
          return TabletScreen(key: UniqueKey());
        } else {
          return MobileScreen(key: UniqueKey());
        }
      },
    );
  }
}
