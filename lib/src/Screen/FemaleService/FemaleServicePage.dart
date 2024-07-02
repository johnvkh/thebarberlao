// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/CategorieController.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/CategorieModel.dart';
import '../../Utility/WidgetUtility.dart';
import '../Footer.dart';
import '../FooterMenu.dart';
import '../Header.dart';
import '../ImageManage/ImageServicePage.dart';

class FemaleServicePage extends StatefulWidget {
  const FemaleServicePage({super.key});

  @override
  State<FemaleServicePage> createState() => _FemaleServicePageState();
}

class _FemaleServicePageState extends State<FemaleServicePage> {
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
      listCategorie = await CategorieController().getCategorieByType(serviceType: "2");
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
                    color: Color.fromRGBO(255, 248, 246, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          TextWidget(
                            getTranslated(context, 'SERVICE_WOMAN')!,
                            Colors.black87,
                            20,
                            FontWeight.bold,
                            TextAlign.start,
                          ),
                          SizedBox(height: 10),
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
                                          router: "/FemaleService",
                                        ),
                                      );
                                      Navigator.pushAndRemoveUntil(context, route, (route) => false);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        width: size.width * 0.18,
                                        height: size.height * 0.34,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(240, 243, 245, 1),
                                          border: Border.all(
                                            color: Color.fromRGBO(44, 44, 44, 1),
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Image.network(
                                                categorieModel.urlImage.toString(),
                                                fit: BoxFit.cover,
                                                width: size.width * 0.18,
                                                height: size.height * 0.25,
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
                      color: Color.fromRGBO(255, 248, 246, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            TextWidget(
                              getTranslated(context, 'SERVICE_WOMAN')!,
                              Colors.black87,
                              20,
                              FontWeight.bold,
                              TextAlign.start,
                            ),
                            SizedBox(height: 10),
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
                                            router: "/FemaleService",
                                          ),
                                        );
                                        Navigator.pushAndRemoveUntil(context, route, (route) => false);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: Container(
                                          width: size.width * 0.18,
                                          height: size.height * 0.34,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(240, 243, 245, 1),
                                            border: Border.all(
                                              color: Color.fromRGBO(44, 44, 44, 1),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  categorieModel.urlImage.toString(),
                                                  fit: BoxFit.cover,
                                                  width: size.width * 0.18,
                                                  height: size.height * 0.25,
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
                        : Container(
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
