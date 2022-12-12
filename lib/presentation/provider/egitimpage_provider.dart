import 'package:flutter/cupertino.dart';
import 'package:ocean/data/datasources/remote/remote_datasources.dart';
import 'package:ocean/main.dart';

class EgitimPageProvider extends ChangeNotifier{
  RemoteDataSources remoteDataSources =RemoteDataSources();
  Map<String,dynamic>? _resultPrice= <String,dynamic>{};
  Map<String,dynamic>? _resultPriceType= <String,dynamic>{};
  Map<String,dynamic>? _resultTitle= <String,dynamic>{};
  Map<String,dynamic>? _resultContents= <String,dynamic>{};


String? _headerTitle;
String? _headerImage;
BuildContext? context;

  String? get headerTitle => _headerTitle;

  set headerTitle(String? value) {
    _headerTitle = value;
    notifyListeners();
  }

  String? _headerBody;

  Future getSellCardsPrice()async{
    resultPrice = await remoteDataSources.getSellCardsPrice();
  }

  Future getSellCardsPriceType()async{
    resultPriceType = await remoteDataSources.getSellCardsPriceType();
  }

  Future getSellCardsTitle()async{
    resultTitle = await remoteDataSources.getSellCardsTitle();
  }

  Future getSellCardContents()async{
    resultContents = await remoteDataSources.getSellCardsContents();
  }

  Future getHeaderImage()async{
    headerImage = await remoteDataSources.getHeaderImageEgitim();
  }
  Future getHeaderTitle()async{
    headerTitle = await remoteDataSources.getHeaderTitleEgitim();
  }
  Future getHeaderBody()async{
    headerBody = await remoteDataSources.getHeaderBodyEgitim();
  }


  Future getAllMethods()async{
    showLoader(context);
    await getSellCardsPriceType();
    await getSellCardsPrice();
    await getSellCardsTitle();
    await getSellCardContents();
    await getHeaderImage();
    await getHeaderBody();
    await getHeaderTitle();
    hideLoader();
  }

  Map<String, dynamic>? get resultPriceType => _resultPriceType;
  Map<String, dynamic>? get resultTitle => _resultTitle;
  Map<String, dynamic>? get resultContents => _resultContents;
  Map<String, dynamic>? get resultPrice => _resultPrice;

  set resultPrice(Map<String, dynamic>? value) {
    _resultPrice = value;
    notifyListeners();
  }

  set resultPriceType(Map<String, dynamic>? value) {
    _resultPriceType = value;
    notifyListeners();
  }


  set resultTitle(Map<String, dynamic>? value) {
    _resultTitle = value;
    notifyListeners();
  }


  set resultContents(Map<String, dynamic>? value) {
    _resultContents = value;
    notifyListeners();

  }

  String? get headerImage => _headerImage;

  set headerImage(String? value) {
    _headerImage = value;
    notifyListeners();
  }

  String? get headerBody => _headerBody;

  set headerBody(String? value) {
    _headerBody = value;
    notifyListeners();

  }
}