
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ocean/main.dart';
import 'package:ocean/presentation/provider/supportpage_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/utils/theme_data.dart';
import '../../core/wigdets/bottom.dart';
import '../provider/send_support_provider.dart';
import 'header.dart';


class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> with AfterLayoutMixin<SupportPage> {
  late SupportPageProvider supportPageProvider;
  late SendSupportProvider sendSupportProvider;
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    supportPageProvider = Provider.of<SupportPageProvider>(context);
    sendSupportProvider = Provider.of<SendSupportProvider>(context);
    return Scaffold(
      body:supportPageProvider.image!=null&&supportPageProvider.phone!=null&&supportPageProvider.mail!=null
          &&supportPageProvider.address!=null? Stack(
        children: [


            SingleChildScrollView(
              child: Column(
                children: [
                  Header(index: 4),
                  //body
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(supportPageProvider.image??"")
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Merhaba, nasıl yardımcı olabiliriz?",style: AppTheme.theme.textTheme.bodyLarge?.copyWith(fontSize: 55),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),

                  SizedBox(height: 50,),
                  ///contact
                  Form(
                    key: formKey,
                    child: Container(
                      color: Colors.grey.shade100,
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
                                    Text("Geri arama talep edin.",style: AppTheme.theme.textTheme.bodyLarge?.copyWith(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black),),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Mali danışmanlarımızdan biriyle telefonda görüşmek ister misiniz? Ayrıntılarınızı gönderin, kısa süre içinde sizinle iletişime geçeceğiz. İsterseniz bize e-posta da gönderebilirsiniz.",style: TextStyle(color: Colors.black),),

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
                                      color:Colors.grey.shade400,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
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
                                      color:Colors.grey.shade400,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
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
                                      color:Colors.grey.shade400,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
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
                                      color:Colors.grey.shade400,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
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
                  SizedBox(height: 50,),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left:50.0,right: 100.0),
                      child: Container(
                        width: 80.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:45.0),
                              child: Text("İletişim Bilgilerimiz",style:AppTheme.theme.textTheme.bodyLarge?.copyWith( color:Colors.black,fontSize: 30) ,textAlign: TextAlign.center,),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top:45.0),
                              child: Text("Bir sorunuz varsa, yorum yapmak veya Amazon Danışmanlığı hakkında daha fazla bilgi almak istiyorsanız lütfen bize bildirin.",style:TextStyle(fontSize: 15,color: Colors.black) ,textAlign: TextAlign.center,),
                            ),

                             Padding(
                              padding: EdgeInsets.only(top:45.0),
                              child: Container(
                                width: double.infinity,
                                height: 3,
                                color: AppTheme.primaryColor,
                              )
                            ),

                            ///contact info
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  Padding(
                                    padding: EdgeInsets.only(top:45.0),
                                    child: Container(
                                      width: 30.w,
                                      child: Row(children: [
                                        Icon(Icons.location_on,color: AppTheme.primaryColor,),
                                        SizedBox(width: 15,),
                                        Expanded(child: Text(supportPageProvider.address??"",style: TextStyle(color: Colors.black),))
                                      ],),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:45.0),
                                    child: Container(
                                      width: 30.w,
                                      child: Row(children: [
                                        Icon(Icons.phone,color: AppTheme.primaryColor,),
                                        SizedBox(width: 15,),
                                        Expanded(child: Text(supportPageProvider.phone??"",style: TextStyle(color: Colors.black),))
                                      ],),
                                    ),
                                  ),
                                ],),
                                Column(children: [
                                  Padding(
                                    padding: EdgeInsets.only(top:45.0),
                                    child: Container(
                                      width: 30.w,
                                      child: Row(children: [
                                        Icon(Icons.mail,color: AppTheme.primaryColor,),
                                        SizedBox(width: 15,),
                                        Expanded(child: Text(supportPageProvider.mail??"",style: TextStyle(color: Colors.black),))
                                      ],),
                                    ),
                                  ),
                                 ],)
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),


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
     showLoader(context);
   await supportPageProvider.getHeaderImage();
   await supportPageProvider.getContactInfoMail();
   await supportPageProvider.getContactInfoAddress();
   await supportPageProvider.getContactInfoPhone();
   hideLoader();
  }
}


