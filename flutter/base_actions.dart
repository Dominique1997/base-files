import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AppActions {
  navigateTo(context, [routingPage]) {
    if (routingPage != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => routingPage));
    } else {
      Navigator.pop(context);
    }
  }

  exceptionChecker(e) {
    if (e is SocketException) {
      debugPrint("Network error: ${e.message}");
    } else if (e is TimeoutException) {
      debugPrint("Request timed out: ${e.message}");
    } else if (e is HttpException) {
      debugPrint("HTTP error: ${e.message}");
    } else if (e is FormatException) {
      debugPrint("Response format error: ${e.message}");
    } else if (e is ClientException) {
      debugPrint("HTTP client error: ${e.message}");
    } else {
      debugPrint("Unexpected error: ${e.toString()}");
    }
  }
}
