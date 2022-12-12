import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ocean/common/utils/theme_data.dart';
import 'package:ocean/presentation/provider/bottomcomponent_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
    required this.index
  }) : super(key: key);
  final int index;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with AfterLayoutMixin<Header>{
 late BottomProvider bottomProvider;
  @override
  Widget build(BuildContext context) {
    bottomProvider = Provider.of<BottomProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
       children: [
        Container(
          height: 60,
          width: double.infinity,
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.only(right:30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()async{
                 Navigator.pushNamed(context, "/anasayfa");
                  },
                  child: Container(
                    height: 60,
                    width:150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.cover)
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: ()async{
                        final Uri _url = Uri.parse(bottomProvider.telegramUrl);
                        await launchUrl(_url);
                      },
                      child: Container(
                        height: 35,
                        width:35,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/telegram.png"),fit: BoxFit.cover)
                      ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      onTap: ()async{
                        final Uri _url = Uri.parse(bottomProvider.instagramUrl);
                        await launchUrl(_url);
                      },
                      child: Container(
                        height: 30,
                        width:30,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/instagram.png"),fit: BoxFit.cover)
                      ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      onTap: ()async{
                        final Uri _url = Uri.parse(bottomProvider.faceBookUrl);
                        await launchUrl(_url);
                      },
                      child: Container(
                        height: 30,
                        width:30,
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/facebook.png"),fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                  ],
                ),
              ],
            ),
          ),),
         if(Device.screenType == ScreenType.mobile)
           AnimatedContainer(
          height: bottomProvider.menuHeight,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
           ),
          duration: Duration(milliseconds: 500),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:15.0,left: 10),
                  child: InkWell(
                      onTap: (){
                        bottomProvider.menuHeight==60?bottomProvider.menuHeight=200:bottomProvider.menuHeight=60;
                      },
                      child: Icon(Icons.menu,color: Colors.black,)),
                ),
                Visibility(
                  visible: bottomProvider.menuHeight==60?false:true,
                  child: Padding(
                    padding: const EdgeInsets.only(left:16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Visibility(
                                visible: widget.index == 0,
                                child: Container(width: 13,height: 2,color:AppTheme.primaryColor,)),
                            TextButton(onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil("/anasayfa", (route) => false);
                            }, child: Text("Anasayfa",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                          ],
                        ),
                        SizedBox(width: 60,),
                        Row(
                          children: [
                            Visibility(

                                visible: widget.index == 1,
                                child: Container(width: 13,height: 2,color: AppTheme.primaryColor,)),
                            TextButton(onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil("/mentor", (route) => false);

                            }, child: Text("Mentor",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                          ],
                        ),
                        SizedBox(width: 60,),
                        Row(
                          children: [
                            Visibility(
                                visible: widget.index == 2,
                                child: Container(width: 13,height: 2,color: AppTheme.primaryColor,)),
                            TextButton(onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil("/egitim", (route) => false);

                            }, child: Text("Eğitimler",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                          ],
                        ),
                        SizedBox(width: 60,),
                        Row(
                          children: [
                            Visibility(
                                visible: widget.index == 3,
                                child: Container(width: 13,height: 2,color: AppTheme.primaryColor,)),
                            TextButton(onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil("/hizmet", (route) => false);

                            }, child: Text("Hizmetler",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                          ],
                        ),
                        SizedBox(width: 60,),
                        Row(
                          children: [
                            Visibility(
                                visible: widget.index == 4,
                                child: Container(width: 13,height: 2,color: AppTheme.primaryColor,)),
                            TextButton(onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil("/yardim", (route) => false);

                            }, child: Text("Yardım",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
         if(Device.screenType != ScreenType.mobile)
           Container(
             height: 100,
             width: double.infinity,
             decoration: const BoxDecoration(
               color: Colors.white,
             ),
             child: Stack(
               children: [
                 Positioned(
                   bottom: 30,
                   left: 30,
                   child: Row(
                     children: [
                       Row(
                         children: [
                           Visibility(
                               visible: widget.index == 0,
                               child: Container(width: 13,height: 2,color:AppTheme.primaryColor,)),
                           TextButton(onPressed: () {
                             Navigator.of(context).pushNamed("/anasayfa");
                           }, child: Text("Anasayfa",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                         ],
                       ),
                       SizedBox(width: 60,),
                       Row(
                         children: [
                           Visibility(

                               visible: widget.index == 1,
                               child: Container(width: 13,height: 2,color: AppTheme.primaryColor,)),
                           TextButton(onPressed: () {
                             Navigator.of(context).pushNamed("/mentor");

                           }, child: Text("Mentor",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                         ],
                       ),
                       SizedBox(width: 60,),
                       Row(
                         children: [
                           Visibility(
                               visible: widget.index == 2,
                               child: Container(width: 13,height: 2,color: AppTheme.primaryColor,)),
                           TextButton(onPressed: () {
                             Navigator.of(context).pushNamed("/egitim");

                           }, child: Text("Eğitimler",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                         ],
                       ),
                       SizedBox(width: 60,),
                       Row(
                         children: [
                           Visibility(
                               visible: widget.index == 3,
                               child: Container(width: 13,height: 2,color: AppTheme.primaryColor,)),
                           TextButton(onPressed: () {
                             Navigator.of(context).pushNamed("/hizmet");

                           }, child: Text("Hizmetler",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                         ],
                       ),
                       SizedBox(width: 60,),
                       Row(
                         children: [
                           Visibility(
                               visible: widget.index == 4,
                               child: Container(width: 13,height: 2,color: AppTheme.primaryColor,)),
                           TextButton(onPressed: () {
                             Navigator.of(context).pushNamed("/yardim");

                           }, child: Text("Yardım",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16), ),),
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),

      ],
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context)async {
   await bottomProvider.getAllSocialMedia();
  }
}
