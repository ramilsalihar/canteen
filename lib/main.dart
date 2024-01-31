import 'package:canteen/presentation/pages/application/application.dart';
import 'package:flutter/material.dart';
import 'package:canteen/locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const CanteenApp());
}
