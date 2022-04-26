import 'package:get/get.dart';
import 'package:temple/services/api/HomeScreen_api.dart';
import 'package:temple/views/home/model/usertask_model.dart';

class Usertaskcontroller extends GetxController {
  RxList<Usertasklist> usertasklist = <Usertasklist>[].obs;
  Future getusertask(String uid) async {
    usertasklist.clear();
    UsertaskModel? taskdata = await Getusertask(uid);
    if (taskdata != null) {
      usertasklist.value = taskdata.data!;
      return usertasklist;
    }
    return null;
  }
}
