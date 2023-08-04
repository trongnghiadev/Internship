import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareImage extends StatefulWidget {
  const ShareImage({Key? key}) : super(key: key);

  @override
  State<ShareImage> createState() => _ShareImageState();
}

class _ShareImageState extends State<ShareImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Plus"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Share eclectify University with your friends:',
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
                onPressed: sharePressed,
                icon: const Icon(
                  Icons.share,
                  color: Colors.redAccent,
                )),
            Image.asset(
              "assets/lunch_break.png",
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ],
        ),
      ),
    );
  }

  void sharePressed() {
    String message = 'Check out eclectify University, where you can become an '
        'Elite Flutter Developer in no time: https://eclectify-universtiy.web.app';
    Share.share(message);

    /// optional subject that will be used when sharing to email
    // Share.share(message, subject: 'Become An Elite Flutter Developer');
    /// share a file

    // Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
    // /// share multiple files
    // Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
  }

// void sharePressed() async {
//   String message = 'Check out eclectify University, where you can become an '
//       'Elite Flutter Developer in no time: https://eclectify-universtiy.web.app';
//
//   Directory directory = await getApplicationDocumentsDirectory();
//
//   Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
// }
//
// getApplicationDocumentsDirectory() {}
}
