import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Model/PriceModel.dart';
import '../../Utility/WidgetUtility.dart';

class MenuService extends StatefulWidget {
  const MenuService({super.key});

  @override
  State<MenuService> createState() => _MenuServiceState();
}

class _MenuServiceState extends State<MenuService> {
  List<PriceModel> listService = [
    PriceModel(serviceName: "ຕັດ", price: "80,000 ກີບ"),
    PriceModel(serviceName: "ຕັດ-ສະ-ຈັດຊົງ", price: "100,000 ກີບ"),
    PriceModel(serviceName: "ສະຈັດຊົງ", price: "50,000 ກີບ"),
    PriceModel(serviceName: "ຕັດຜົມເດັກນ້ອຍ", price: "50,000 ກີບ"),
    PriceModel(serviceName: "ຕັດ-ສະ-ຈັດຊົງເດັກນ້ອຍ", price: "70,000 ກີບ"),
    PriceModel(serviceName: "ຕັດພິເສດໄລ່ເຟດ", price: "90,000 +"),
    PriceModel(serviceName: "ຕັດສະຈັດຊົງໂກນໜວດ", price: "130,000 ກີບ"),
    PriceModel(serviceName: "ໂກນໜວດຜ້າເຢັນ", price: "30,000 ກີບ"),
    PriceModel(serviceName: "ໂກນໜວດຜ້າຮ້ອນ-hotshave", price: "50,000 ກີບ"),
    PriceModel(serviceName: "ດັດຜົມວໍລຸ່ມ", price: "350,000 ກີບ"),
    PriceModel(serviceName: "ດັດຟອຍ", price: "450,000 ກີບ"),
    PriceModel(serviceName: "ຍືດຜົມທຳມະດາ", price: "350,000 ກີບ"),
    PriceModel(serviceName: "ຍືດຜົມວໍລຸ່ມ", price: "450,000 ກີບ"),
    PriceModel(serviceName: "ຍ້ອມຜົມດຳ", price: "160,000 ກີບ"),
    PriceModel(serviceName: "ຍ້ອມສີແຟຊັ່ນ", price: "500,000 +"),
    PriceModel(serviceName: "ສະປາລ້າງສານເຄມີ", price: "80,000 ກີບ"),
    PriceModel(serviceName: "ສະປານາໂນ", price: "50,000 ກີບ"),
    PriceModel(serviceName: "ນວດໜ້າ+ນວດຕາ", price: "170,000 ກີບ"),
    PriceModel(serviceName: "ວິຕາມີນຜົມ", price: "30,000 ກີບ"),
  ];

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: const Color.fromRGBO(54, 52, 53, 1),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 280,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/LOGO03.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    "ລາຍການລາຄາ ແລະ ຂໍ້ສະເຫນີພິເສດ",
                    Colors.white,
                    18,
                    FontWeight.bold,
                    TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: listService.length,
                  itemBuilder: (context, index) {
                    PriceModel prceModel = listService[index];
                    return Row(
                      children: [
                        TextWidget(
                          prceModel.serviceName.toString(),
                          Colors.white,
                          14,
                          FontWeight.bold,
                          TextAlign.center,
                        ),
                        Spacer(),
                        TextWidget(
                          prceModel.price.toString(),
                          Colors.white,
                          14,
                          FontWeight.bold,
                          TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Image.asset("assets/images/barber/barber_shop02.png",width: 100,height: 100,),
            //     Image.asset("assets/images/barber/barber_shop03.png",width: 100,height: 100,),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
