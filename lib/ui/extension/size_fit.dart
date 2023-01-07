import 'dart:ui';

class SizeFit {
  static late double rpx;
  static late double px;
  static void initialize({double standardSize = 750}) {
    double physicalWidth = window.physicalSize.width;
    double dpr = window.devicePixelRatio;
    double screenWidth = physicalWidth / dpr;

    double statusHeight = window.padding.top / dpr;
    double bottomBarHeight = window.padding.bottom / dpr;
    rpx = screenWidth / standardSize;

    px = screenWidth / standardSize * 2;
    print('状态栏高度：$statusHeight, 底部：$bottomBarHeight');
  }

  static double toRpx(double size) {
    return rpx * size;
  }

  static double toPx(double size) {
    return px * size;
  }

  static double getStatusHeight() {
    double dpr = window.devicePixelRatio;
    double statusHeight = window.padding.top / dpr;
    return statusHeight;
  }

  static double getBottomBarHeight() {
    double dpr = window.devicePixelRatio;
    double bottomBarHeight = window.padding.bottom / dpr;
    return bottomBarHeight;
  }
}
