import 'package:flutter/cupertino.dart';
import 'package:ocean/data/datasources/remote/remote_datasources.dart';
import 'package:ocean/main.dart';
import 'package:path/path.dart';

class HomePageProvider extends ChangeNotifier{
  RemoteDataSources remoteDataSources = RemoteDataSources();
  late BuildContext context;
  String? _headerTitle;

  String? get headerTitle => _headerTitle;

  set headerTitle(String? value) {
    _headerTitle = value;
  }

  String? _headerBody;
  String? _headerImage;
  String? _bodyContentTitle1;
  String? _bodyContentBody1;
  List<Map<String,dynamic>>? _serviceCards;
  String? _bodyContentTitle2;
  List<Map<String,dynamic>>? _bodyContentItem2;


  reProvider(){
     _headerBody=null;
     _headerImage=null;
     _bodyContentTitle1=null;
     _bodyContentBody1=null;
      _serviceCards=null;
      bodyContentTitle2=null;
     _bodyContentItem2=null;
  }

  Future callAllGetMethods()async{
    reProvider();
    showLoader(context);
   await getHeaderTitle();
   await getHeaderBody();
   await getHeaderImage();
   await getBodyContentTitle1();
   await getBodyContentBody1();
   await getServiceCards();
   await getBodyContentTitle2();
   await getBodyContentItem2();
   hideLoader();
  }

  @override
  Future getHeaderTitle()async {
    headerTitle =  await remoteDataSources.getHeaderTitle();

    notifyListeners();
  }

  Future getHeaderBody()async{
    headerBody =  await remoteDataSources.getHeaderBody();

    notifyListeners();

  }
  Future getHeaderImage()async{
    headerImage =  await remoteDataSources.getHeaderImage();

    notifyListeners();
  }

   ///body why create a company? text
  Future getBodyContentTitle1()async{
    bodyContentTitle1 =  await remoteDataSources.getBodyContentTitle1();

    notifyListeners();
  }
  Future getBodyContentBody1()async{
    bodyContentBody1 =  await remoteDataSources.getBodyContentBody1();

    notifyListeners();
  }

  Future getServiceCards()async{
    serviceCards =  await remoteDataSources.getServiceCards();
    notifyListeners();
  }


  Future getBodyContentTitle2()async{
    bodyContentTitle2 =  await remoteDataSources.getBodyContentTitle2();
    notifyListeners();

  }
  Future getBodyContentItem2()async{
    bodyContentItem2 =  await remoteDataSources.getBodyContentItem2();
notifyListeners();
  }

  Future requestSupport()async{
    var response =  await remoteDataSources.requestSupport();

  }

  String? get headerBody => _headerBody;

  set headerBody(String? value) {
    _headerBody = value;
    notifyListeners();
  }

  String? get headerImage => _headerImage;

  set headerImage(String? value) {
    _headerImage = value;
    notifyListeners();
  }

  String? get bodyContentTitle1 => _bodyContentTitle1;

  set bodyContentTitle1(String? value) {
    _bodyContentTitle1 = value;
    notifyListeners();
  }

  String? get bodyContentBody1 => _bodyContentBody1;

  set bodyContentBody1(String? value) {
    _bodyContentBody1 = value;
    notifyListeners();
  }

  List<Map<String,dynamic>>? get serviceCards => _serviceCards;

  set serviceCards(List<Map<String,dynamic>>? value) {
    _serviceCards = value;
    notifyListeners();

  }

  String? get bodyContentTitle2 => _bodyContentTitle2;

  set bodyContentTitle2(String? value) {
    _bodyContentTitle2 = value;
    notifyListeners();
  }

  List<Map<String,dynamic>>? get bodyContentItem2 => _bodyContentItem2;

  set bodyContentItem2(List<Map<String,dynamic>>? value) {
    _bodyContentItem2 = value;
  }
}