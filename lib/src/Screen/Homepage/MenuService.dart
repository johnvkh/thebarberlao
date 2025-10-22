// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/PriceServiceController.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/PriceServiceModel.dart';
import '../../Utility/WidgetUtility.dart';

class MenuService extends StatefulWidget {
  const MenuService({super.key});

  @override
  State<MenuService> createState() => _MenuServiceState();
}

class _MenuServiceState extends State<MenuService> {
  PriceServiceModel priceServiceModel = PriceServiceModel();
  List<PriceServiceModel> listPriceService = [];
  bool loadProcessBar = false;
  bool isNotfound = false;
  String languageCode = "";
  Locale? _locale;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!mounted) return;
    loadPriceServerInfo();
  }

  Future loadPriceServerInfo() async {
    try {
      listPriceService = await PriceServiceController().getAllPriceService();
      if (!mounted) return;
      if (listPriceService.isNotEmpty) {
        if (!mounted) return;
        setState(() {
          listPriceService;
          loadProcessBar = true;
        });
      } else {
        if (!mounted) return;
        setState(() {
          loadProcessBar = true;
        });
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        loadProcessBar = true;
        isNotfound = true;
      });
      if (kDebugMode) {
        print("Error loadSliderInfo:${error.toString()} ");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    getLocale().then((locale) {
      if (!mounted) return;
      setState(() {
        _locale = locale;
      });
    });
    return loadProcessBar
        ? Container(
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg222.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          getTranslated(context, 'PRICE_LIST')!,
                          Colors.white,
                          18,
                          FontWeight.bold,
                          TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 460,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listPriceService.length,
                        itemBuilder: (context, index) {
                          PriceServiceModel priceServiceModel =
                              listPriceService[index];
                          return Row(
                            children: [
                              TextWidget(
                                _locale?.languageCode.toString() == "lo"
                                    ? priceServiceModel.priceServiceNameLA
                                        .toString()
                                    : priceServiceModel.priceServiceNameEN
                                        .toString(),
                                Colors.white,
                                15,
                                FontWeight.bold,
                                TextAlign.center,
                              ),
                              const Spacer(),
                              TextWidget(
                                _locale?.languageCode.toString() == "lo"
                                    ? priceServiceModel.priceLA.toString()
                                    : priceServiceModel.priceEN.toString(),
                                Colors.white,
                                15,
                                FontWeight.bold,
                                TextAlign.center,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : LoadDialog(context);
  }
}
