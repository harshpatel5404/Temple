import 'package:get/get.dart';
import 'package:temple/services/api/get_allmember.dart';
import 'package:temple/services/api/registration_service.dart';
import 'package:temple/services/pref_manager.dart';
import 'package:temple/views/member/screen/model/user_model.dart';

class Getallmembercontroller extends GetxController {
  RxList memberlist = [].obs;

  Future getmemberdata() async {
    memberlist.clear();
    print("usernum is $usernumber");
    if (usernumber != null) {
      UserModel? memberdata = await Getallmember(usernumber);
      if (memberdata != null) {
        memberlist.value = memberdata.data!;
        print("lenght");
        print(memberlist.length);
        return memberlist;
      }
    }
    return null;
  }
}
