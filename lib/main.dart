import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_222/screen/home/home_cubit/home_cubit.dart';
import 'package:flutter_application_222/screen/home/home_screen.dart';
import 'package:flutter_application_222/screen/login/login_screen.dart';

import 'package:flutter_application_222/shared/constant/constant.dart';
import 'package:flutter_application_222/shared/style/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'firebase_options.dart';
import 'helper/cashe_helper.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CasheHelper.init();
  Widget? widget;
  uId = CasheHelper.getString(key: 'uId');
  print(uId);
  if (uId != null) {
    widget = HomeScreen();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget? startWidget;
  MyApp({super.key, this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()
          ..getUserData()
          ..getPosts(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: light,
            home: startWidget));
  }
}
