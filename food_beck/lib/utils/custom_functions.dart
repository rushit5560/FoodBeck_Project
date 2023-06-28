import 'package:flutter/material.dart';

hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}