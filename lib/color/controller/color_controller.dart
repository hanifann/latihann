
import 'package:get/get.dart';
import 'package:latihan/color/domain/models/color_model.dart';
import 'package:latihan/color/domain/services/color_service.dart';

class ColorController extends GetxController {

  @override
  void onInit() {
    fetchColor();
    super.onInit();
  }

  final colorService = ColorService();
  var error = ''.obs;
  RxBool isLoading = false.obs;
  var color = Color().obs;
  

  Future fetchColor() async {
    isLoading(true);
    final result = await colorService.getColor();
    result.fold(
      (l) {
        error(l);
      }, 
      (r) {
        color.value = r;
      }
    );
    isLoading(false);
  }
}