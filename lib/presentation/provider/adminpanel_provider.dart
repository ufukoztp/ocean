

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocean/common/utils/statics.dart';
import 'package:ocean/data/datasources/remote/remote_datasources.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ocean/main.dart';
import 'package:ocean/presentation/screen/adminpanelpage.dart';
import 'package:path/path.dart';

enum imageReferanceName{
  homepageheader,mentorpageheader,egitimpageheader,yardimpageheader,hizmetitemheader,cards1,cards2,cards3
}

class AdminPanelProvider extends ChangeNotifier{

  String username="";
  String password="";
  List<Map<String,dynamic>> _submitList=[];
  List<Map<String,dynamic>> _hizmetList=[];

  List<Map<String, dynamic>> get hizmetList => _hizmetList;

  set hizmetList(List<Map<String, dynamic>> value) {
    _hizmetList = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get submitList => _submitList;

  set submitList(List<Map<String, dynamic>> value) {
    _submitList = value;
    notifyListeners();
  }

  RemoteDataSources remoteDataSources = RemoteDataSources();
  TextEditingController homeTextController1 = TextEditingController();
  TextEditingController homeTextController2 = TextEditingController();
  TextEditingController homeTextController3 = TextEditingController();
  TextEditingController homeTextController4 = TextEditingController();
  TextEditingController homeTextController5 = TextEditingController();
  TextEditingController homeTextController6 = TextEditingController();

  TextEditingController homeTextController7 = TextEditingController();
  TextEditingController homeTextController8 = TextEditingController();
  TextEditingController homeTextController9 = TextEditingController();
  TextEditingController homeTextController10 = TextEditingController();
  TextEditingController homeTextController11 = TextEditingController();
  TextEditingController homeTextController12 = TextEditingController();


  TextEditingController homeTextControlleroffer13 = TextEditingController();
  TextEditingController homeTextControlleroffer14 = TextEditingController();
  TextEditingController homeTextControlleroffer15 = TextEditingController();
  TextEditingController homeTextControlleroffer16 = TextEditingController();
  TextEditingController homeTextControlleroffer17 = TextEditingController();
  TextEditingController homeTextControlleroffer18 = TextEditingController();

  TextEditingController homeTextControlleroffer19 = TextEditingController();
  TextEditingController homeTextControlleroffer20 = TextEditingController();
  TextEditingController homeTextControlleroffer21 = TextEditingController();
  TextEditingController homeTextControlleroffer22 = TextEditingController();
  TextEditingController homeTextControlleroffer23 = TextEditingController();
  TextEditingController homeTextControlleroffer24 = TextEditingController();


  TextEditingController supportPhoneController = TextEditingController();
  TextEditingController supportMailController = TextEditingController();
  TextEditingController supportAddressController = TextEditingController();


  TextEditingController instagramController = TextEditingController();
  TextEditingController telegramController = TextEditingController();
  TextEditingController facebookController = TextEditingController();


  TextEditingController bottomTextController= TextEditingController();

  late BuildContext context;



  TextEditingController mentorTextController1 = TextEditingController();
  TextEditingController mentorTextController2 = TextEditingController();
  TextEditingController mentorTextController3 = TextEditingController();


  TextEditingController mentorSssitem1 = TextEditingController();
  TextEditingController mentorSssitem2 = TextEditingController();
  TextEditingController mentorSssitem3 = TextEditingController();
  TextEditingController mentorSssitem4 = TextEditingController();
  TextEditingController mentorSssitem5 = TextEditingController();
  TextEditingController mentorSssitem6 = TextEditingController();



  TextEditingController mentorSssitemtitle1 = TextEditingController();
  TextEditingController mentorSssitemtitle2 = TextEditingController();
  TextEditingController mentorSssitemtitle3 = TextEditingController();
  TextEditingController mentorSssitemtitle4 = TextEditingController();
  TextEditingController mentorSssitemtitle5 = TextEditingController();
  TextEditingController mentorSssitemtitle6 = TextEditingController();



  TextEditingController hizmetTextController1 = TextEditingController();
  TextEditingController hizmetTextController2= TextEditingController();
  TextEditingController hizmetTextController3 = TextEditingController();
  TextEditingController hizmetTextController4 = TextEditingController();
  TextEditingController hizmetTextController5 = TextEditingController();
  TextEditingController hizmetTextController6 = TextEditingController();



  TextEditingController egitimTextController1 = TextEditingController();
  TextEditingController egitimTextController2 = TextEditingController();
  TextEditingController egitimTextController3 = TextEditingController();
  TextEditingController egitimTextController4 = TextEditingController();
  TextEditingController egitimTextController5 = TextEditingController();

  TextEditingController egitimTextControllerContent1 = TextEditingController();
  TextEditingController egitimTextControllerContent2 = TextEditingController();
  TextEditingController egitimTextControllerContent3 = TextEditingController();
  TextEditingController egitimTextControllerContent4 = TextEditingController();
  TextEditingController egitimTextControllerContent5 = TextEditingController();


  TextEditingController kullaniciController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future sendRequest()async{
    showLoader(context);
    if(homeTextController1.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name, pathName: AppRef.homepage_header,data: {"text":homeTextController1.text});
    }
    if(homeTextController2.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name, pathName: AppRef.homepage_header_body,data: {"text":homeTextController2.text});
    }
    if(homeTextController3.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name, pathName: AppRef.homepage_header_image,data: {"text":homeTextController3.text});
    }
    if(homeTextController4.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name, pathName: AppRef.homepage_body_content1,data: {"text":homeTextController4.text});
    }
    if(homeTextController5.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name, pathName: AppRef.homepage_body_title1,data: {"text":homeTextController5.text});
    }
    if(homeTextController6.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name, pathName: AppRef.homepage_body_title2,data: {"text":homeTextController6.text});
    }



    if(homeTextController7.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_servicecards, pathName: AppRef.homepage_servicecard1,data: {"text":homeTextController7.text});
    }
    if(homeTextController8.text != ""){
      await remoteDataSources.sendRequest(collectionName:AppRef.homepage_collection_name_servicecards, pathName: AppRef.homepage_servicecard1,data: {"image":homeTextController8.text});
    }
    if(homeTextController9.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_servicecards, pathName: AppRef.homepage_servicecard2,data: {"text":homeTextController9.text});
    }
    if(homeTextController10.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_servicecards, pathName: AppRef.homepage_servicecard2,data: {"image":homeTextController10.text});
    }
    if(homeTextController11.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_servicecards, pathName: AppRef.homepage_servicecard3,data: {"text":homeTextController11.text});
    }
    if(homeTextController12.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_servicecards, pathName: AppRef.homepage_servicecard3,data: {"image":homeTextController12.text});
    }





    if(homeTextControlleroffer13.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards1,data: {"title":homeTextControlleroffer13.text});
    }
    if(homeTextControlleroffer14.text != ""){
      await remoteDataSources.sendRequest(collectionName:AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards1,data: {"body":homeTextControlleroffer14.text});
    }
    if(homeTextControlleroffer15.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards2,data: {"title":homeTextControlleroffer15.text});
    }
    if(homeTextControlleroffer16.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards2,data: {"body":homeTextControlleroffer16.text});
    }
    if(homeTextControlleroffer17.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards3,data: {"title":homeTextControlleroffer17.text});
    }
    if(homeTextControlleroffer18.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards3,data: {"body":homeTextControlleroffer18.text});
    }
    if(homeTextControlleroffer19.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards4,data: {"title":homeTextControlleroffer19.text});
    }
    if(homeTextControlleroffer20.text != ""){
      await remoteDataSources.sendRequest(collectionName:AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards4,data: {"body":homeTextControlleroffer20.text});
    }
    if(homeTextControlleroffer21.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards5,data: {"title":homeTextControlleroffer21.text});
    }
    if(homeTextControlleroffer22.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards5,data: {"body":homeTextControlleroffer22.text});
    }
    if(homeTextControlleroffer23.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards6,data: {"title":homeTextControlleroffer23.text});
    }
    if(homeTextControlleroffer24.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_offercards, pathName: AppRef.homepage_service_offercards6,data: {"body":homeTextControlleroffer24.text});
    }

    if(bottomTextController.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.bottom_collection_name, pathName: AppRef.bottom_text,data: {"text":bottomTextController.text});
    }


    if(mentorTextController1.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_collection_name, pathName: AppRef.mentorpage_header,data: {"text":mentorTextController1.text});
    }
    if(mentorTextController2.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_collection_name, pathName: AppRef.mentorpage_header_body,data: {"text":mentorTextController2.text});
    }
    if(mentorTextController3.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_collection_name, pathName: AppRef.mentorpage_sss_title,data: {"text":mentorTextController3.text});
    }


    if(mentorSssitem1.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item1,data: {"body":mentorSssitem1.text});
    }
    if(mentorSssitem2.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item2,data: {"body":mentorSssitem2.text});
    }
    if(mentorSssitem3.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item3,data: {"body":mentorSssitem3.text});
    }
    if(mentorSssitem4.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item4,data: {"body":mentorSssitem4.text});
    }
    if(mentorSssitem5.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item5,data: {"body":mentorSssitem5.text});
    }
    if(mentorSssitem6.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item6,data: {"body":mentorSssitem6.text});
    }

    if(mentorSssitemtitle1.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item1,data: {"title":mentorSssitemtitle1.text});
    }
    if(mentorSssitemtitle2.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item2,data: {"title":mentorSssitemtitle2.text});
    }
    if(mentorSssitemtitle3.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item3,data: {"title":mentorSssitemtitle3.text});
    }
    if(mentorSssitemtitle4.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item4,data: {"title":mentorSssitemtitle4.text});
    }
    if(mentorSssitemtitle5.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item5,data: {"title":mentorSssitemtitle5.text});
    }
    if(mentorSssitemtitle6.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.mentor_sssitem_collection_name, pathName: AppRef.mentorpage_sss_item6,data: {"title":mentorSssitemtitle6.text});
    }


    if(supportAddressController.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.supportpage_collection_name, pathName: AppRef.supportpage_address,data: {"text":supportAddressController.text});
    }
    if(supportPhoneController.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.supportpage_collection_name, pathName: AppRef.supportpage_phone,data: {"text":supportPhoneController.text});
    }
    if(supportMailController.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.supportpage_collection_name, pathName: AppRef.supportpage_mail,data: {"text":supportMailController.text});
    }


    if(hizmetTextController1.text != ""&&hizmetTextController2.text != ""&&hizmetTextController3.text != ""){
      await remoteDataSources.sendRequestSetdocId(collectionName: AppRef.hizmetpage_collection_name,data: {
        "title":hizmetTextController1.text,
        "price":hizmetTextController2.text,
        "price_type":hizmetTextController3.text,
        "image_url":hizmetTextController4.text
      },docId:hizmetTextController1.text);
    }

    if(hizmetTextController5.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.hizmetpage_collection_name_header, pathName: AppRef.hizmetpage_header_title,data: {"text":hizmetTextController5.text});
    }
    if(hizmetTextController6.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.hizmetpage_collection_name_header, pathName: AppRef.hizmetpage_header_body,data: {"text":hizmetTextController6.text});
    }




    if(egitimTextControllerContent1.text != ""||egitimTextControllerContent2.text != ""||egitimTextControllerContent3.text != ""||egitimTextControllerContent4.text != ""||egitimTextControllerContent5.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.egitimpage_collection_name, pathName: AppRef.egitimpage_contents,data: {
        "contents":[egitimTextControllerContent1.text,egitimTextControllerContent2.text,egitimTextControllerContent3.text,egitimTextControllerContent4.text,egitimTextControllerContent5.text]
      });

    }

    if(egitimTextController1.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.egitimpage_collection_name, pathName: AppRef.egitimpage_title,data: {"text":egitimTextController1.text});
    }
    if(egitimTextController2.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.egitimpage_collection_name, pathName: AppRef.egitimpage_price,data: {"text":egitimTextController2.text});
    }
    if(egitimTextController3.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.egitimpage_collection_name, pathName: AppRef.egitimpage_price_type,data: {"text":egitimTextController3.text});
    }
    if(egitimTextController4.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.egitimpage_collection_name, pathName: AppRef.egitimpage_header_title,data: {"text":egitimTextController4.text});
    }
    if(egitimTextController5.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.egitimpage_collection_name, pathName: AppRef.egitimpage_header_body,data: {"text":egitimTextController5.text});
    }




    if(instagramController.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.social_collection, pathName: AppRef.instagram,data: {"text":instagramController.text});
    }
    if(telegramController.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.social_collection, pathName: AppRef.telegram,data: {"text":telegramController.text});
    }
    if(facebookController.text != ""){
      await remoteDataSources.sendRequest(collectionName: AppRef.social_collection, pathName: AppRef.facebook ,data: {"text":facebookController.text});
    }



    hideLoader();
  }

  Future sendRequestImage(imageReferanceName imagereferance,String referanceUrl,
      {String? pathName})async {
    switch (imagereferance) {

      case imageReferanceName.hizmetitemheader:
        await remoteDataSources.sendRequest(collectionName: AppRef.hizmetpage_collection_name, pathName: pathName,data: {"image_url":referanceUrl});
        break;
      case imageReferanceName.yardimpageheader:
        await remoteDataSources.sendRequest(collectionName: AppRef.supportpage_collection_name, pathName: AppRef.supportpage_header,data: {"text":referanceUrl});
        break;
      case imageReferanceName.egitimpageheader:
        await remoteDataSources.sendRequest(collectionName: AppRef.egitimpage_collection_name, pathName: AppRef.egitimpage_header_image,data: {"text":referanceUrl});
        break;
      case imageReferanceName.mentorpageheader:
        await remoteDataSources.sendRequest(collectionName: AppRef.mentor_collection_name, pathName: AppRef.mentorpage_header_image,data: {"text":referanceUrl});
        break;
      case imageReferanceName.homepageheader:
        await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name, pathName: AppRef.homepage_header_image,data: {"text":referanceUrl});
        break;
      case imageReferanceName.cards1:
        await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_servicecards, pathName: imageReferanceName.cards1.name,data: {"image":referanceUrl});
        break;
      case imageReferanceName.cards2:
        await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_servicecards, pathName: imageReferanceName.cards2.name,data: {"image":referanceUrl});
        break;
      case imageReferanceName.cards3:
        await remoteDataSources.sendRequest(collectionName: AppRef.homepage_collection_name_servicecards, pathName: imageReferanceName.cards3.name,data: {"image":referanceUrl});
        break;
    }
  }

  Future login()async{
    showLoader(context);
    print(kullaniciController.text);
    print(passwordController.text);

    if(kullaniciController.text == username&& passwordController.text==password){
      hideLoader();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminPanel()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Yanlış Kullanıcı")));
    }
    hideLoader();
  }


  Future getUsername()async{
   username = await remoteDataSources.getUsername();
  }


  Future getPassword()async{
   password = await remoteDataSources.getpassword();
  }

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  var pickedFile;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  pickImage(imageReferanceName selectedFileName,{String? pathName })async{
    if (kIsWeb) {
       pickedFile = await _picker.pickImage(source: ImageSource.gallery);

         if (pickedFile != null) {
          _photo = File(pickedFile.path);
          print(_photo?.uri);
          showLoader(context);
         var resultUrl = await uploadFile(selectedFileName.name);
         await sendRequestImage(selectedFileName, resultUrl,pathName: pathName);
         hideLoader();
         } else {
          print('No image selected.');
        }
   }

}

  Future<String> uploadFile(String selectedFileName) async {
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': _photo!.path},
    );

    if (_photo == null) return "";

    final fileName = basename(_photo!.path);
    final destination = 'files/$selectedFileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
    await ref.putData(await pickedFile!.readAsBytes(),metadata);
      return await ref.getDownloadURL();
    } catch (e) {
      print(e.toString());
      print('error occured');
    }
    hideLoader();
    return "hata";
  }

 Future getSupportnotf()async{
    showLoader(context);
   submitList.addAll(await remoteDataSources.getSupportNotf());
   hideLoader();
   notifyListeners();
  }

  Future deleteSupportnotf(String fileName)async{
    showLoader(context);
   await remoteDataSources.deletedoc(collectionName: "submit",docId: fileName);
    hideLoader();
    notifyListeners();
  }

  Future getHizmetItems()async{
    showLoader(context);
    hizmetList.addAll(await remoteDataSources.getHizmetCards());
    hideLoader();
    notifyListeners();
  }
  Future deleteHizmetItems(pathName,value)async{
    showLoader(context);
    await remoteDataSources.deleteHizmetCards(pathName);
    hizmetList.remove(value);
    hideLoader();
    notifyListeners();
  }

}