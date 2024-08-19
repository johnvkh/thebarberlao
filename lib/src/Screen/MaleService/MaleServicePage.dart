// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:thebarberlao/src/Screen/ImageManage/ImageServicePage.dart';
import 'package:thebarberlao/src/Utility/WidgetUtility.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/CategorieController.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/CategorieModel.dart';
import '../Footer.dart';
import '../FooterMenu.dart';
import '../Header.dart';

class MaleServicePage extends StatefulWidget {
  const MaleServicePage({
    super.key,
  });

  @override
  State<MaleServicePage> createState() => _MaleServicePageState();
}

class _MaleServicePageState extends State<MaleServicePage> {
  final _scrollController = TrackingScrollController();
  CategorieModel categorieModel = CategorieModel();
  List<CategorieModel> listCategorie = [];
  bool loadProcessBar = false;
  bool isNotfound = false;
  String languageCode = "";
  Locale? _locale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCategorie();
  }

  Future loadCategorie() async {
    try {
      listCategorie = await CategorieController().getCategorieByType(serviceType: "1");
      if (listCategorie.isNotEmpty) {
        setState(() {
          listCategorie;
          loadProcessBar = true;
        });
      } else {
        setState(() {
          loadProcessBar = true;
          isNotfound = true;
        });
      }
    } catch (error) {
      setState(() {
        loadProcessBar = true;
        isNotfound = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    return SafeArea(
      child: Scaffold(
        body: DeviceScreenType.mobile == deviceType
            ? Stack(children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: const Color.fromRGBO(255, 248, 246, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                TextWidget(
                                  getTranslated(context, 'SERVICE_MAN')!,
                                  Colors.black87,
                                  20,
                                  FontWeight.bold,
                                  TextAlign.start,
                                ),
                                const SizedBox(height: 10),
                                ResponsiveStaggeredGridList(
                                  desiredItemWidth: size.width * 0.4,
                                  children: List.generate(
                                    listCategorie.length,
                                    (index) {
                                      CategorieModel categorieModel = listCategorie[index];
                                      return MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            MaterialPageRoute route = MaterialPageRoute(
                                              builder: (context) => ImageServicePage(
                                                categorieName: categorieModel.categorieNameLA.toString(),
                                                router: "/MaleService",
                                              ),
                                            );
                                            Navigator.pushAndRemoveUntil(context, route, (route) => false);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Container(
                                              width: size.width * 0.4,
                                              height: 220,
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(240, 243, 245, 1),
                                                border: Border.all(
                                                  color: const Color.fromRGBO(44, 44, 44, 1),
                                                ),
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    child: Image.network(
                                                      categorieModel.urlImage.toString(),
                                                      fit: BoxFit.cover,
                                                      width: size.width * 0.4,
                                                      height: 160,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    _locale?.languageCode.toString() == "lo"
                                                        ? categorieModel.categorieNameLA.toString()
                                                        : categorieModel.categorieNameEN.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.normal,
                                                      fontFamily: 'roboto',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(height: 2),
                                                  TextWidget(
                                                    "${categorieModel.price} ${getTranslated(context, 'UNIT')!}",
                                                    Colors.black,
                                                    14,
                                                    FontWeight.normal,
                                                    TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const FooterMenu(),
                      const Footer(),
                    ],
                  ),
                ),
                Header(
                  scrollController: _scrollController,
                  isShow: true,
                ),
              ])
            : Stack(children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          loadProcessBar == true
                              ? Container(
                                  width: size.width * 0.6,
                                  color: const Color.fromRGBO(255, 248, 246, 1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        TextWidget(
                                          getTranslated(context, 'SERVICE_MAN')!,
                                          Colors.black87,
                                          20,
                                          FontWeight.bold,
                                          TextAlign.start,
                                        ),
                                        const SizedBox(height: 10),
                                        ResponsiveStaggeredGridList(
                                          desiredItemWidth: size.width * 0.18,
                                          children: List.generate(
                                            listCategorie.length,
                                            (index) {
                                              CategorieModel categorieModel = listCategorie[index];
                                              return MouseRegion(
                                                cursor: SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    MaterialPageRoute route = MaterialPageRoute(
                                                      builder: (context) => ImageServicePage(
                                                        categorieName: categorieModel.categorieNameLA.toString(),
                                                        router: "/MaleService",
                                                      ),
                                                    );
                                                    Navigator.pushAndRemoveUntil(context, route, (route) => false);
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(bottom: 10),
                                                    child: Container(
                                                      width: size.width * 0.18,
                                                      //height: size.height * 0.34,
                                                      height: 260,
                                                      decoration: BoxDecoration(
                                                        color: const Color.fromRGBO(240, 243, 245, 1),
                                                        border: Border.all(
                                                          color: const Color.fromRGBO(44, 44, 44, 1),
                                                        ),
                                                        borderRadius: const BorderRadius.all(
                                                          Radius.circular(5),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(5.0),
                                                            child: Image.network(
                                                              categorieModel.urlImage.toString(),
                                                              fit: BoxFit.cover,
                                                              width: size.width * 0.18,
                                                              //height: size.height * 0.25,
                                                              height: 200,
                                                            ),
                                                          ),
                                                          const SizedBox(height: 5),
                                                          TextWidget(
                                                            _locale?.languageCode.toString() == "lo" ? categorieModel.categorieNameLA.toString() : categorieModel.categorieNameEN.toString(),
                                                            Colors.black,
                                                            14,
                                                            FontWeight.normal,
                                                            TextAlign.center,
                                                          ),
                                                          const SizedBox(height: 5),
                                                          TextWidget(
                                                            "${categorieModel.price} ${getTranslated(context, 'UNIT')!}",
                                                            Colors.black,
                                                            14,
                                                            FontWeight.normal,
                                                            TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: size.width * 0.6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LoadDialog(context),
                                    ],
                                  ),
                                ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      const FooterMenu(),
                      const Footer(),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.2),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Header(
                        scrollController: _scrollController,
                        isShow: true,
                      ),
                    ),
                    SizedBox(width: size.width * 0.2),
                  ],
                ),
              ]),
      ),
    );
  }
}
