
import 'package:get/get.dart';

import 'getx.dart';

class AllBinds extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => allController());
   Get.lazyPut(() => loginController());
   Get.lazyPut(() => signupController());
  }
        //fahad abbu
}