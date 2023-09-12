import 'package:flutter/material.dart';
class AppException implements Exception
{
 final message;
 final _prefix;
 AppException([this.message,this._prefix]);
 String toString()
 {
   return "$message $_prefix";
 }
}
class FetchDataException extends AppException
{
  FetchDataException([String? message]):super(message,'error during communication');
}
class BadRequestException extends AppException
{
  BadRequestException([String? message]):super(message,'Invalid request');
}
class UnauthorizedException extends AppException
{
  UnauthorizedException([String? message]):super(message,'Invalid request');
}
class InvalidInputException extends AppException
{
  InvalidInputException([String? message]):super(message,'Invalid request');
}