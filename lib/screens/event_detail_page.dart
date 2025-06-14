


import 'package:flutter/material.dart';
import '../models/events.dart';
import '../utils/colors.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softGray,
      appBar: AppBar(
        title: Text(event.name),
        backgroundColor: AppColors.primaryBrown,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                event.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              event.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              event.description,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import '../models/events.dart';
// import '../utils/colors.dart';
//
// class EventDetailPage extends StatefulWidget {
//   final Event event;
//
//   const EventDetailPage({super.key, required this.event});
//
//   @override
//   State<EventDetailPage> createState() => _EventDetailPageState();
// }
//
// class _EventDetailPageState extends State<EventDetailPage> {
//   VideoPlayerController? _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.event.video != null) {
//       _controller = VideoPlayerController.asset(widget.event.video!)
//         ..initialize().then((_) {
//           setState(() {});
//           _controller!.play(); // autoplay
//         });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.softGray,
//       appBar: AppBar(
//         title: Text(widget.event.name),
//         backgroundColor: AppColors.primaryBrown,
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Image.asset(
//                 widget.event.image,
//                 width: double.infinity,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               widget.event.name,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.textDark,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               widget.event.description,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: AppColors.textLight,
//               ),
//             ),
//             const SizedBox(height: 20),
//             if (_controller != null && _controller!.value.isInitialized)
//               AspectRatio(
//                 aspectRatio: _controller!.value.aspectRatio,
//                 child: VideoPlayer(_controller!),
//               )
//             else if (widget.event.video != null)
//               const Center(child: CircularProgressIndicator()),
//           ],
//         ),
//       ),
//     );
//   }
// }
