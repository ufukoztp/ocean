import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:ocean/common/utils/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../presentation/provider/bottomcomponent_provider.dart';

class Bottom extends StatefulWidget {
  const Bottom({
    Key? key,
  }) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> with AfterLayoutMixin<Bottom> {
  late BottomProvider bottomProvider;
  final String text ="Copyright © 2021 Algray E-Ticaret İnovasyon A.Ş. suspendplus.com. Tüm hakları saklıdır.Suspendplus.com sitesinde yer alan tüm metin, resim ve içeriklerin telif hakları ALGRAY A.Ş. aittir. Hiçbir şekilde basılı veya elektronik bir ortamda izinsiz kullanılamaz ve kopyalanamaz. Tüm bilgi ve fiyatlar bilgilendirme amaçlı olup, değişiklik arz edebilir. Fiyat ve bilgi yanlışlıklarından suspendplus.com sorumlu tutulmaz.";

  @override
  Widget build(BuildContext context) {
    bottomProvider = Provider.of<BottomProvider>(context);
    return Column(
      children: [
        /*
        Container(
          height: 400,
          width: double.infinity,
          color: AppTheme.primaryColor,
        ),

         */
        Container(
          height: 250,
          width: double.infinity,
          color: Colors.black87,
          child: Padding(
            padding:  EdgeInsets.only(left:2.0.w,right: 2.0.w),
            child: Center(child: Text(text,style: TextStyle(color: Colors.white),),),
          ),
        ),

      ],
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async{
   await bottomProvider.getBottomText();
  }
}
