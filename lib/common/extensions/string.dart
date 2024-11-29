import '../constants/utils.dart';

extension FarsiNumber on String {
  String toFarsiNumber() {
    return replaceFarsiNumber(this);
  }
}
