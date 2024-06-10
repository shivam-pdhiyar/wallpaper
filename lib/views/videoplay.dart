
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:walmart/controller/videocontroller.dart';


class VideoFile extends StatefulWidget {
  const VideoFile({super.key});

  @override
  State<VideoFile> createState() => _VideoFileState();
}

class _VideoFileState extends State<VideoFile> {
  final videoController1 = Get.put(VideoController1());

  @override
  void initState() {
    videoController1.getAllVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: videoController1.videoList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                videoController1.videoPlayer(
                  link: videoController1.videoList[index],);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(color: Colors.black, width: 5)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: videoController1.playController == null
                        ? const SizedBox(
                      child: Text(
                        "vivek",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    )
                        : VideoPlayer(videoController1.playController!),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}