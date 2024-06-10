import 'package:flutter/cupertino.dart';

class ImgNotFound extends StatefulWidget {
  const ImgNotFound({super.key});

  @override
  State<ImgNotFound> createState() => _ImgNotFoundState();
}

class _ImgNotFoundState extends State<ImgNotFound> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/no_image.png")
        
        
      ],
    );
  }
}
