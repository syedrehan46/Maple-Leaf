import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/app_fonts.dart';
import '../../utils/custom widgets/custom_appbar.dart';

class VideoLinks extends StatelessWidget {
  const VideoLinks({super.key});

  final List<Map<String, String>> videos = const [
    {
      'title': 'MapleFamily Family Vlog',
      'url': 'https://youtube.com/shorts/ankiPZL6sF0?si=26mJVtQqIoPQYrzR',
    },
    {
      'title': 'Maple Leaf Eid Campaign',
      'url': 'https://youtube.com/shorts/7DXYUVGOiyg?si=Hxlj4YUvsnLkgiz0',
    },
    {
      'title': 'MapleFamily Bara Bonus',
      'url': 'https://youtube.com/shorts/ewcOS7meWgw?si=oVzpC7C1p27vv1NQ',
    },
    {
      'title': 'MapleFamily Selfie Session',
      'url': 'https://youtube.com/shorts/aB2p5f6dQ_U?si=T_0297wHlhBiINlQ',
    },
    {
      'title': 'MapleFamily Dadi Jaan ki recipe',
      'url': 'https://youtube.com/shorts/TJ149rB14uM?si=BXAPxShRKy1JcYd_',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/menu_bg.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
               CustomAppbar(title: 'Video links'),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video['title']!,
                          style: AppFonts.styleHarmoniaBold18W6000(Colors.black),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () => _launchURL(video['url']!),
                          child: Text(
                            video['url']!,
                            style: AppFonts.styleHarmoniaRegular12W400(
                              Colors.blue,
                            ).copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.7,
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
