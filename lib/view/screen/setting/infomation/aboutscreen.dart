import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:mozaeapp/content/appcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _launchWhatsApp() async {
    const String phone = "967777771369";
    const String message = "السلام عليكم، أريد الاستفسار عن تطبيق موزع الذكي";
    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
    );

    try {
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar(
          "تنبيه",
          "تعذر فتح واتساب، تأكد من تثبيت التطبيق",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Appcolor.basic.withOpacity(0.7),
          colorText: Appcolor.white,
        );
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ غير متوقع");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.background,
      appBar: AppBar(
        title: const Text(
          "حول التطبيق",
          style: TextStyle(
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
            color: Appcolor.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Appcolor.basic,
        elevation: 0,
        iconTheme: IconThemeData(color: Appcolor.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Appcolor.basic.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.local_shipping_rounded,
                  size: 80,
                  color: Appcolor.basic,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "موزع الذكي", //
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "الإصدار 1.0.0", //
              style: TextStyle(color: Colors.grey, fontFamily: "Cairo"),
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Appcolor.data,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Appcolor.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      _buildInfoRow(
                        Icons.description,
                        "عن المنصة",
                        "الحل المتكامل لإدارة عمليات التوزيع، يربطك بعملائك بدقة، يتابع إيراداتك لحظة بلحظة، ويمنحك السيطرة الكاملة على خطوط السير في كل منطقة.",
                      ),
                      const Divider(height: 30),
                      _buildInfoRow(
                        Icons.track_changes,
                        "رؤيتنا",
                        "تمكين الموزعين من تنظيم بياناتهم وتقليل الهدر المالي من خلال نظام تتبع جغرافي ومالي ذكي.",
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "تواصل معنا",
              style: TextStyle(
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(
                  FontAwesomeIcons.whatsapp,
                  "واتساب",
                  onTap: _launchWhatsApp,
                ),
                _buildSocialIcon(Icons.email, "الإيميل", onTap: () {}),
                _buildSocialIcon(
                  FontAwesomeIcons.github,
                  "قت اب",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Appcolor.basic, size: 24),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontFamily: "Cairo",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          content,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontFamily: "Cairo",
            fontSize: 14,
            color: Colors.black87,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String label, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(30),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Appcolor.data,
              child: Icon(icon, color: Appcolor.basic, size: 28),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontFamily: "Cairo"),
          ),
        ],
      ),
    );
  }
}
