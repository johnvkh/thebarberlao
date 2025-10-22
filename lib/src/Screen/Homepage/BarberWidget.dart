// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/BarberController.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/BarberModel.dart';
import '../../Utility/WidgetUtility.dart';

class BarberWidget extends StatefulWidget {
  const BarberWidget({super.key});

  @override
  State<BarberWidget> createState() => _BarberWidgetState();
}

class _BarberWidgetState extends State<BarberWidget> {
  List<BarberModel> listBarber = [];
  bool loadProcessBar = false;

  @override
  void initState() {
    super.initState();
    loadBarberInfo();
  }

  Future loadBarberInfo() async {
    try {
      if (kDebugMode) {
        print("----- loadBarberInfo -----");
      }
      listBarber = await BarberController().getAllBarber();
      setState(() {
        loadProcessBar = true;
      });
    } catch (error) {
      setState(() {
        loadProcessBar = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;

    return loadProcessBar
        ? Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 248, 246, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextWidget(
            getTranslated(context, 'BARBER_LIST')!,
            Colors.black,
            22,
            FontWeight.bold,
            TextAlign.center,
          ),
          const SizedBox(height: 20),

          /// 📱 Mobile (Swipe Horizontal)
          if (deviceType == DeviceScreenType.mobile|| deviceType == DeviceScreenType.tablet)
            SizedBox(
              height: size.height * 0.65,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: listBarber.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final barber = listBarber[index];
                  return _barberCard(
                    size.width * 0.8,
                    size.height * 0.6,
                    barber,
                  );
                },
              ),
            )
          else
          /// 💻 Desktop (Grid Layout)
            SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.9,
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemCount: listBarber.length,
                itemBuilder: (context, index) {
                  final barber = listBarber[index];
                  return _barberCard(
                    size.width * 0.25,
                    size.height * 0.7,
                    barber,
                  );
                },
              ),
            ),
        ],
      ),
    )
        : LoadDialog(context);
  }

  /// 🎨 Barber Card UI
  /// 🎨 Barber Card UI
  Widget _barberCard(double w, double h, BarberModel barber) {
    return GestureDetector(
      onTap: () {
        // 👉 TODO: Navigate ไปหน้า Profile Barber
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            /// 🖼️ รูป Barber
            Image.network(
              barber.imageURL ?? "",
              width: w,
              height: h,
              fit: BoxFit.cover,
            ),

            /// 🌓 Gradient Overlay
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 👤 ชื่อช่าง
                    Text(
                      barber.barberName ?? "Unknown Barber",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    /// 🪒 ตำแหน่ง / ความถนัด
                    if (barber.position != null && barber.position!.isNotEmpty)
                      Text(
                        barber.position!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),

                    /// 📞 เบอร์โทร
                    if (barber.phoneNumber != null &&
                        barber.phoneNumber!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            const Icon(Icons.phone,
                                size: 14, color: Colors.white70),
                            const SizedBox(width: 6),
                            Text(
                              barber.phoneNumber!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 8),
                    /// 🔘 Book Button
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            title: const Text("Coming Soon 🚀"),
                            content: const Text(
                              "This feature will be available in the next update.",
                              style: TextStyle(fontSize: 14),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text(
                                  "OK",
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
