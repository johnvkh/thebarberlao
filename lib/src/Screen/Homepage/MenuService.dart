// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
  // List<PriceServiceModel> listService = [
  //   PriceServiceModel(serviceName: "ຕັດ", price: "80,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ຕັດ-ສະ-ຈັດຊົງ", price: "100,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ສະຈັດຊົງ", price: "50,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ຕັດຜົມເດັກນ້ອຍ", price: "50,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ຕັດ-ສະ-ຈັດຊົງເດັກນ້ອຍ", price: "70,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ຕັດພິເສດໄລ່ເຟດ", price: "90,000 +"),
  //   PriceServiceModel(serviceName: "ຕັດສະຈັດຊົງໂກນໜວດ", price: "130,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ໂກນໜວດຜ້າເຢັນ", price: "30,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ໂກນໜວດຜ້າຮ້ອນ-hotshave", price: "50,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ດັດຜົມວໍລຸ່ມ", price: "350,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ດັດຟອຍ", price: "450,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ຍືດຜົມທຳມະດາ", price: "350,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ຍືດຜົມວໍລຸ່ມ", price: "450,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ຍ້ອມຜົມດຳ", price: "160,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ຍ້ອມສີແຟຊັ່ນ", price: "500,000 +"),
  //   PriceServiceModel(serviceName: "ສະປາລ້າງສານເຄມີ", price: "80,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ສະປານາໂນ", price: "50,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ນວດໜ້າ+ນວດຕາ", price: "170,000 ກີບ"),
  //   PriceServiceModel(serviceName: "ວິຕາມີນຜົມ", price: "30,000 ກີບ"),
  // ];

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
    loadPriceServerInfo();
  }

  Future loadPriceServerInfo() async {
    try {
      listPriceService = await PriceServiceController().getAllPriceService();
      if (listPriceService.isNotEmpty) {
        setState(() {
          listPriceService;
          loadProcessBar = true;
        });
      } else {
        setState(() {
          loadProcessBar = true;
        });
      }
    } catch (error) {
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
