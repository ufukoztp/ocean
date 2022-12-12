import 'package:flutter/cupertino.dart';
import 'package:ocean/data/datasources/remote/remote_datasources.dart';
import 'package:ocean/main.dart';

class HizmetPageProvider extends ChangeNotifier{
  RemoteDataSources remoteDataSources =RemoteDataSources();
  late BuildContext context ;
  List<Map<String,dynamic>> _resultList = [];
  String? _headerTitle;
  String? _headerBody;

  String? get headerTitle => _headerTitle;

  set headerTitle(String? value) {
    _headerTitle = value;
    notifyListeners();
  }

  String? _headerImage;


  List<Map<String, dynamic>> get resultList => _resultList;

  set resultList(List<Map<String, dynamic>> value) {
    _resultList = value;
    notifyListeners();
  }

  Future getMethods()async{
    await getHeaderTitle();
    await getHeaderBody();
    await getHeaderImage();
    await getHizmetCard();
  }
  Future getHizmetCard()async{
    resultList.clear();
    showLoader(context);
    resultList.addAll(await remoteDataSources.getHizmetCards());
    hideLoader();
    notifyListeners();

     }


  Future getHeaderImage()async{
    showLoader(context);
  headerImage = await remoteDataSources.getHizmetHeaderImage();
    hideLoader();
    notifyListeners();
  }


  Future getHeaderTitle()async{
    showLoader(context);
  headerTitle = await remoteDataSources.getHizmetHeaderTitle();
    hideLoader();
    notifyListeners();
  }

  Future getHeaderBody()async{
    showLoader(context);
   headerBody= await remoteDataSources.getHizmetHeaderBody();
    hideLoader();
    notifyListeners();
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
}