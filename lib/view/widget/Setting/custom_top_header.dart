import 'package:flutter/material.dart';

class CustomTopHeader extends StatelessWidget {
  const CustomTopHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // Color.fromARGB(255, 113, 46, 214),
              Color(0xff8B3DFF),
              Color(0xff9d4edd),
            ],
          ),
        ),

        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 30,
              left: 40,
              child: Icon(Icons.back_hand, size: 28, color: Colors.white30),
            ),
            Positioned(
              top: 115,
              left: 30,
              child: Icon(Icons.spa_outlined, size: 28, color: Colors.white30),
            ),
            Positioned(
              top: 55,
              left: 120,
              child: Icon(
                Icons.spatial_audio_off_rounded,
                size: 28,
                color: Colors.white30,
              ),
            ),
            Positioned(
              top: 40,
              right: 180,
              child: Icon(Icons.star, size: 24, color: Colors.white30),
            ),
            Positioned(
              top: 60,
              right: 110,
              child: Icon(
                Icons.hearing_outlined,
                size: 30,
                color: Colors.white30,
              ),
            ),

            // ------- العنوان ---------
            Positioned(
              left: 15,
              top: 80,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // ------- زر البحث ---------
            Positioned(
              top: 30,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xff8B3DFF),
                  radius: 26,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 32,
                        color: Color(0xff8B3DFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
