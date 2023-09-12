import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider/reprositry/auth_repository.dart';
import 'package:mvvm_provider/utilities/routes/routes_name.dart';

import '../utilities/utils.dart';

class AuthViewModel with ChangeNotifier
{

  bool _loading =false;
  bool get loading=>_loading;
  setloading(bool value)
  {
    _loading=value;
    notifyListeners();
  }

  final _myRepo=AuthRepository();
  Future<void> loginApimodel(dynamic data, BuildContext context) async
  {
    setloading(true);
    _myRepo.loginApi(data).then((value)  {
      setloading(false);
      Utils.FlushToastMessage( context,"login succesful");
      Utils.ToastMessage('welocome');
      Navigator.pushNamed(context, RoutesName.homeScreen);
      if(kDebugMode)
        {
          print(value.toString());
        }
    }).onError((error, stackTrace) {
        setloading(false);
        Utils.FlushToastMessage(context,error.toString());

        print(error.toString());

    });
  }
  Future<void> SignUpApiModel(dynamic data, BuildContext context) async
  {
    _myRepo.loginApi(data).then((value)  {
      Utils.FlushToastMessage( context,"SignUp succesful");
      Navigator.pushNamed(context, RoutesName.homeScreen);
      if(kDebugMode)
        {
          print(value.toString());
        }

    }).onError((error, stackTrace) {

      Utils.FlushToastMessage( context,error.toString());

      if(kDebugMode)
        {
          print(error.toString());

        }


    });
  }
}