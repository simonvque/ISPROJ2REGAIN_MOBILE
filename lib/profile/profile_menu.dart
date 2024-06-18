import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/profile/combal_page.dart';
import 'package:regain_mobile/profile/contactus_page.dart';
import 'package:regain_mobile/profile/edit_profile_page.dart';
import 'package:regain_mobile/profile/seller_profile_page.dart';
import 'package:regain_mobile/profile/settings_page.dart';
import 'package:regain_mobile/profile/transactions_page.dart';
import 'package:regain_mobile/profile/util/transactions_data.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StyleLabelTxt('PROFILE MENU'),
        StyleButtonMenu(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionsPage(
                            transactions: transactions,
                          )));
            },
            child: const Row(
              children: <Widget>[
                Icon(CupertinoIcons.doc_on_clipboard),
                Spacer(flex: 4),
                StyleBtnTxt('Transaction history'),
                Spacer(flex: 40),
                Icon(CupertinoIcons.chevron_forward),
              ],
            )),
        StyleButtonMenu(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CommissionPage()));
            },
            child: const Row(
              children: <Widget>[
                Icon(CupertinoIcons.creditcard),
                Spacer(flex: 4),
                StyleBtnTxt('Commission balance'),
                Spacer(flex: 40),
                Icon(CupertinoIcons.chevron_forward),
              ],
            )),
        StyleButtonMenu(
            onPressed: () {
              //insert code here
            },
            child: const Row(
              children: <Widget>[
                Icon(CupertinoIcons.exclamationmark_circle),
                Spacer(flex: 3),
                StyleBtnTxt('Penalty points'),
                Spacer(flex: 40),
                Icon(CupertinoIcons.chevron_forward),
              ],
            )),
        StyleButtonMenu(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          child: const Row(
            children: <Widget>[
              Icon(CupertinoIcons.settings),
              Spacer(flex: 2),
              StyleBtnTxt('Settings'),
              Spacer(flex: 40),
              Icon(CupertinoIcons.chevron_forward),
            ],
          ),
        ),
        StyleButtonMenu(
          onPressed: () {
            // code here
          },
          child: const Row(
            children: <Widget>[
              Icon(CupertinoIcons.question_circle),
              Spacer(flex: 2),
              StyleBtnTxt('FAQs'),
              Spacer(flex: 40),
              Icon(CupertinoIcons.chevron_forward),
            ],
          ),
        ),
        StyleButtonMenu(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactUsPage()));
          },
          child: const Row(
            children: <Widget>[
              Icon(CupertinoIcons.chat_bubble_2),
              Spacer(flex: 2),
              StyleBtnTxt('Contact us'),
              Spacer(flex: 40),
              Icon(CupertinoIcons.chevron_forward),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: 350,
          child: FilledButton(
              style: FilledButton.styleFrom(
                  backgroundColor: green,
                  foregroundColor: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SellerProfilePage() //temporary view
                        ));
              },
              child: const Text('Logout')),
        ),
      ],
    );
  }
}

class StyleButtonMenu extends StatelessWidget {
  const StyleButtonMenu(
      {super.key, required this.onPressed, required this.child});

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  side: const BorderSide(color: Colors.transparent),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 0))
              .copyWith(
                  overlayColor:
                      const WidgetStatePropertyAll(Colors.transparent)),
          onPressed: onPressed,
          child: child),
    );
  }
}

class StyleBtnTxt extends StatelessWidget {
  const StyleBtnTxt(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ));
  }
}

class StyleLabelTxt extends StatelessWidget {
  const StyleLabelTxt(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
    );
  }
}
