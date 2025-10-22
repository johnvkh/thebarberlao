import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../Localization/LanguageConstants.dart';

class GroupService extends StatefulWidget {
  const GroupService({super.key});

  @override
  State<GroupService> createState() => _GroupServiceState();
}

class _GroupServiceState extends State<GroupService>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> listExtraService = [
    "assets/images/barber/1.jpeg",
    "assets/images/barber/2.jpeg",
    "assets/images/barber/3.jpeg",
    "assets/images/barber/5.jpeg",
  ];

  Locale? _locale;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var deviceType = getDeviceType(size);
    return Container(
      color: const Color(0xffFFF8F6), // พื้นหลังอ่อน
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Text(
            getTranslated(context, "OUR_SERVICES") ?? "Our Services",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: getTranslated(context, 'SERVICE_MAN') ?? "Men"),
                Tab(text: getTranslated(context, 'SERVICE_WOMAN') ?? "Women"),
                Tab(text: getTranslated(context, 'ADDITIONAL_SERVICE') ?? "Extra"),
              ],
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black87,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          SizedBox(
            height: deviceType == DeviceScreenType.mobile
                ? size.height * 0.3
                : size.height * 0.6,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildServiceCard(
                  context,
                  image: _locale?.languageCode == "lo"
                      ? "assets/images/MaleServiceLao.png"
                      : "assets/images/MaleServiceEN.png",
                  route: "/MaleService",
                ),
                _buildServiceCard(
                  context,
                  image: _locale?.languageCode == "lo"
                      ? "assets/images/FemaleServiceLA.png"
                      : "assets/images/FemaleServiceEN.png",
                  route: "/FemaleService",
                ),
                // _buildServiceCard(
                //   context,
                //   image: _locale?.languageCode == "lo"
                //       ? "assets/images/FemaleServiceLA.png"
                //       : "assets/images/FemaleServiceEN.png",
                //   route: "/ExtraService",
                // ),
                  //ExtraService
                _buildExtraService(context, size),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context,
      {required String image, required String route}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 15,
              left: 15,
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  /// Extra service แสดงเป็น Grid 2x2
  Widget _buildExtraService(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, "/ExtraService", (route) => false);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 400, // 👈 กำหนดความสูงให้ grid ชัดเจน
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(), // ไม่ให้ scroll ในตัวเอง
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 คอลัมน์
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: (size.width) / 650,
              // 👉 คำนวณ: ความกว้างของการ์ด / ความสูงที่ต้องการ (200)
            ),
            itemCount: listExtraService.length.clamp(0, 4), // 👈 แสดงสูงสุด 4 รูป
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        listExtraService[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.25),
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
