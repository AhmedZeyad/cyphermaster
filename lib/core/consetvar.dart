import 'dart:ui';

import 'package:flutter/material.dart';

const Color primary = Color(0xff03C6D2);
const Color primary_shadow = Color(0xff03C6D2);
const Color primary_shado = Color(0xff739abe);
const Color primary_text = Colors.black;
const Color text = Color(0xff3e3e3e);
const Color text_body = Color(0xff797C7B);
const Color success = Color(0xff1EC678);
const Color warning = Color(0xffFC2E2E);
final BoxDecoration  ContanerDecoration=BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: primary, boxShadow: [BoxShadow(
    color: primary_shadow,
    blurRadius: 30.0,
    spreadRadius: 0.5
)
]);
final Size size = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
final double width = size.width;
final double height = size.height;

//Text Bold : #000000
// Text Body: #797C7B
// Name The App:#FBFBFB
// Botton Color: #03C6D2
// Botton Shadow: #03C6D2
// Box Color: #020617