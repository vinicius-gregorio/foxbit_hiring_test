import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/home_controller.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/widgets/quotation_card/quotation_card.dart';
import 'package:foxbit_hiring_test_template/app/ui/base/app_colors.dart';
import 'package:foxbit_hiring_test_template/app/ui/base/app_text_styles.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';

class HomePage extends View {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends ViewState<HomePage, HomeController> {
  HomePageState() : super(HomeController());

  @override
  Widget get view => Scaffold(
        key: globalKey,
        backgroundColor: Colors.grey[100],
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(16, 32, 32, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Cotações",
                style: AppTextStyles.title,
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              Expanded(
                child: ControlledWidgetBuilder<HomeController>(builder: (_, controller) {
                  if (controller.assets.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.quotationPositive,
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount: controller.assets.length,
                      itemBuilder: (_, index) {
                        final InstrumentEntity item = controller.instruments[index];
                        final AssetEntity asset = controller.assets[index];
                        return QuotationCard(asset: asset);
                      });
                }),
              ),
            ],
          ),
        ),
      );
}
