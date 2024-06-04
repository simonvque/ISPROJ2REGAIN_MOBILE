import 'package:flutter/material.dart';

AppBar buildAppBar (BuildContext context, dynamic title){
   
  return AppBar(
    backgroundColor: Colors.green,
    leading: const BackButton(color: Colors.white,),
    centerTitle: false,
    titleSpacing: 1.0,
    title: Text(title, style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
      ),
    ),
  );
}