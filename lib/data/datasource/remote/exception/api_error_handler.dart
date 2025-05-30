import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:sixvalley_vendor_app/data/model/response/base/error_response.dart';
import 'package:sixvalley_vendor_app/features/auth/controllers/auth_controller.dart';
import 'package:sixvalley_vendor_app/main.dart';


class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = "Send timeout";
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription = "Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
              case 403:
                if (kDebugMode) {
                  print("===403===>>${error.response!.data}");
                }
                  if(error.response!.data.containsKey('key')){
                    errorDescription = error.response!.data['key'];
                  }else if(error.response!.data['errors'] != null){
                    ErrorResponse errorResponse = ErrorResponse.fromJson(error.response?.data);
                    errorDescription = errorResponse.errors?[0].message;
                  }else{
                    errorDescription = error.response!.data['message'];
                  }
                  break;
                case 401:

                  if (kDebugMode) {
                    print("==401==>>401");
                    print("====>>${Provider.of<AuthController>(Get.context!,listen: false).isUnAuthorize}");
                  }


                  if(error.response!.data.containsKey('loginStatus')) {
                    errorDescription = error.response!.data['loginStatus'];
                  } else if(error.response!.data['errors'] != null){
                    ErrorResponse errorResponse = ErrorResponse.fromJson(error.response?.data);
                    errorDescription = errorResponse.errors?[0].message;
                  } else{
                    errorDescription = error.response!.data['message'];
                  }

                  errorDescription ??= 'unauthorized';

                  if (kDebugMode) {
                    print("===ErrorDescription====>>$errorDescription");
                  }

                  break;
                case 404:
                  if(error.response!.data['errors'] != null){
                    ErrorResponse errorResponse = ErrorResponse.fromJson(error.response?.data);
                    errorDescription = errorResponse.errors?[0].message;
                  }else{
                    errorDescription = error.response!.data['message'];
                  }
                  break;
                case 500:
                  print("==Responce=500=>>${error.response!.data}");
                case 503:
                  if(error.response!.data['message'] != null){
                    errorDescription = error.response!.data['message'];
                  }
                case 429:
                //errorDescription = error.response!.statusMessage;
                  break;
                default:
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {errorDescription = "Failed to load data - status code: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioExceptionType.badCertificate:
            // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
            // TODO: Handle this case.
              break;
            case DioExceptionType.unknown:
            // TODO: Handle this case.
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
