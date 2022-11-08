import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/home_controller.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';

class HomePage extends View {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends ViewState<HomePage, HomeController> {
  HomePageState() : super(HomeController());

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ControlledWidgetBuilder<HomeController>(builder: (_, controller) {
            return ListView.builder(
                itemCount: controller.instruments.length,
                itemBuilder: (_, index) {
                  final InstrumentEntity item = controller.instruments[index];
                  return Text(item.symbol);
                });
          }),
        ),
      );
}
