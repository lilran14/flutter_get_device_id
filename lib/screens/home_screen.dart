import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_get_device_id/bloc/device_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Id"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          BlocBuilder<DeviceBloc, DeviceState>(
            builder: (context, state) {
              if (state is DeviceLoading) {
                return CircularProgressIndicator();
              }
              if (state is DeviceLoaded) {
                return Container(
                  child: Column(
                    children: [
                      Text("Device Id from Platform Device Package :"),
                      Text(state.platformPackage),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Device Id from Device Id Package :"),
                      Text(state.deviceInfoPackage)
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              BlocProvider.of<DeviceBloc>(context)
                  .add(GetDeviceID(context: context));
            },
            child: Text("Get Device Id"),
            textColor: Colors.white,
            color: Colors.amber,
          )
        ]));
  }
}
