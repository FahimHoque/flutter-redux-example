import 'package:flutter/material.dart';

class ApiException {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode}) {
    String toPrint = 'TimeStamp: ${DateTime.now()} '
        'Message: $message '
        'StatusCode: $statusCode';
    debugPrint(toPrint);
  }
}
