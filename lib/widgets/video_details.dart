import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 47,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          color: Colors.black38,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // message Icon & text
              _detailsIcon(Icons.message),
              const SizedBox(width: 8),
              const Text('10', style: TextStyle(color: Colors.white)),
              const SizedBox(width: 12),
              // favorite icon & text
              _detailsIcon(Icons.favorite),
              const SizedBox(width: 8),
              const Text('122', style: TextStyle(color: Colors.white)),
              const Spacer(),
              // email send Icon
              _detailsIcon(Icons.attach_email_sharp),
              const SizedBox(width: 8),
              // bookmark Icon
              _detailsIcon(CupertinoIcons.bookmark_fill)
            ],
          ),
        ),
      ),
    );
  }

  Icon _detailsIcon(IconData icon) =>
      Icon(icon, size: 20, color: const Color(0xFFDADADA));
}
