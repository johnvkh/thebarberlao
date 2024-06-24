// ignore_for_file: non_constant_identifier_names, file_names
import 'package:flutter/material.dart';
import '../Utility/WidgetUtility.dart';
import 'DefaultButtonWidget.dart';

Future DialogSucessfull(
  BuildContext context,
  String title,
  String message,
  VoidCallback btnOkOnPress,
) async {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          width: 380,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset("assets/icons/success.gif", scale: 1.6),
              ),
              TextWidget(
                title,
                Colors.black,
                20,
                FontWeight.bold,
                TextAlign.center,
              ),
              TextWidget(
                message,
                Colors.black,
                18,
                FontWeight.normal,
                TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      child: DefaultButtonWidget(
                        press: btnOkOnPress,
                        textValue: "Continue",
                        color: Colors.blue,
                        width: double.infinity,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future DialogConfirm(
  BuildContext context,
  String title,
  String message,
  VoidCallback btnOkOnPress,
) async {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          width: 380,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset("assets/icons/warning.gif", scale: 1.6),
              ),
              TextWidget(
                title,
                Colors.black,
                20,
                FontWeight.bold,
                TextAlign.center,
              ),
              TextWidget(
                message,
                Colors.black,
                18,
                FontWeight.normal,
                TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DefaultButtonWidget(
                      press: btnOkOnPress,
                      textValue: "Continue",
                      color: Colors.blue,
                      width: 100,
                      height: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DefaultButtonWidget(
                      press: () {
                        Navigator.pop(context);
                      },
                      textValue: "Cancel",
                      color: Colors.red,
                      width: 100,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future DialogFail(
  BuildContext context,
  String title,
  String message,
) async {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          width: 380,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset("assets/icons/error1.gif", scale: 1.6),
              ),
              TextWidget(
                title,
                Colors.black,
                20,
                FontWeight.bold,
                TextAlign.center,
              ),
              TextWidget(
                message,
                Colors.black,
                18,
                FontWeight.normal,
                TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      child: DefaultButtonWidget(
                        press: () {
                          Navigator.pop(context);
                        },
                        textValue: "Continue",
                        color: Colors.blue,
                        width: double.infinity,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future DialogFailConfirm(
  BuildContext context,
  String title,
  String message,
  VoidCallback btnOkOnPress,
) async {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          width: 380,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset("assets/icons/error1.gif", scale: 1.6),
              ),
              TextWidget(
                title,
                Colors.black,
                20,
                FontWeight.bold,
                TextAlign.center,
              ),
              TextWidget(
                message,
                Colors.black,
                18,
                FontWeight.normal,
                TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DefaultButtonWidget(
                      press: btnOkOnPress,
                      textValue: "Continue",
                      color: Colors.blue,
                      width: 100,
                      height: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DefaultButtonWidget(
                      press: () {
                        Navigator.pop(context);
                      },
                      textValue: "Cancel",
                      color: Colors.red,
                      width: 100,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 10,
          child: SizedBox(
            width: 80,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Image.asset(
                    "assets/images/loading.gif",
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  "ກຳລັງປະມວນຜົນ",
                  style: TextStyle(
                    fontFamily: "roboto",
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

Widget ShowDialog(BuildContext context) {
  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
    elevation: 10,
    child: SizedBox(
      width: 80,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: Image.asset(
              "assets/images/loading.gif",
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(width: 15),
          const Text(
            "ກຳລັງປະມວນຜົນ",
            style: TextStyle(
              fontFamily: "roboto",
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget LoadDialog(BuildContext context) {
  return Container(
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 40,
      child: Image.asset(
        "assets/images/loading.gif",
        width: 50,
        height: 50,
      ),
    ),
  );
}
