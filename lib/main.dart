 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:ocean/common/utils/theme_data.dart';
import 'package:ocean/presentation/provider/adminpanel_provider.dart';
import 'package:ocean/presentation/provider/bottomcomponent_provider.dart';
import 'package:ocean/presentation/provider/egitimpage_provider.dart';
import 'package:ocean/presentation/provider/hizmetpage_provider.dart';
import 'package:ocean/presentation/provider/mentorpage_provider.dart';
import 'package:ocean/presentation/provider/send_support_provider.dart';
import 'package:ocean/presentation/provider/supportpage_provider.dart';
import 'package:ocean/presentation/screen/adminlogin.dart';
import 'package:ocean/presentation/screen/adminpanelpage.dart';
import 'package:ocean/presentation/screen/egitimpage.dart';
import 'package:ocean/presentation/screen/hizmetpage.dart';
import 'package:ocean/presentation/screen/mentorpage.dart';
import 'package:ocean/presentation/screen/supportspage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
 import 'firebase_options.dart';


import 'presentation/provider/homepage_provider.dart';
import 'presentation/screen/homepage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseConfig.platformOptions
  );
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider<HomePageProvider>(create: (_) => HomePageProvider()),
    ChangeNotifierProvider<MentorPageProvider>(create: (_) => MentorPageProvider()),
    ChangeNotifierProvider<SupportPageProvider>(create: (_) => SupportPageProvider()),
    ChangeNotifierProvider<BottomProvider>(create: (_) => BottomProvider()),
    ChangeNotifierProvider<HizmetPageProvider>(create: (_) => HizmetPageProvider()),
    ChangeNotifierProvider<EgitimPageProvider>(create: (_) => EgitimPageProvider()),
    ChangeNotifierProvider<AdminPanelProvider>(create: (_) => AdminPanelProvider()),
    ChangeNotifierProvider<SendSupportProvider>(create: (_) => SendSupportProvider()),

  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          title: "İlk Adım",
          onUnknownRoute: (settings){
           return MaterialPageRoute(
              builder: (context) {
                return Scaffold(body: Center(child: Container(),));
              },
              settings: RouteSettings(name: settings.name),
            );
          },

          onGenerateRoute: (settings) {
            if (settings.name == null) {
              return MaterialPageRoute(
              builder: (context) {
                final params = settings.name!.split("/"); /// '/store/billy-shop/article/google-pixel-5' => ['' 'store' 'billy-shop' 'article' 'google-pixel-5']
                return Scaffold(body: Center(child: Text("none route",style: TextStyle(color: Colors.black),),));
              },
              settings: RouteSettings(name: settings.name),
            );
            }

            if (settings.name == '/mentor') {
              return MaterialPageRoute(
                builder: (context) {
                  return MentorPage();
                },
                settings: RouteSettings(name: settings.name),
              );
            }
            if (settings.name == '/anasayfa') {
              return MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
                settings: RouteSettings(name: settings.name),
              );
            }

            if (settings.name == '/egitim') {
              return MaterialPageRoute(
                builder: (context) {
                  return EgitimPage();
                },
               );
            }

            if (settings.name == '/hizmet') {
              return MaterialPageRoute(
                builder: (context) {
                  return HizmetPage();
                },
                settings: RouteSettings(name: settings.name),
              );
            }

            if (settings.name == '/yardim') {
              return MaterialPageRoute(
                builder: (context) {
                  return SupportPage();
                },
                settings: RouteSettings(name: settings.name),
              );
            }

            if (settings.name == '/admin') {
              return MaterialPageRoute(
                builder: (context) {
                  return AdminLogin();
                },
                settings: RouteSettings(name: settings.name),
              );
            }

            if (settings.name!.startsWith("/mentor/") && settings.name!.contains("/detail/")) {

              return MaterialPageRoute(
                builder: (context) {
                  final params = settings.name!.split("/"); /// '/store/billy-shop/article/google-pixel-5' => ['' 'store' 'billy-shop' 'article' 'google-pixel-5']
                  return Container();
                },
                settings: RouteSettings(name: settings.name),
              );
            }

          },
          //default route
          home: HomePage(),
        );
      }
    );
  }
}




 Loader? loader;

 void showLoader(cxt){
   Loader.show(cxt,
       isSafeAreaOverlay: true,
       isBottomBarOverlay: true,
       overlayFromBottom: 80,
       overlayColor: Colors.black26,
       progressIndicator: Container(
         width: 45.w,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Colors.white
         ),
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CupertinoActivityIndicator(color: AppTheme.primaryColor),

               Padding(
                 padding:  EdgeInsets.only(left:20.0),
                 child: Text("Lütfen bekleyiniz",style: Theme.of(cxt).textTheme.bodyMedium?.copyWith(color: Colors.black),),
               )
             ],
           ),
         ),
       ),
       themeData: Theme.of(cxt)
           .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green))

   );
 }

 void hideLoader(){
   Loader.hide();
 }