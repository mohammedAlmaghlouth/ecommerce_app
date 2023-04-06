import 'dart:async';
import 'package:ecommerce_app/src/app.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

void main() async {
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  /// error handler that caught all types
  await runZonedGuarded(() async {
    // ensure the binding is initialized, espically to prevent package to mess with it
    WidgetsFlutterBinding.ensureInitialized();
    // * Entry point of the app
    runApp(const MyApp());

    // * This code will present some error UI if any uncaught exception happens

    // this simple handler to caught error in print them in screen
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };

    // this is backup one, with design
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'.hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, 
  // this is second argument of runZonedGuarded, if neither ui handlers apply , it will apply this 
  (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}
