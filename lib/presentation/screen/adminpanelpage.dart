import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ocean/presentation/provider/adminpanel_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/gestures.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> with AfterLayoutMixin<AdminPanel>{
 late AdminPanelProvider adminPanelProvider;
 final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    adminPanelProvider = Provider.of<AdminPanelProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Form(
          child: Row(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: double.infinity,
                color: Colors.black,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextButton(onPressed: () async{
                    adminPanelProvider.context = context;
                    await  adminPanelProvider.sendRequest();
                  }, child: Text("Yayımla",style: TextStyle(fontSize: 20),),),
                ),
              ),
              //anasayfa
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Anasayfa",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextController1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Başlık alanı"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(

                                  controller: adminPanelProvider.homeTextController2,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Başlık alanı açıklama"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            InkWell(
                              onTap: ()async{
                                print("basıldı");
                                await adminPanelProvider.pickImage(imageReferanceName.homepageheader);
                              },
                              child: Container(
                                width: 300,
                                height: 50,
                                child: Center(child: Text("Fotoğraf seç"),),
                                decoration: BoxDecoration(
                                    color:Colors.grey,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextController4,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "İçerik 1"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextController5,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "içerik 1 başlık"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextController6,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "içerik 2  başlık"
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextController7,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Service card 1 title"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            InkWell(
                              onTap: ()async{
                                adminPanelProvider.pickImage(imageReferanceName.cards1);
                              },
                              child: Container(
                                width: 300,
                                height: 50,
                                child: Center(child: Text("Fotoğraf seç"),),
                                decoration: BoxDecoration(
                                    color:Colors.grey,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextController9,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Service card 2 title"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            InkWell(
                              onTap: ()async{
                                adminPanelProvider.pickImage(imageReferanceName.cards2);
                              },
                              child: Container(
                                width: 600,
                                height: 50,
                                child: Center(child: Text("Fotoğraf seç"),),
                                decoration: BoxDecoration(
                                    color:Colors.grey,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextController11,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Service card 3 title"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            InkWell(
                              onTap: ()async{
                                adminPanelProvider.pickImage(imageReferanceName.cards3);
                              },
                              child: Container(
                                width: 300,
                                height: 50,
                                child: Center(child: Text("Fotoğraf seç"),),
                                decoration: BoxDecoration(
                                    color:Colors.grey,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),

                        ///offer cards
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer13,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offercards1 title"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer14,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 1 body"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer15,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 2 title"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer16,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 2 body"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer17,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 3 title"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer18,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 3 body"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer19,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 4 title"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer20,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 4 body"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer21,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 5 title"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer22,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 5 body"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer23,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 6 title"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                               width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.homeTextControlleroffer24,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "offer card 6 body"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),


                        SizedBox(height: 150,),
                        ///Mentor
                        Text("Mentor",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorTextController1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Başlık alanı"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorTextController2,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Başlık alanı açıklama"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            InkWell(
                              onTap: ()async{
                                adminPanelProvider.pickImage(imageReferanceName.mentorpageheader);
                              },
                              child: Container(
                                width: 300,
                                height: 50,
                                child: Center(child: Text("Fotoğraf seç"),),
                                decoration: BoxDecoration(
                                    color:Colors.grey,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                            ),


                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorTextController3,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "İçerik 1 başlık"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),

                          ],
                        ),

                        ///sssitems
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitem1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sss item1"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitem2,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sssitem2"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitem3,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sssitem3"
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitem4,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sss item4"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitem5,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sssitem5"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitem6,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sssitem6"
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 150,),


                        ///sssitemstitle
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitemtitle1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sss itemtitle1"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitemtitle2,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sssitemitle2"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitemtitle3,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sssitemitle3"
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitemtitle4,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sss itemitle4"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitemtitle5,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sssitemitle5"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.mentorSssitemtitle6,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "sssitemitle6"
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),



                        SizedBox(height: 150,),



                        ///Eğitimler
                        Text("Eğitimler",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.egitimTextController1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Başlık alanı"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.egitimTextController2,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "fiyat"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.egitimTextController3,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "fiyat tipi"
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.egitimTextControllerContent1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "İçerik 1"
                                  ),
                                ),
                              ),
                            ),
                              SizedBox(width: 20,),
                              Container(
                                width: 600,
                                color:Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                  child: TextFormField(
                                    controller: adminPanelProvider.egitimTextControllerContent2,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "içerik 2"
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                width: 600,
                                color:Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                  child: TextFormField(
                                    controller: adminPanelProvider.egitimTextControllerContent3,

                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "içerik 3"
                                    ),
                                  ),
                                ),
                              ),




                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(children: [

                          SizedBox(width: 20,),
                          Container(
                            width: 600,
                            color:Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.only(left:16.0,right: 16.0),
                              child: TextFormField(
                                controller: adminPanelProvider.egitimTextControllerContent4,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "içerik 4"
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 600,
                            color:Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.only(left:16.0,right: 16.0),
                              child: TextFormField(
                                controller: adminPanelProvider.egitimTextControllerContent5,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "içerik 5"
                                ),
                              ),
                            ),
                          ),
                        ],),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: ()async{
                            print("basıldı");
                            await adminPanelProvider.pickImage(imageReferanceName.egitimpageheader);
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            child: Center(child: Text("Fotoğraf seç"),),
                            decoration: BoxDecoration(
                                color:Colors.grey,
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                              width: 300,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.egitimTextController4,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Header Başlık"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 300,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.egitimTextController5,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Header Açıklama"
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 150,),

                        ///Yardım
                        Text("Yardım",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.supportAddressController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "address"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.supportMailController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "mail"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.supportPhoneController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "phone"
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: ()async{
                                adminPanelProvider.pickImage(imageReferanceName.yardimpageheader);
                              },
                              child: Container(
                                width: 300,
                                height: 50,
                                child: Center(child: Text("Fotoğraf seç"),),
                                decoration: BoxDecoration(
                                    color:Colors.grey,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 150,),
                        ///hizmetler
                        Text("Hizmetler hizmet ekleme",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.hizmetTextController1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Başlık alanı"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.hizmetTextController2,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "fiyat"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.hizmetTextController3,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "fiyat tipi"
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(adminPanelProvider.hizmetList.length, (index) {
                            return Row(
                              children: [
                                Text(adminPanelProvider.hizmetList[index]['title'],style: TextStyle(color: Colors.black,fontSize: 20),),
                                SizedBox(width: 20,),
                                IconButton(icon:Icon(Icons.clear,color: Colors.black,), onPressed: ()async {
                                 await adminPanelProvider.deleteHizmetItems(adminPanelProvider.hizmetList[index]['title'], adminPanelProvider.hizmetList[index]);
                                },),
                                SizedBox(width: 20,),
                                IconButton(icon:Icon(Icons.add_a_photo,color: Colors.black,), onPressed: ()async {
                                  await adminPanelProvider.pickImage(imageReferanceName.hizmetitemheader,pathName:adminPanelProvider.hizmetList[index]['title'] );
                                },),
                              ],
                            );
                          }),
                        ),
                        SizedBox(height: 150,),


                        Text("Hizmetler ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.hizmetTextController5,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "header başlık"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 300,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.hizmetTextController6,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "header body"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),


                          ],
                        ),


                        SizedBox(height: 150,),
                        Text("Alt Yazı ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.bottomTextController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Alt Açıklama"
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                        SizedBox(height: 150,),



                        SizedBox(height: 150,),
                        Text("Sosyal medya ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.instagramController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "İnstagram"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.telegramController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Telegram"
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 600,
                              color:Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                child: TextFormField(
                                  controller: adminPanelProvider.facebookController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Facebook"
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),

                        SizedBox(height: 150,),
                        Text("Geri Dönüş Talepleri ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
                        SizedBox(height: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:List.generate(adminPanelProvider.submitList.length, (index) {
                            return Row(children: [
                              Text("${index+1}.",style: TextStyle(color: Colors. black,fontSize: 20),),
                              SizedBox(width: 100,),
                              Text(adminPanelProvider.submitList[index]["name"],style: TextStyle(color: Colors. black,fontSize: 20),),
                              SizedBox(width: 100,),
                              Text(adminPanelProvider.submitList[index]["e-mail"],style: TextStyle(color: Colors. black,fontSize: 20),),
                              SizedBox(width: 100,),
                              Text(adminPanelProvider.submitList[index]["phone"],style: TextStyle(color: Colors. black,fontSize: 20),),
                              SizedBox(width: 100,),
                              Text(adminPanelProvider.submitList[index]["message"],style: TextStyle(color: Colors. black,fontSize: 20),),
                              SizedBox(width: 100,),
                              IconButton(icon: Icon(Icons.close,color: Colors.black,),onPressed: ()async{
                               await adminPanelProvider.deleteSupportnotf(adminPanelProvider.submitList[index]["message"]);
                               adminPanelProvider.submitList.remove(adminPanelProvider.submitList[index]);
                              },)

                            ],);
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context)async {
    adminPanelProvider.context = context;
    await adminPanelProvider.getSupportnotf();
    await adminPanelProvider.getHizmetItems();
  }
}



class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
