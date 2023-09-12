

import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:mvvm_provider/data/network/networkApiServices.dart';
import 'package:mvvm_provider/utilities/app_url.dart';

class AuthRepository
{
  BaseApiServices _apiServices=NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async
  {
    try{
      dynamic response= await _apiServices.getPostAPiServices(AppUrl.loginEndPoint, data);
      return response;
    } catch(e)
    {
      throw(e);
    }
  }
  Future<dynamic> SignUpApi(dynamic data) async
  {
    try{
      dynamic response= await _apiServices.getPostAPiServices(AppUrl.registerEndPoint, data);
      return response;
    } catch(e)
    {
      throw(e);
    }
  }
}