import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static final ApiManager _apiManager = ApiManager._internal();

  ApiManager._internal();

  factory ApiManager({http.Client? mockClient}) {
    _apiManager.mockClient = mockClient;
    return _apiManager;
  }

  static ApiManager get instance => _apiManager;

  http.Client? mockClient = http.Client();

  http.Client get client => mockClient ?? http.Client();

  Future<dynamic> getMedia(String authority, String path,
      Map<String, dynamic>? queryParams) async {

    final uri = Uri.https(authority, path, queryParams);

    debugPrint("Calling API: $uri");
    debugPrint("Calling parameters: $queryParams");

    dynamic responseJson;

    try {
      final response = await client.get(uri);

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Connection');
    }
    return responseJson;
  }

  static dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error with Server StatusCode: ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final String? _message;
  final String? _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
