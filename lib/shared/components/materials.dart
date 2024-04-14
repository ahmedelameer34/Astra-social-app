import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../style/colors.dart';
import 'function.dart';

Widget defTextFormField(
        {required TextEditingController controller,
        required TextInputType textType,
        void Function(String)? onSubmit,
        void Function(String)? onChange,
        required String? Function(String)? validate,
        required String? label,
        required IconData? prefix,
        void Function()? onPressedsuffix,
        IconData? suffix,
        void Function()? onTap,
        bool isClickable = true,
        bool isPassword = false,
        context}) =>
    TextFormField(
        style: const TextStyle(color: Colors.grey),
        controller: controller,
        keyboardType: textType,
        obscureText: isPassword,
        onTap: onTap,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        validator: (value) => validate!(value!),
        enabled: isClickable,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              suffix,
              color: mainColor,
            ),
            onPressed: onPressedsuffix,
          ),
          prefixIcon: Icon(
            prefix,
            size: 30,
            color: mainColor,
          ),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
        ));
Widget defaultButton({
  required void Function()? onPressed,
  required String text,
  required Color? color,
}) =>
    Container(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainColor),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: color),
        ),
      ),
    );
Widget register({context, required Color? color, required Widget widget}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an accout? ",
          style: TextStyle(color: color),
        ),
        GestureDetector(
            onTap: () {
              navigateTo(context, widget);
            },
            child: Text(
              " REGISTER NOW",
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            )),
      ],
    );
Widget login({context, required Color? color, required Widget widget}) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an accout? ",
          style: TextStyle(color: color),
        ),
        GestureDetector(
            onTap: () {
              navigateTo(context, widget);
            },
            child: Text(
              " LOG IN ",
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            )),
      ],
    );
Widget defaultTextButton(
        {required void Function()? onPressed,
        required String text,
        double? fontSize,
        Color? textColor}) =>
    TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: fontSize),
        ));

Future<bool?> showToast({required String msg, required toastState state}) {
  return Fluttertoast.showToast(
      msg: msg, backgroundColor: chooseToastColor(state: state));
}

enum toastState { SUCCSESS, ERROR, WARNING }

Color chooseToastColor({required toastState state}) {
  Color? color;
  switch (state) {
    case toastState.SUCCSESS:
      color = Colors.green;
      break;
    case toastState.ERROR:
      color = Colors.red;
      break;
    case toastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
