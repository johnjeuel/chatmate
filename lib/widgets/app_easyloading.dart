import 'package:flutter_easyloading/flutter_easyloading.dart' as c;
import 'package:chatmate/utils/common/constant.dart';


class EasyLoading {

  static void showSuccess(status) {
    c.EasyLoading.instance
      ..loadingStyle = c.EasyLoadingStyle.custom
      ..backgroundColor = kColorGreen
      ..indicatorColor = kColorWhite
      ..progressColor = kColorWhite
      ..maskColor = kColorWhite
      ..textColor = kColorWhite;

    c.EasyLoading.showSuccess(status);
  }

  static void showError(status){
    c.EasyLoading.instance
      ..loadingStyle = c.EasyLoadingStyle.custom
      ..backgroundColor = kColorRed
      ..indicatorColor = kColorWhite
      ..progressColor = kColorWhite
      ..maskColor = kColorWhite
      ..textColor = kColorWhite;

    c.EasyLoading.showError(status);
  }

  static void show({status, maskType}){
    setDefault();
    c.EasyLoading.show(status: status, maskType: c.EasyLoadingMaskType.black);
  }

  static void dismiss(){
    c.EasyLoading.dismiss();
    setDefault();
  }

  static void setDefault(){
    c.EasyLoading.instance
      ..loadingStyle = c.EasyLoadingStyle.custom
      ..backgroundColor = kColorBlack
      ..indicatorColor = kColorWhite
      ..progressColor = kColorWhite
      ..maskColor = kColorWhite
      ..textColor = kColorWhite;
  }

}