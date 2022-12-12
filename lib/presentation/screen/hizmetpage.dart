
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ocean/common/utils/theme_data.dart';
import 'package:ocean/presentation/provider/hizmetpage_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/wigdets/bottom.dart';
import 'header.dart';


class HizmetPage extends StatefulWidget {
  const HizmetPage({Key? key}) : super(key: key);

  @override
  State<HizmetPage> createState() => _HizmetPageState();
}

class _HizmetPageState extends State<HizmetPage> with AfterLayoutMixin<HizmetPage>{
  late HizmetPageProvider hizmetPageProvider;

  @override
  Widget build(BuildContext context) {
    hizmetPageProvider = Provider.of<HizmetPageProvider>(context);
    return Scaffold(
      body:hizmetPageProvider.resultList.length != 0? Stack(
        children: [


            SingleChildScrollView(
              child: Column(
                children: [
                  Header(index: 3),
                  //body
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      image: DecorationImage(image: NetworkImage(hizmetPageProvider.headerImage??""),fit:  BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:110.0,top:20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width:70.w ,
                              child: Text(hizmetPageProvider.headerTitle!,style: AppTheme.theme.textTheme.bodyLarge,textAlign: TextAlign.start,)),

                          SizedBox(height: 30,),
                          Container(
                            width:70.w ,
                            child: Text(hizmetPageProvider.headerBody!,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: AppTheme.primaryColor),),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                     width: double.infinity ,
                    color: Colors.white,
                    child: Center(
                      child: Wrap(
                         children: List.generate(hizmetPageProvider.resultList.length, (index) =>Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 300,
                            height: 500,
                            decoration: BoxDecoration(
                                 boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10
                                )]
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                      image: NetworkImage(hizmetPageProvider.resultList[index]["image_url"])
                                    )
                                  ),
                                ),

                                Container(
                                  height: 250,
                                  color: Colors.grey.shade100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:40.0,left: 40,right: 40),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(hizmetPageProvider.resultList[index]["title"],softWrap: true,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                                            Padding(
                                              padding: const EdgeInsets.only(top:12.0,bottom: 12.0),
                                              child: Container(height: 3,width: 30,color: AppTheme.primaryColor,),
                                            ),
                                            Text(hizmetPageProvider.resultList[index]["title"] +" "+hizmetPageProvider.resultList[index]["price_type"],softWrap: true,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20),),
                                            Padding(
                                              padding: const EdgeInsets.only(top:30.0),
                                              child: InkWell(
                                                onTap: (){
                                                  Navigator.of(context).pushNamed("/yardim");
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.primaryColor,
                                                  ),
                                                  child: Center(child: Text("Detay Al",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))

                      ),
                    ),
                  ),
                  //body
                  Bottom()

                ],
              ),
            ),
        ],
      ):Container(color: Colors.white,)
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async{
    hizmetPageProvider.context=context;
    await  hizmetPageProvider.getMethods();
  }
}


