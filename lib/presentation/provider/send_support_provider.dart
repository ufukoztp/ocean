import 'package:flutter/cupertino.dart';
import 'package:ocean/data/datasources/remote/remote_datasources.dart';
import 'package:ocean/main.dart';

class SendSupportProvider extends ChangeNotifier{
  TextEditingController nameController=TextEditingController();
  TextEditingController e_mailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController messageController=TextEditingController();
  BuildContext? context;
  RemoteDataSources remoteDataSources = RemoteDataSources();

 Future submit()async{
     if(nameController.text!=""&&e_mailController.text!=""&&phoneController.text!=""&&messageController.text!="") {
      showLoader(context);
      await remoteDataSources.sendRequestSetdocId(collectionName: "submit",data: {
      "name":nameController.text,
      "e-mail":e_mailController.text,
      "phone":phoneController.text,
      "message":messageController.text,
        "id":messageController.text
    },docId: messageController.text
    );
    }
    nameController.clear();
    e_mailController.clear();
    phoneController.clear();
    messageController.clear();
     hideLoader();
  }


}