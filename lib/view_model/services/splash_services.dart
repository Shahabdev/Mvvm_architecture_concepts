import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider/utilities/routes/routes_name.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class SplashServices
{
  Future<UserModel>  getUserData()=>UserViewModel().getUser();
  void checkAuthentication(BuildContext context)async {
    getUserData().then((value) async {
      if(value.token=='null'||value.token=='')
        {
        await  Future.delayed(Duration(seconds: 4));
          Navigator.pushNamed(context, RoutesName.login);
        }
      else
          {
           await Future.delayed(Duration(seconds: 4));
            Navigator.pushNamed(context, RoutesName.homeScreen);
          }

    }).onError((error, stackTrace){
        if(kDebugMode)
         {
           print(error.toString());
         }
     });

  }
}