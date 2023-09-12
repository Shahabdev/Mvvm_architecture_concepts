import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_provider/data/app_exception.dart';
import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:http/http.dart 'as http;

class NetworkApiServices extends BaseApiServices
{
  @override
  Future getApiResponse(String url) async {
   dynamic responseJson;
   try{
       final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
       responseJson=returnResponse(response);
   } on SocketException
   {
     throw FetchDataException('error during communication');
   }
   return responseJson;
  }

  @override
  Future getPostAPiServices(String url, dynamic data) async{
   dynamic responsejson;
    try
        {
          Response response=await post(
              Uri.parse(url),
              body: data).timeout(const Duration(seconds: 5));
            responsejson=returnResponse(response);
        } on SocketException
         {
           throw FetchDataException('no internet connection');
         }
         return responsejson;
  }
  dynamic returnResponse(http.Response response)
  {
    switch(response.statusCode) {
      case 200:
        dynamic responsejson =jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
             throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException('error occured while communicating with server '+
        'with status code'+ response.body.toString());

    }
  }
}
