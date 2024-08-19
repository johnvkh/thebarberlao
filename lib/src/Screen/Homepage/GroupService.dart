// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Utility/WidgetUtility.dart';

class GroupService extends StatefulWidget {
  const GroupService({super.key});

  @override
  State<GroupService> createState() => _GroupServiceState();
}

class _GroupServiceState extends State<GroupService> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<String> listExtraService = [
    "assets/images/barber/1.jpeg",
    "assets/images/barber/2.jpeg",
    "assets/images/barber/3.jpeg",
    "assets/images/barber/5.jpeg",
  ];
  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DeviceScreenType.mobile == deviceType
            ? Container(
                color: const Color.fromRGBO(255, 248, 246, 1),
                child: PreferredSize(
                  preferredSize: const Size.fromHeight(50.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: Colors.green.shade50,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TabBar(
                              tabs: [
                                Tab(
                                  text: getTranslated(context, 'SERVICE_MAN')!,
                                ),
                                Tab(
                                  text: getTranslated(context, 'SERVICE_WOMAN')!,
                                ),
                                Tab(
                                  text: getTranslated(context, 'ADDITIONAL_SERVICE')!,
                                ),
                              ],
                              controller: _tabController,
                              labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                              indicatorSize: TabBarIndicatorSize.tab,
                              dividerColor: Colors.transparent,
                              indicator: const BoxDecoration(
                                color: Color.fromRGBO(44, 44, 44, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Row(
                children: [
                  SizedBox(width: size.width * 0.2),
                  Container(
                    width: size.width * 0.6,
                    color: const Color.fromRGBO(255, 248, 246, 1),
                    child: PreferredSize(
                      preferredSize: const Size.fromHeight(50.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            color: Colors.green.shade50,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TabBar(
                                  tabs: [
                                    Tab(
                                      text: getTranslated(context, 'SERVICE_MAN')!,
                                    ),
                                    Tab(
                                      text: getTranslated(context, 'SERVICE_WOMAN')!,
                                    ),
                                    Tab(
                                      text: getTranslated(context, 'ADDITIONAL_SERVICE')!,
                                    ),
                                  ],
                                  controller: _tabController,
                                  labelStyle:
                                      const TextStyle(fontFamily: "roboto", fontSize: 14, fontWeight: FontWeight.bold),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  dividerColor: Colors.transparent,
                                  indicator: const BoxDecoration(
                                    color: Color.fromRGBO(44, 44, 44, 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.2),
                ],
              ),
        // ignore: sized_box_for_whitespace
        DeviceScreenType.mobile == deviceType
            ? Container(
                width: size.width,
                height: size.height * 0.3,
                color: const Color.fromRGBO(255, 248, 246, 1),
                // height: 341,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/MaleService', (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: _locale?.languageCode.toString() == "lo"
                              ? Image.asset(
                                  "assets/images/MaleServicelao.png",
                                  fit: BoxFit.fill,
                                  // width: size.width * 0.9,
                                  height: size.height * 0.35,
                                )
                              : Image.asset(
                                  "assets/images/MaleServiceEN.png",
                                  fit: BoxFit.fill,
                                  // width: size.width * 0.9,
                                  height: size.height * 0.35,
                                ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/FemaleService', (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: _locale?.languageCode.toString() == "lo"
                              ? Image.asset(
                                  "assets/images/FemaleServiceLA.png",
                                  fit: BoxFit.fill,
                                  // width: size.width * 0.9,
                                  height: size.height * 0.35,
                                )
                              : Image.asset(
                                  "assets/images/FemaleServiceEN.png",
                                  fit: BoxFit.fill,
                                  // width: size.width * 0.9,
                                  height: size.height * 0.35,
                                ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/ExtraService', (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Stack(
                          children: [
                            ResponsiveStaggeredGridList(
                              desiredItemWidth: size.width * 0.45,
                              children: List.generate(
                                listExtraService.length,
                                (index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      listExtraService[index],
                                      fit: BoxFit.cover,
                                      width: size.width * 0.5,
                                      height: size.height * 0.14,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              left: 0.0,
                              top: 10,
                              child: Center(
                                child: _locale?.languageCode.toString() == "lo"
                                    ? Image.asset(
                                        "assets/images/ClickHereLao.png",
                                        width: size.width * 0.9,
                                      )
                                    : Image.asset(
                                        "assets/images/ClickHereEN.png",
                                        width: size.width * 0.9,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                children: [
                  SizedBox(width: size.width * 0.2),
                  Container(
                    color: const Color.fromRGBO(255, 248, 246, 1),
                    width: size.width * 0.6,
                    height: size.height * 0.6,
                    // height: 341,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/MaleService', (route) => false);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: _locale?.languageCode.toString() == "lo"
                                  ? Image.asset(
                                      "assets/images/MaleServiceLao.png",
                                      fit: BoxFit.cover,
                                      width: size.width * 0.9,
                                      height: size.height * 0.5,
                                    )
                                  : Image.asset(
                                      "assets/images/MaleServiceEN.png",
                                      fit: BoxFit.cover,
                                      width: size.width * 0.9,
                                      height: size.height * 0.5,
                                    ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/FemaleService', (route) => false);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: _locale?.languageCode.toString() == "lo"
                                  ? Image.asset(
                                      "assets/images/FemaleServiceLA.png",
                                      fit: BoxFit.cover,
                                      width: size.width * 0.9,
                                      height: size.height * 0.5,
                                    )
                                  : Image.asset(
                                      "assets/images/FemaleServiceEN.png",
                                      fit: BoxFit.cover,
                                      width: size.width * 0.9,
                                      height: size.height * 0.5,
                                    ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/ExtraService', (route) => false);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Stack(
                              children: [
                                ResponsiveStaggeredGridList(
                                  desiredItemWidth: size.width * 0.29,
                                  children: List.generate(
                                    listExtraService.length,
                                        (index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          listExtraService[index],
                                          fit: BoxFit.cover,
                                          width: size.width * 0.29,
                                          height: size.height * 0.26,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  left: 0.0,
                                  top: 10,
                                  child: Center(
                                    child: _locale?.languageCode.toString() == "lo"
                                        ? Image.asset(
                                      "assets/images/ClickHereLao.png",
                                      width: size.width * 0.5,
                                    )
                                        : Image.asset(
                                      "assets/images/ClickHereEN.png",
                                      width: size.width * 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width * 0.2),
                ],
              ),
      ],
    );
  }
}
