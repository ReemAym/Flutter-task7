import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    // Map<String, String> headers = {};

    Map<String, String> headers = {
      'Content-Type':
          'aapplication/x-www-form-urlencoded', // Ensure the API expects JSON format
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200)
      return jsonDecode(response.body);
    else
      throw Exception(
          'there was a problem in status code ${response.statusCode}');
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there was a problem in status code ${response.statusCode}');
    }
  }

  Future<dynamic> put(
      {required String url,
      required int id,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};

    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);

    print('url= $url, body= $body, token= $token');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print('data= $data');
      return data;
    } else {
      throw Exception(
          'there was a problem in status code ${response.statusCode}');
    }
  }
}
