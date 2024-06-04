import 'package:flutter/material.dart';
import 'package:regain_mobile/profile/contactus_page.dart';
import 'package:regain_mobile/profile/edit_profile_page.dart';
import 'package:regain_mobile/profile/settings_page.dart';

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
                      builder: (context) => const EditProfilePage()));
            },
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/icons/traHis.png'),
                ),
                const Spacer(flex: 4),
                const StyleBtnTxt('Transaction history'),
                const Spacer(flex: 40),
                SizedBox(
                    height: 12,
                    width: 12,
                    child: Opacity(
                      opacity: 0.7,
                      child: Image.asset('assets/icons/arrow.png'),
                    ))
              ],
            )),
        StyleButtonMenu(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()));
            },
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/icons/comBal.png'),
                ),
                const Spacer(flex: 4),
                const StyleBtnTxt('Commission balance'),
                const Spacer(flex: 40),
                SizedBox(
                    height: 12,
                    width: 12,
                    child: Opacity(
                      opacity: 0.7,
                      child: Image.asset('assets/icons/arrow.png'),
                    ))
              ],
            )),
        StyleButtonMenu(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()));
            },
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/icons/penPts.png'),
                ),
                const Spacer(flex: 3),
                const StyleBtnTxt('Penalty points'),
                const Spacer(flex: 40),
                SizedBox(
                    height: 12,
                    width: 12,
                    child: Opacity(
                      opacity: 0.7,
                      child: Image.asset('assets/icons/arrow.png'),
                    ))
              ],
            )),
        StyleButtonMenu(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 25,
                width: 25,
                child: Image.asset('assets/icons/settings.png'),
              ),
              const Spacer(flex: 2),
              const StyleBtnTxt('Settings'),
              const Spacer(flex: 40),
              SizedBox(
                  height: 12,
                  width: 12,
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset('assets/icons/arrow.png'),
                  ))
            ],
          ),
        ),
        StyleButtonMenu(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfilePage()));
          },
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 25,
                width: 25,
                child: Image.asset('assets/icons/faqs.png'),
              ),
              const Spacer(flex: 2),
              const StyleBtnTxt('FAQs'),
              const Spacer(flex: 40),
              SizedBox(
                  height: 12,
                  width: 12,
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset('assets/icons/arrow.png'),
                  ))
            ],
          ),
        ),
        StyleButtonMenu(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactUsPage()));
          },
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 25,
                width: 25,
                child: Image.asset('assets/icons/contactUs.png'),
              ),
              const Spacer(flex: 2),
              const StyleBtnTxt('Contact us'),
              const Spacer(flex: 40),
              SizedBox(
                  height: 12,
                  width: 12,
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset('assets/icons/arrow.png'),
                  ))
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
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()));
                },
                child: const Text('Logout'))),
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
                      const MaterialStatePropertyAll(Colors.transparent)),
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
