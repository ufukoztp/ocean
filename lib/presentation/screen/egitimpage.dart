
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ocean/presentation/provider/egitimpage_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/utils/theme_data.dart';
import '../../core/wigdets/bottom.dart';
import 'header.dart';


class EgitimPage extends StatefulWidget {
  const EgitimPage({Key? key}) : super(key: key);

  @override
  State<EgitimPage> createState() => _EgitimPageState();
}

class _EgitimPageState extends State<EgitimPage> with AfterLayoutMixin<EgitimPage> {
  late EgitimPageProvider egitimPageProvider;
  @override
  Widget build(BuildContext context) {
    egitimPageProvider = Provider.of<EgitimPageProvider>(context);
    return Scaffold(
      body: egitimPageProvider.headerImage!=null&&egitimPageProvider.headerTitle!=null&&egitimPageProvider.headerBody!=null?Stack(
        children: [
            SingleChildScrollView(
              child: Column(
                 children: [
                  Header(index: 2),
                  //body
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                        image: NetworkImage(
                          egitimPageProvider.headerImage??""
                        )
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:110.0,top:20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width:70.w ,
                              child: Text(egitimPageProvider.headerTitle!,style: AppTheme.theme.textTheme.bodyLarge,textAlign: TextAlign.start,)),

                          SizedBox(height: 30,),
                          Container(
                            width:70.w ,
                            child: Text(egitimPageProvider.headerBody!,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: AppTheme.primaryColor),),
                          ),

                        ],
                      ),
                    ),
                  ),
                   Container(
                    height: 1000,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40,),
                        Container(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:50.0,right: 50.0,top:50.0),
                                child: Container(
                                  width: 450,
                                  height: 650,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomLeft: Radius.circular(50))
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 70,),
                                      Divider(color: Colors.grey,endIndent: 20,indent: 20,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:20.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(egitimPageProvider.resultPriceType?["text"] ??"",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900),),
                                            Text(egitimPageProvider.resultPrice?["text"] ?? "",style: TextStyle(color: Colors.black,fontSize: 60,fontWeight: FontWeight.w900),),
                                            SizedBox(width: 10,),
                                            Text(egitimPageProvider.resultTitle?["text"] ?? "",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900)),
                                          ],
                                        ),
                                      ),
                                      Divider(color: Colors.grey,endIndent: 20,indent: 20,),


                                      Padding(
                                        padding: const EdgeInsets.only(left:20.0),
                                        child: SingleChildScrollView(
                                          child: Column(children: List.generate(egitimPageProvider.resultContents?["contents"] !=null?(egitimPageProvider.resultContents?["contents"] as List).length:0, (index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(top:15.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.check,color: Colors.black,),
                                                  SizedBox(width: 20,),
                                                  Text(egitimPageProvider.resultContents?["contents"][index] ??"",style: TextStyle(color: Colors.black,fontSize: 25),),
                                                ],
                                              ),
                                            );

                                          }),),
                                        ),
                                      ),



                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 80,
                                child: Container(
                                  height:100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(150),
                                    image: DecorationImage(
                                      image: AssetImage("assets/finance.png",)
                                    )
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:30),
                        Padding(
                          padding: const EdgeInsets.only(left:250.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).pushNamed("/yardim");

                            },
                            child: Container(
                              width: 150,
                              height: 50,
                               decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text("Detay Al",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //body
                  Bottom()

                ],
              ),
            ),
        ],
      ):Container()
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async{
    egitimPageProvider.context=context;
   await egitimPageProvider.getAllMethods();
  }
}


