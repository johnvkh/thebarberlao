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

class ExtraServicePage extends StatefulWidget {
  const ExtraServicePage({super.key});

  @override
  State<ExtraServicePage> createState() => _ExtraServicePageState();
}

class _ExtraServicePageState extends State<ExtraServicePage> {
  final _scrollController = TrackingScrollController();
  List<CategorieModel> listCategorie = [];
  bool loadProcessBar = false;
  bool isNotfound = false;
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    loadCategorie();
  }

  Future loadCategorie() async {
    try {
      listCategorie =
      await CategorieController().getCategorieByType(serviceType: "3");
      setState(() {
        loadProcessBar = true;
        if (listCategorie.isEmpty) isNotfound = true;
      });
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
        backgroundColor: const Color(0xFFFFF8F6),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  /// ✅ Section Title
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: deviceType == DeviceScreenType.mobile
                          ? 12
                          : size.width * 0.2,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        TextWidget(
                          getTranslated(context, 'ADDITIONAL_SERVICE')!,
                          Colors.black87,
                          22,
                          FontWeight.bold,
                          TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        loadProcessBar
                            ? ResponsiveStaggeredGridList(
                          desiredItemWidth:
                          deviceType == DeviceScreenType.mobile
                              ? size.width * 0.45
                              : size.width * 0.18,
                          children: List.generate(
                            listCategorie.length,
                                (index) {
                              final categorieModel =
                              listCategorie[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ImageServicePage(
                                        categorieName: categorieModel
                                            .categorieNameLA
                                            .toString(),
                                        router: "/ExtraService",
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  elevation: 4,
                                  shadowColor: Colors.black26,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                        const BorderRadius.vertical(
                                            top:
                                            Radius.circular(10)),
                                        child: Image.network(
                                          categorieModel.urlImage ?? "",
                                          fit: BoxFit.cover,
                                          height: 160,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _locale?.languageCode ==
                                                  "lo"
                                                  ? categorieModel
                                                  .categorieNameLA ??
                                                  ""
                                                  : categorieModel
                                                  .categorieNameEN ??
                                                  "",
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                              maxLines: 1,
                                              overflow:
                                              TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "${categorieModel.price} ${getTranslated(context, 'UNIT')!}",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.deepOrange,
                                                fontWeight:
                                                FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                            : SizedBox(
                          height: size.height * 0.4,
                          child: Center(child: LoadDialog(context)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const FooterMenu(),
                  const Footer(),
                ],
              ),
            ),
            /// ✅ Header
            Header(
              scrollController: _scrollController,
              isShow: true,
            ),
          ],
        ),
      ),
    );
  }
}
