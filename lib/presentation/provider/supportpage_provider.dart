import 'package:flutter/cupertino.dart';
import 'package:ocean/data/datasources/remote/remote_datasources.dart';

class SupportPageProvider extends ChangeNotifier{
  RemoteDataSources remoteDataSources =RemoteDataSources();
  String? _address;
  String? _phone;
  String? _image;

  String? get image => _image;

  set image(String? value) {
    _image = value;
    notifyListeners();
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
    notifyListeners();
  }

  String? _mail;

  Future getContactInfoAddress()async{
  address = await remoteDataSources.getContactInfoAddress();
  notifyListeners();
  }
  Future getContactInfoMail()async{
   mail =  await remoteDataSources.getContactInfoMail();
   notifyListeners();

  }
  Future getContactInfoPhone()async{
  phone =  await remoteDataSources.getContactInfoPhone();
  notifyListeners();

  }

  Future getHeaderImage()async{
    image =  await remoteDataSources.getHeaderImageSupport();
    notifyListeners();
  }

  String? get phone => _phone;

  set phone(String? value) {
    _phone = value;
    notifyListeners();
  }

  String? get mail => _mail;

  set mail(String? value) {
    _mail = value;
    notifyListeners();
  }
}