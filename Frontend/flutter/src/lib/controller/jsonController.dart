import 'package:get/get.dart';


class HomeController extends GetxController {
  var jsonData = {}.obs;


  void setJsonData(dynamic indexData) {
    jsonData.value = indexData;
  }
}