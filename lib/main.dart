import 'package:canteen/core/di/service_locator.dart' as di;
import 'package:canteen/presentation/pages/application/application.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize
  await di.init();
  await Firebase.initializeApp();

  runApp(const CanteenApp());
}
