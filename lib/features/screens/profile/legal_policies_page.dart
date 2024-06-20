// import 'package:regain_mobile/features/screens/profile/app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:regain_mobile/features/screens/profile/privacypol_page.dart';
// import 'package:regain_mobile/features/screens/profile/profile_menu.dart';
// import 'package:regain_mobile/features/screens/profile/refundpol_page.dart';
// import 'package:regain_mobile/features/screens/profile/termofuse_page.dart';

// class LegalPolPage extends StatelessWidget {
//   const LegalPolPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: buildAppBar(context, 'Legal & policies'),
//         body: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               StyleButtonMenu(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const TermOfUsePage()));
//                   },
//                   child: Row(
//                     children: <Widget>[
//                       const StyleBtnTxt('Term of use'),
//                       const Spacer(flex: 40),
//                       SizedBox(
//                           height: 12,
//                           width: 12,
//                           child: Opacity(
//                             opacity: 0.7,
//                             child: Image.asset('assets/icons/arrow.png'),
//                           ))
//                     ],
//                   )),
//               StyleButtonMenu(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const PrivacyPolicyPage()));
//                   },
//                   child: Row(
//                     children: <Widget>[
//                       const StyleBtnTxt('Privacy policy'),
//                       const Spacer(flex: 40),
//                       SizedBox(
//                           height: 12,
//                           width: 12,
//                           child: Opacity(
//                             opacity: 0.7,
//                             child: Image.asset('assets/icons/arrow.png'),
//                           ))
//                     ],
//                   )),
//               StyleButtonMenu(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const RefundPolicyPage()));
//                   },
//                   child: Row(
//                     children: <Widget>[
//                       const StyleBtnTxt('Return & refund policy'),
//                       const Spacer(flex: 40),
//                       SizedBox(
//                           height: 12,
//                           width: 12,
//                           child: Opacity(
//                             opacity: 0.7,
//                             child: Image.asset('assets/icons/arrow.png'),
//                           ))
//                     ],
//                   )),
//             ])));
//   }
// }
