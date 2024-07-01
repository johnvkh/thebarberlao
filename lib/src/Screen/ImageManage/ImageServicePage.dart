// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:thebarberlao/src/Controller/ImageServiceController.dart';
import 'package:thebarberlao/src/Utility/WidgetUtility.dart';

import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/CategorieController.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/CategorieModel.dart';
import '../../Model/ImageServiceModel.dart';
import '../Footer.dart';
import '../FooterMenu.dart';
import '../Header.dart';
import '../HeaderImage.dart';
import 'ViewImage.dart';

class ImageServicePage extends StatefulWidget {
  const ImageServicePage({super.key, required this.categorieName, required this.router});

  final String categorieName;
  final String router;

  @override
  State<ImageServicePage> createState() => _ImageServicePageState();
}

class _ImageServicePageState extends State<ImageServicePage> {
  final _scrollController = TrackingScrollController();
  ImageServiceModel imageServiceModel = ImageServiceModel();
  List<ImageServiceModel> listImageService = [];
  bool loadProcessBar = false;
  bool isNotfound = false;
  String languageCode = "";
  Locale? _locale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImageService();
  }

  Future loadImageService() async {
    print("====${widget.categorieName}");
    try {
      listImageService = await ImageServiceController().getImageServerByType(
        categorieName: widget.categorieName,
      );
      if (listImageService.isNotEmpty) {
        setState(() {
          listImageService;
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
                      loadProcessBar == true
                          ? Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                color: Color.fromRGBO(255, 248, 246, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      TextWidget(
                                        getTranslated(context, 'IMAGE')!,
                                        Colors.black87,
                                        20,
                                        FontWeight.bold,
                                        TextAlign.start,
                                      ),
                                      SizedBox(height: 10),
                                      ResponsiveStaggeredGridList(
                                        desiredItemWidth: size.width * 0.4,
                                        children: List.generate(
                                          listImageService.length,
                                          (index) {
                                            ImageServiceModel imageServiceModel = listImageService[index];
                                            return MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return ViewImage(
                                                        imageUrl: imageServiceModel.imageUrl.toString(),
                                                        width: 400,
                                                        height: 432,
                                                        widthImage: 400,
                                                        heightImage: 370,
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom: 10),
                                                  child: Container(
                                                    width: size.width * 0.4,
                                                    height: size.height * 0.23,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(240, 243, 245, 1),
                                                      border: Border.all(
                                                        color: Color.fromRGBO(44, 44, 44, 1),
                                                      ),
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(2),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(2.0),
                                                      child: Image.network(
                                                        imageServiceModel.imageUrl.toString(),
                                                        fit: BoxFit.cover,
                                                        width: size.width * 0.4,
                                                        height: size.height * 0.16,
                                                      ),
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
                      const FooterMenu(),
                      const Footer(),
                    ],
                  ),
                ),
                HeaderImage(
                  scrollController: _scrollController,
                  isShow: true,
                  router: widget.router,
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
                                          getTranslated(context, 'SERVICE_MAN')!,
                                          Colors.black87,
                                          20,
                                          FontWeight.bold,
                                          TextAlign.start,
                                        ),
                                        SizedBox(height: 10),
                                        ResponsiveStaggeredGridList(
                                          desiredItemWidth: size.width * 0.18,
                                          children: List.generate(
                                            listImageService.length,
                                            (index) {
                                              ImageServiceModel imageServiceModel = listImageService[index];
                                              return MouseRegion(
                                                cursor: SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(bottom: 10),
                                                    child: Container(
                                                      width: size.width * 0.18,
                                                      height: size.height * 0.31,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(240, 243, 245, 1),
                                                        border: Border.all(
                                                          color: Color.fromRGBO(44, 44, 44, 1),
                                                        ),
                                                        borderRadius: BorderRadius.all(
                                                          Radius.circular(8),
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        child: Image.network(
                                                          imageServiceModel.imageUrl.toString(),
                                                          fit: BoxFit.cover,
                                                          width: size.width * 0.18,
                                                          height: size.height * 0.21,
                                                        ),
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
