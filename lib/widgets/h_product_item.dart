import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/model/product.dart';
import 'package:task_app/widgets/h_video_details.dart';
import 'package:task_app/widgets/h_video_player.dart';

class HProductItem extends StatelessWidget {
  const HProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('h:mm a').format(product.date);
    return Container(
      height: 345,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFDBFFEE),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // title
          Text(
            product.caption,
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
          // date
          Text(date,
              style: const TextStyle(fontSize: 15, color: Color(0xFF6C7A9C))),
          const SizedBox(height: 10),
          // videoPlayer
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: NetworkImage(product.videoUrl), fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  // video player
                  HVideoPlayer(videoUrl: product.videoUrl),
                  // bottom details container
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: HVideoDetails(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
