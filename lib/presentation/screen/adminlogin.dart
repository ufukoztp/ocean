import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ocean/presentation/provider/adminpanel_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> with AfterLayoutMixin<AdminLogin> {
  late AdminPanelProvider adminPanelProvider;
  @override
  Widget build(BuildContext context) {
    adminPanelProvider = Provider.of<AdminPanelProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10)]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width:150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(height: 100,),
                    Text("ADMİN GİRİŞİ",style: TextStyle(color: Colors.black,fontSize: 24),),
                    SizedBox(height: 100,),
                    Padding(
                     padding: const EdgeInsets.only(left:16.0,right: 16.0),
                     child: TextFormField(
                       controller: adminPanelProvider.kullaniciController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(

                          disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                           enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                            hintText: "kullanıcı",
                            hintStyle: TextStyle(color: Colors.grey),
                        ),
                     ),
                      ),
                    SizedBox(height: 50,),
                    Padding(
                     padding: const EdgeInsets.only(left:16.0,right: 16.0),
                     child: TextFormField(
                       style: TextStyle(color: Colors.black),
                       controller: adminPanelProvider.passwordController,
                       decoration: InputDecoration(
                          disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                           enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                           hintText: "Parola",
                          hintStyle: TextStyle(color: Colors.grey)
                       ),
                     ),
                      ),
                    SizedBox(height: 50,),
                    InkWell(
                      onTap: (){
                        adminPanelProvider.login();
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Text("Giriş Yap"),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async{
    await adminPanelProvider.getUsername();
   await adminPanelProvider.getPassword();

   adminPanelProvider.context = context;

  }
}
