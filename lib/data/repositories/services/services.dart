import 'package:flutter/material.dart';

abstract class Services {
  void init();
  void dispose();
}

class ServiceResult<T> {
  @required
  bool status;

  @required T data;
  String message;

  ServiceResult({this.data, this.message, this.status});
}
