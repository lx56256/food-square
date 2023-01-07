import '../size_fit.dart';

extension DoubleFit on int {
  double get px {
    return SizeFit.toPx(this.toDouble());
  }

  double get rpx {
    return SizeFit.toRpx(this.toDouble());
  }
}
