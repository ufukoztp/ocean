
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ocean/common/utils/theme_data.dart';
import 'package:ocean/presentation/provider/homepage_provider.dart';
import 'package:ocean/presentation/provider/send_support_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/wigdets/bottom.dart';
import 'header.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  late HomePageProvider homePageProvider;
  late SendSupportProvider sendSupportProvider;
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
     super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    homePageProvider = Provider.of<HomePageProvider>(context);
    sendSupportProvider = Provider.of<SendSupportProvider>(context);
    return Scaffold(
      body:homePageProvider.headerBody!=null &&homePageProvider.headerTitle!=null
          &&homePageProvider.headerImage!=null
          &&homePageProvider.bodyContentItem2 !=null
          &&homePageProvider.bodyContentTitle2 !=null
          &&homePageProvider.bodyContentBody1!=null
          &&homePageProvider.bodyContentTitle1!=null? Stack(
        children: [
          SingleChildScrollView(
              child: Column(
                children: [
                  Header(index: 0),
                  //body

                  //body image
                  Container(
                    height: 550,
                    width: double.infinity,
                     decoration:  BoxDecoration(
                       image: DecorationImage(image: NetworkImage(homePageProvider.headerImage??""),fit:  BoxFit.cover),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:110.0,top:20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width:70.w ,
                              child: Text(homePageProvider.headerTitle!,style: AppTheme.theme.textTheme.bodyLarge,textAlign: TextAlign.start,)),

                          SizedBox(height: 30,),
                          Container(
                            width:70.w ,
                            child: Text(homePageProvider.headerBody!,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: AppTheme.primaryColor),),
                          ),

                        ],
                      ),
                    ),
                  ),

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //why create a company? text
                        Container(
                          width:80.w,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:45.0),
                                child: Text(homePageProvider.bodyContentTitle1!,style:AppTheme.theme.textTheme.bodyLarge?.copyWith( color:AppTheme.primaryColor,) ,textAlign: TextAlign.center,),
                              ),
                               Padding(
                                padding: EdgeInsets.only(top:45.0),
                                child: Text(homePageProvider.bodyContentBody1!,
                                  style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 100,
                        ),
                        //Info Cards
                        Container(
                          width:80.w,
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                             children: [
                               InkWell(
                                onTap:(){
                                 Navigator.of(context).pushNamed("/yardim");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(homePageProvider.serviceCards![0]["image"])
                                      )
                                    ),
                                    height: 280,
                                    width: 350,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(color: AppTheme.primaryColor,
                                        width: double.infinity,
                                          height: 80,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.add_a_photo,color: Colors.white,),
                                              SizedBox(width: 20,),
                                              Text(homePageProvider.serviceCards![0]["text"],style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 18
                                              ) ,),
                                            ],
                                          ),
                                        )
                                    ],),
                                  ),
                                ),
                              ),
                               InkWell(
                                 onTap:(){
                                   Navigator.of(context).pushNamed("/yardim");
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Container(
                                     decoration: BoxDecoration(
                                         color: Colors.grey,
                                         image: DecorationImage(
                                             fit: BoxFit.cover,
                                             image: NetworkImage(homePageProvider.serviceCards![1]["image"])
                                         )
                                     ),
                                      height: 280,
                                     width: 350,
                                      child: Column(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       children: [
                                         Container(color: AppTheme.primaryColor,
                                           width: double.infinity,
                                           height: 80,
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Icon(Icons.add_a_photo,color: Colors.white,),
                                               SizedBox(width: 20,),
                                               Text(homePageProvider.serviceCards![1]["text"],style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                   fontWeight: FontWeight.w900,
                                                   fontSize: 18
                                               ) ,),
                                             ],
                                           ),
                                         )
                                       ],),
                                   ),
                                 ),
                               ),
                               InkWell(
                                 onTap:(){
                                   Navigator.of(context).pushNamed("/yardim");
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Container(
                                     decoration: BoxDecoration(
                                         color: Colors.grey,
                                         image: DecorationImage(
                                             fit: BoxFit.cover,
                                             image: NetworkImage(homePageProvider.serviceCards![2]["image"])
                                         )
                                     ),
                                      height: 280,
                                     width: 350,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       children: [
                                         Container(color: AppTheme.primaryColor,
                                           width: double.infinity,
                                           height: 80,
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Icon(Icons.add_a_photo,color: Colors.white,),
                                               SizedBox(width: 20,),
                                               Text(homePageProvider.serviceCards![2]["text"],style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                   fontWeight: FontWeight.w900,
                                                   fontSize: 18
                                               ) ,),
                                             ],
                                           ),
                                         )
                                       ],),
                                   ),
                                 ),
                               ),


                             ],
                          ),
                        ),


                        SizedBox(
                          height: 100,
                        ),
                        //what we offer
                        Container(
                          color: Colors.grey.shade200,
                          width: double.infinity,
                           child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              Text(homePageProvider.bodyContentTitle2!,style: AppTheme.theme.textTheme.bodyLarge?.copyWith( color:AppTheme.primaryColor,fontSize: 50) ,),
                              SizedBox(
                                height: 80,
                              ),
                              GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500), itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.only(left: 50.0,right: 50),
                                  child: Container(
                                    height: 200,
                                     child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       Text(homePageProvider.bodyContentItem2![index]["title"],style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(homePageProvider.bodyContentItem2![index]["body"],textAlign: TextAlign.justify,style: TextStyle(fontSize: 15,color: Colors.grey),)
                                    ],),
                                  ),
                                );
                              },shrinkWrap: true,itemCount: 6,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        //contact
                        Form(
                          key: formKey,
                          child: Container(
                            color: Colors.black,
                            width: double.infinity,
                            height: 400,
                            child: Padding(
                              padding:   EdgeInsets.only(top:100.0,left: 5.w),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 450,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Geri arama talep edin.",style: AppTheme.theme.textTheme.bodyLarge?.copyWith(fontSize: 40,fontWeight: FontWeight.bold),),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text("Mali danışmanlarımızdan biriyle telefonda görüşmek ister misiniz? Ayrıntılarınızı gönderin, kısa süre içinde sizinle iletişime geçeceğiz. İsterseniz bize e-posta da gönderebilirsiniz."),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 350,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                         Container(
                                           width: 350,
                                           color:Colors.grey,
                                           child: Padding(
                                             padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                             child: TextFormField(
                                               validator: (value){
                                                 if(value == "")return "boş bırakmayınız";
                                               },
                                               controller: sendSupportProvider.nameController,
                                               decoration: InputDecoration(
                                                 border: InputBorder.none,
                                               hintText: "First name *"
                                               ),
                                             ),
                                           ),
                                         ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 350,
                                            color:Colors.grey,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                              child: TextFormField(
                                                validator: (value){
                                                  if(value == "")return "boş bırakmayınız";
                                                },
                                                controller: sendSupportProvider.e_mailController,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "E-mail *"
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 350,
                                            color:Colors.grey,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                              child: TextFormField(
                                                validator: (value){
                                                  if(value == "")return "boş bırakmayınız";
                                                },
                                                controller: sendSupportProvider.phoneController,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Phone *"
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5.w,),
                                    Container(
                                      width: 350,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 350,
                                            height: 110,
                                            color:Colors.grey,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                              child: TextFormField(
                                                validator: (value){
                                                  if(value == "")return "boş bırakmayınız";
                                                },
                                                controller: sendSupportProvider.messageController,
                                                expands: true,
                                                maxLines: null,
                                                 decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Your Message *"
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 120,
                                            height: 50,
                                            child: MaterialButton(
                                              color: AppTheme.primaryColor,
                                              onPressed: ()async{
                                               if(formKey.currentState!.validate())await sendSupportProvider.submit();
                                              },child: const Center(child: Text("Submit",style: TextStyle(fontWeight: FontWeight.w900),),),),
                                          )

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
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
    homePageProvider.context = context;
    sendSupportProvider.context = context;
    await homePageProvider.callAllGetMethods();

  }
}


