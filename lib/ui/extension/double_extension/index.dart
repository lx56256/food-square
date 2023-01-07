import '../size_fit.dart';

extension DoubleFit on double {
  double get px {
    return SizeFit.toPx(this);
  }

  double get rpx {
    return SizeFit.toRpx(this);
  }
}
