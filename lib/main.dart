import 'package:flutter/material.dart';
import 'package:mvvm_provider/view_model/auth_view_model.dart';
import 'package:mvvm_provider/utilities/routes/routes.dart';
import 'package:mvvm_provider/utilities/routes/routes_name.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewModel()),
      ChangeNotifierProvider(create: (_)=>UserViewModel())
    ],
    child: MaterialApp(
      initialRoute:RoutesName.splash,
      onGenerateRoute:Routes.generateRoutes,

    ),);

  }
}

