import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;


class AliENetRequest {
  static void get(String url, Map<String, String> params, Function successCallback,
       Function errorCallback) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }

    try {
      final response = await http.get(url);

      if (successCallback != null) {
        successCallback(response.body);
      }
    } catch (exception) {
      if (errorCallback != null) {
        errorCallback(exception);
      }
    }
  }

  static void post(String url, Map<String, String> params, Function successCallback,
      Function errorCallback) async {
    try {
      final response = await http.post(url, body: params);

      if (successCallback != null) {
        successCallback(json.decode(response.body));
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }


}

