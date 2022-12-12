import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ocean/domain/repositories/repository.dart';

class RemoteDataSources implements Repository{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  Future getBodyContentBody1() async{
    var response =  await _db.collection("homepage").doc("bodycontentbody1").get();

    return response.data()!["text"];
  }

  @override
  Future<List<Map<String,dynamic>>> getBodyContentItem2()async {
    List<Map<String,dynamic>> itemList = [];
    var response =  await _db.collection("homepage_offer_cards").get();
    response.docs.forEach((element) {
      itemList.add(element.data());
    });

    return itemList;
  }

  @override
  Future getBodyContentTitle1()async{
    var response =  await _db.collection("homepage").doc("bodycontenttitle1").get();

    return response.data()!["text"];
  }

  @override
  Future getBodyContentTitle2() async{
    var response =  await _db.collection("homepage").doc("bodycontenttitle2").get();

    return response.data()!["text"];
  }

  @override
  Future getContactInfo() {
    // TODO: implement getContactInfo
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String,dynamic>>> getCostCard() async{
    List<Map<String,dynamic>> itemList = [];
    var response =  await _db.collection("mentorpage_cost_card").get();

    response.docs.forEach((element) {
      itemList.add(element.data());
    });

    return itemList;
  }

  @override
  Future getCostTitle() async {
    var response =  await _db.collection("mentorpage").doc("costtitle").get();

    return response.data()!["text"];
  }

  @override
  Future getHeaderBody() async{
    var response =  await _db.collection("homepage").doc("headerbody").get();

    return response.data()!["text"];
  }

  @override
  Future getHeaderBodyMentor() async{
    var response =  await _db.collection("mentorpage").doc("headerbody").get();

    return response.data()!["text"];
  }

  @override
  Future getHeaderImage()async {
    var response =  await _db.collection("homepage").doc("headerimage").get();

    return response.data()!["text"];
  }

  @override
  Future getHeaderImageMentor()async {
    var response =  await _db.collection("mentorpage").doc("headerimage").get();

    return response.data()!["text"];
  }

  @override
  Future<String> getHeaderTitle()async {
 var response =  await _db.collection("homepage").doc("header").get();

 return response.data()!["text"];
  }

  @override
  Future getHeaderTitleMentor() async{
    var response =  await _db.collection("mentorpage").doc("headertitle").get();

    return response.data()!["text"];
  }

  @override
  Future<List<Map<String,dynamic>>> getServiceCards()async {
    List<Map<String,dynamic>> itemList = [];
    var response =  await _db.collection("homepage_service_cards").get();
    response.docs.forEach((element) {
      itemList.add(element.data());
    });
    return itemList;

   }

  @override
  Future<List<Map<String,dynamic>>> getSssItem() async{
    List<Map<String,dynamic>> itemList = [];
    var response =  await _db.collection("mentorpage_sss_items").get();
    response.docs.forEach((element) {
      itemList.add(element.data());
    });
    return itemList;
  }

  @override
  Future getSssTitle()async {
    var response =  await _db.collection("mentorpage").doc("ssstitle").get();

    return response.data()!["text"];
  }

  @override
  Future requestSupport() {
    // TODO: implement requestSupport
    throw UnimplementedError();
  }

  @override
  Future<String> getContactInfoAddress()async {
    var response =  await _db.collection("supportpage").doc("address").get();

    return response.data()!["text"];
  }

  @override
  Future<String> getContactInfoMail()async {
    var response =  await _db.collection("supportpage").doc("mail").get();

    return response.data()!["text"];
  }

  @override
  Future<String> getContactInfoPhone()async {
    var response =  await _db.collection("supportpage").doc("phone").get();

    return response.data()!["text"];
  }

  @override
  Future<String> getHeaderImageSupport()async {
    var response =  await _db.collection("supportpage").doc("headerImage").get();

    return response.data()!["text"];
  }

  @override
  Future getBottomText()async {
    var response =  await _db.collection("bottom").doc("bottomText").get();

    return response.data()!["text"];
  }

  Future getFaceBookLink()async{
    var response =  await _db.collection("social").doc("facebook").get();

    return response.data()!["text"];
  }
  Future getTelegramLink()async{
    var response =  await _db.collection("social").doc("telegram").get();

    return response.data()!["text"];
  }
  Future getInstagramLink()async{
    var response =  await _db.collection("social").doc("instagram").get();

    return response.data()!["text"];
  }


  Future getSellCardsPrice()async {
    var response =  await _db.collection("egitimpage").doc("sell_cards_price").get();
    print(response.data().toString());
    return response.data()!;
  }

  Future getSellCardsPriceType()async {
    var response =  await _db.collection("egitimpage").doc("sell_cards_price_type").get();
    print(response.data().toString());
    return response.data()!;
  }

  Future getSellCardsTitle()async {
    var response =  await _db.collection("egitimpage").doc("sell_cards_title").get();
    print(response.data().toString());
    return response.data()!;
  }
  Future getSellCardsContents()async {
    var response =  await _db.collection("egitimpage").doc("sell_cards_contents").get();
    print(response.data().toString());
    return response.data()!;
  }

  Future getHeaderBodyEgitim()async {
    var response =  await _db.collection("egitimpage").doc("headerbody").get();
    print(response.data().toString());
    return response.data()!["text"];
  }
  Future getHeaderTitleEgitim()async {
    var response =  await _db.collection("egitimpage").doc("headertitle").get();
    print(response.data().toString());
    return response.data()!["text"];
  }
  Future getHeaderImageEgitim()async {
    var response =  await _db.collection("egitimpage").doc("headerimage").get();
    print(response.data().toString());
    return response.data()!["text"];
  }

  Future getUsername()async {
    var response =  await _db.collection("adminlogin").doc("username").get();
    print(response.data().toString());
    return response.data()!["text"];
  }


  Future getpassword()async {
    var response =  await _db.collection("adminlogin").doc("password").get();
    print(response.data().toString());
    return response.data()!["text"];
  }


  Future sendRequest({required collectionName, required pathName,var data})async{
    await _db.collection(collectionName).doc(pathName).update(data);
  }

  Future sendRequestSetdocId({required collectionName,var data,var docId})async{
    await _db.collection(collectionName).doc(docId).set(data);
  }


  Future sendRequestRandomPathName({required collectionName,var data})async{
    await _db.collection(collectionName).doc().set(data);
  }

  Future deletedoc({required collectionName,var docId})async{
    await _db.collection(collectionName).doc(docId).delete();
  }


  Future sendRequestSet({required collectionName,var data})async{
    await _db.collection(collectionName).add(data);
  }

  @override
  Future<List<Map<String,dynamic>>> getHizmetCards()async {
    List<Map<String,dynamic>> data =  <Map<String,dynamic>>[];
   var result = await _db.collection("hizmetpage").get();

   result.docs.forEach((element) {
     data.add(element.data());
     print(element.data());
   });

   return data;
  }
  @override
  Future deleteHizmetCards(pathName)async {
    List<Map<String,dynamic>> data =  <Map<String,dynamic>>[];
    var result = await _db.collection("hizmetpage").doc(pathName).delete();
  }


  @override
  Future getHizmetHeaderImage()async {
     var result = await _db.collection("hizmetpage_header").doc("image").get();


     return result.data()!["text"];
  }
  @override
  Future getHizmetHeaderTitle()async {
     var result = await _db.collection("hizmetpage_header").doc("title").get();

     return result.data()!["text"];
  }
  @override
  Future getHizmetHeaderBody()async {
     var result = await _db.collection("hizmetpage_header").doc("body").get();

     return result.data()!["text"];
  }


  @override
  Future<List<Map<String,dynamic>>> getSupportNotf() async{
    List<Map<String,dynamic>> itemList = [];
    var response =  await _db.collection("submit").get();
    response.docs.forEach((element) {
      itemList.add(element.data());
    });
    print(itemList.length);
    return itemList;
  }

}