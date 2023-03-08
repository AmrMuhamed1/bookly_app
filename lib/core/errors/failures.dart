import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failure{
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError){
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return const ServerFailure('Sorry again later');
      case DioErrorType.sendTimeout:
        return const ServerFailure('Sorry again later');

      case DioErrorType.receiveTimeout:
        return const ServerFailure('Sorry again later');

      case DioErrorType.badCertificate:
        return const ServerFailure('Sorry again later');

      case DioErrorType.badResponse:
   return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return const ServerFailure('Sorry again later');

      case DioErrorType.connectionError:
        return const ServerFailure('Sorry again later');

      case DioErrorType.unknown:
       if(dioError.message!.contains('SocketException')){
         return const ServerFailure('No Internet Connection');
       }
       return const ServerFailure('unkown error');

    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response){
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['errors']['message']);
    } else if (statusCode == 404) {
      return const ServerFailure('Your request not found');
    } else if (statusCode == 500) {
      return const ServerFailure('Internal server erro ');
    } else {
      return const ServerFailure('opps there was an error');
    }
  }

  

}













