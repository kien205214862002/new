import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/time_counter.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                top: 7 * size.height / 896, right: 5 * size.width / 414),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()),
                  );
                },
                child: Image.asset(
                  'assets/icons/Notification-1.png',
                  scale: 4,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: HomeBG(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 171 * size.height / 896,
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              height: 152 * size.height / 896,
              width: 281 * size.width / 414,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: fieldColor,
                  border: Border.all(color: fieldBorder, width: 2.5),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              child: Obx(() {
                if (counterController.obxIsCounter.isFalse) {
                  return Text(
                      "Hi there. I'm Guinea, your virtual friend character.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17 * size.width / 414));
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${counterController.obxCounterTime}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40 * size.width / 414,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "seconds",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14 * size.width / 414, color: Color.fromARGB(255, 160, 160, 160)),
                          ),
                        ],
                      ),
                      Text(
                        "Keep patient. We will find a friend sooner.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17 * size.width / 414),
                      ),
                    ],
                  );
                }
              }),
            ),
          ],
        )),
      ),
    );
  }
}
