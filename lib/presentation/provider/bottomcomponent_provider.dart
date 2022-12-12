import 'package:flutter/cupertino.dart';
import 'package:ocean/data/datasources/remote/remote_datasources.dart';

class BottomProvider extends ChangeNotifier{
  RemoteDataSources remoteDataSources = RemoteDataSources();
  String? _bottomText;
  double _menuHeight=60.0;

  double get menuHeight => _menuHeight;

  set menuHeight(double value) {
    _menuHeight = value;
    notifyListeners();
  }

  String? get bottomText => _bottomText;

  String _faceBookUrl="";
  String _instagramUrl="";
  String _telegramUrl="";

  String get faceBookUrl => _faceBookUrl;

  set faceBookUrl(String value) {
    _faceBookUrl = value;
    notifyListeners();
  }

  set bottomText(String? value) {
    _bottomText = value;
    notifyListeners();
  }

  Future getBottomText()async{
    bottomText = await remoteDataSources.getBottomText();
    notifyListeners();
  }

 Future getAllSocialMedia()async{
  await  getInstagramLink();
  await getTelegramLink();
  await getFaceBookLink();

  }
  Future getFaceBookLink()async{
    faceBookUrl = await remoteDataSources.getFaceBookLink();
    notifyListeners();
  }
  Future getTelegramLink()async{
    telegramUrl = await remoteDataSources.getTelegramLink();
    notifyListeners();
  }
  Future getInstagramLink()async{
    instagramUrl = await remoteDataSources.getInstagramLink();
    notifyListeners();
  }

  String get instagramUrl => _instagramUrl;

  set instagramUrl(String value) {
    _instagramUrl = value;
    notifyListeners();

  }

  String get telegramUrl => _telegramUrl;

  set telegramUrl(String value) {
    _telegramUrl = value;
    notifyListeners();

  }
}