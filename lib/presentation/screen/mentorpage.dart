
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ocean/common/utils/theme_data.dart';
import 'package:ocean/presentation/provider/mentorpage_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/wigdets/bottom.dart';
import 'header.dart';


class MentorPage extends StatefulWidget {
  const MentorPage({Key? key}) : super(key: key);

  @override
  State<MentorPage> createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> with AfterLayoutMixin<MentorPage> {
  late MentorPageProvider mentorPageProvider ;
  @override
  Widget build(BuildContext context) {
    mentorPageProvider = Provider.of<MentorPageProvider>(context);
    return Scaffold(
      body: mentorPageProvider.headerBody!=null&& mentorPageProvider.headerTitle!=null
          && mentorPageProvider.headerImage!=null&& mentorPageProvider.sssTitle!=null
          && mentorPageProvider.sssItemList?.length!=0? Stack(
        children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Header(index: 1),
                  //body
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      image: DecorationImage(image: NetworkImage(mentorPageProvider.headerImage??""),fit:  BoxFit.cover),

                    ),                    child: Padding(
                      padding: const EdgeInsets.only(left:110.0,top:20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(mentorPageProvider.headerTitle??"",style: AppTheme.theme.textTheme.bodyLarge,textAlign: TextAlign.center,),
                          SizedBox(height: 30,),
                          Container(
                            width:70.w ,
                            child: Text(mentorPageProvider.headerBody??"",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ///s.s.s
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left:100.0,right: 100.0),
                      child: Container(
                        width: 80.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:45.0),
                              child: Text(mentorPageProvider.sssTitle??"",style:AppTheme.theme.textTheme.bodyLarge?.copyWith( color:AppTheme.primaryColor,fontSize: 60) ,textAlign: TextAlign.center,),
                            ),
                            GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 600), itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(30.0),
                                child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                 Text(mentorPageProvider.sssItemList?[index]["title"]??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 25),),
                                 SizedBox(height: 30,),
                                 Text(mentorPageProvider.sssItemList?[index]["body"]??"",style: TextStyle(color: Colors.black,fontSize: 1.w),),
                                    ],
                                     )

                              );
                            },shrinkWrap: true,itemCount: 6,)
                          ],
                        ),
                      ),
                    ),
                  ),


                  /*
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left:100.0,right: 100.0),
                      child: Container(
                        width: 80.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top:45.0),
                              child: Text(mentorPageProvider.costTitle ?? "",style:AppTheme.theme.textTheme.bodyLarge?.copyWith( color:AppTheme.primaryColor,fontSize: 60) ,textAlign: TextAlign.center,),
                            ),
                            GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500), itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Container(
                                    width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 50)]
                                  ),
                                ),
                              );
                            },shrinkWrap: true,itemCount: 2,)
                          ],
                        ),
                      ),
                    ),
                  ),

                   */
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
  FutureOr<void> afterFirstLayout(BuildContext context)async {
    mentorPageProvider.context = context;
   await mentorPageProvider.callAllGetMethods();
  }
}


