import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_get_device_id/bloc/device_bloc.dart';
import 'package:flutter_get_device_id/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeviceBloc>(
      create: (context) => DeviceBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Get Devive Id',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
