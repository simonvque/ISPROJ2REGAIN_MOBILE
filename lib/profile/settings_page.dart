import 'package:regain_mobile/profile/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/profile/change_pw_page.dart';
import 'package:regain_mobile/profile/legal_policies_page.dart';
import 'package:regain_mobile/profile/profile_menu.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Settings'),
      body: Padding(
        padding: const EdgeInsets.all(20),
       child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const StyleLabelTxt('ACCOUNT & SECURITY'),
          StyleButtonMenu(
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePWPage())
            );
          },
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 25,
                width: 25,
                child:Image.asset('assets/icons/changePW.png'),
              ),
              const Spacer(flex: 4),
              const StyleBtnTxt('Change password'),
              const Spacer(flex: 40),
              SizedBox(
                height: 12,
                width: 12,
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset('assets/icons/arrow.png'),
                  )
              )
            ],
          )
          ),

          const StyleLabelTxt('ABOUT REGAIN'),
          StyleButtonMenu(
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LegalPolPage())
          );
          }, child: Row(
            children: <Widget>[
              SizedBox(
                height: 25,
                width: 25,
                child:Image.asset('assets/icons/legalPol.png'),
              ),
              const Spacer(flex: 4),
              const StyleBtnTxt('Legal & policies'),
              const Spacer(flex: 40),
              SizedBox(
                height: 12,
                width: 12,
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset('assets/icons/arrow.png'),
                  )
              )
            ],
          )
          ),
      ]
      )
    )
    );
  }
}
