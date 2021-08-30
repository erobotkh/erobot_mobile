import 'package:erobot/models/network_error_model.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class NetWorkException {
  final DioError error;

  NetWorkException(this.error);

  translateException() {
    switch (this.error.type) {
      case DioErrorType.cancel:
        return NetWorkErrorModel(
          title: tr('dioError.cancelled'),
          description: tr('dioError.yourRequestHasBeenCancelled'),
          statusCode: null,
        );
      case DioErrorType.connectTimeout:
        return NetWorkErrorModel(
          title: tr('dioError.connectionTimeOut'),
          description: tr('dioError.yourConnectionIsTimeout'),
          statusCode: null,
        );
      case DioErrorType.receiveTimeout:
        return NetWorkErrorModel(
          title: tr('dioError.recieveTimeout'),
          description: tr('dioError.yourRecievingDataIsTimeout'),
          statusCode: null,
        );
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case 400:
            return NetWorkErrorModel(
              title: tr('dioError.badRequest'),
              description: tr('dioError.sorryThisIsAnIllegalRequest'),
              statusCode: 400,
            );
          case 401:
            return NetWorkErrorModel(
              title: tr('dioError.unauthorize'),
              description: tr('dioError.youAreNotAllowToAccessThisResource'),
              statusCode: 401,
            );
          case 404:
            return NetWorkErrorModel(
              title: tr('dioError.notFound'),
              description: tr('dioError.yourRequestedUrlWasNotFound'),
              statusCode: 404,
            );
          case 422:
            return NetWorkErrorModel(
              title: tr('dioError.badRequest'),
              description: tr('dioError.sorryThisIsAnIllegalRequest'),
              statusCode: 422,
            );
          case 429:
            return NetWorkErrorModel(
              title: tr('dioError.tooManyRequests'),
              description: tr('dioError.sorryYouHaveSentManyRequest'),
              statusCode: 429,
            );
          case 500:
            return NetWorkErrorModel(
              title: tr('dioError.serverError'),
              description: tr('dioError.sorrySomethingWentWrongFromOurServer'),
              statusCode: 404,
            );
          case 503:
            return NetWorkErrorModel(
              title: tr('dioError.serviceUnavailable'),
              description: tr('dioError.sorryTheServerIsUnavailable'),
              statusCode: 503,
            );
          default:
            return NetWorkErrorModel(
              title: tr('dioError.unexpectedError'),
              description: tr('dioError.sorryThisISAnUnexpectedError'),
              statusCode: error.response?.statusCode,
            );
        }
      default:
        return NetWorkErrorModel(
          title: tr('dioError.unexpectedError'),
          description: tr('dioError.sorryThisISAnUnexpectedError'),
          statusCode: null,
        );
    }
  }
}
