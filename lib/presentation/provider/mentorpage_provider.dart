import 'package:flutter/cupertino.dart';
import 'package:ocean/data/datasources/remote/remote_datasources.dart';
import 'package:ocean/main.dart';
import 'package:path/path.dart';

class MentorPageProvider extends ChangeNotifier{
  String? _headerTitle;
  late BuildContext context;

  String? get headerTitle => _headerTitle;

  set headerTitle(String? value) {
    _headerTitle = value;
    notifyListeners();
  }

  String? _headerBody;
  String? _headerImage;
  String? _sssTitle;
  List<Map<String,dynamic>>? _sssItemList=[];
  String? _costTitle;
  List<Map<String,dynamic>>? _costItemList=[];

  RemoteDataSources remoteDataSources = RemoteDataSources();

  reProvider(){
    _headerBody=null;
    _headerImage=null;
    _sssTitle=null;
    _sssItemList=[];
    _costTitle=null;
    _costItemList=[];
  }
  Future callAllGetMethods()async{
    reProvider();
    showLoader(context);
   await getHeaderTitleMentor();
   await getHeaderBodyMentor();
   await getHeaderImageMentor();
   await getSssTitle();
   await getSssItem();
   hideLoader();
  }
  Future getHeaderTitleMentor()async{
  headerTitle = await remoteDataSources.getHeaderTitleMentor();
  notifyListeners();
  }
  Future getHeaderBodyMentor()async{
    headerBody = await remoteDataSources.getHeaderBodyMentor();
    notifyListeners();

  }
  Future getHeaderImageMentor()async{
   headerImage =  await remoteDataSources.getHeaderImageMentor();
   notifyListeners();

  }
  Future getSssTitle()async{
   sssTitle =  await remoteDataSources.getSssTitle();
   notifyListeners();

  }
  Future getSssItem()async{
   sssItemList = await remoteDataSources.getSssItem();
   notifyListeners();

  }




  Future getCostTitle()async{
    costTitle = await remoteDataSources.getCostTitle();
    notifyListeners();

  }
  Future getCostCard()async{
   costItemList?.addAll(await remoteDataSources.getCostCard());
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

  String? get sssTitle => _sssTitle;

  set sssTitle(String? value) {
    _sssTitle = value;
    notifyListeners();

  }

  List<Map<String, dynamic>>? get sssItemList => _sssItemList;

  set sssItemList(List<Map<String, dynamic>>? value) {
    _sssItemList = value;
    notifyListeners();

  }

  String? get costTitle => _costTitle;

  set costTitle(String? value) {
    _costTitle = value;
    notifyListeners();
  }

  List<Map<String, dynamic>>? get costItemList => _costItemList;

  set costItemList(List<Map<String, dynamic>>? value) {
    _costItemList = value;
  }
}