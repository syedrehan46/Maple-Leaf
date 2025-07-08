import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/app_fonts.dart';
import '../../utils/custom widgets/custom_appbar.dart';

class VideoLinks extends StatelessWidget {
  const VideoLinks({super.key});

  final List<Map<String, String>> videos = const [
    {
      'title': 'MapleFamily Family Vlog',
      'url': 'https://youtu.be/ankiPZL6sF0',
    },
    {
      'title': 'Maple Leaf Eid Campaign',
      'url': 'https://youtu.be/7DXYUVGOiyg',
    },
    {
      'title': 'MapleFamily Bara Bonus',
      'url': 'https://youtu.be/ewcOS7meWgw',
    },
    {
      'title': 'MapleFamily Selfie Session',
      'url': 'https://youtu.be/aB2p5f6dQ_U',
    },
    {
      'title': 'MapleFamily Dadi Jaan ki recipe',
      'url': 'https://youtu.be/TJ149rB14uM',
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
                              style: AppFonts.styleHarmoniaBold18W6000(
                                AppColors.blue2763E6Color,
                              )
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
    try {
      final Uri uri = Uri.parse(url);

      // Try different launch modes in order of preference
      final List<LaunchMode> modes = [
        LaunchMode.externalApplication,
        LaunchMode.inAppWebView,
        LaunchMode.platformDefault,
      ];

      bool launched = false;

      for (LaunchMode mode in modes) {
        try {
          if (await canLaunchUrl(uri)) {
            launched = await launchUrl(uri, mode: mode);
            if (launched) {
              print('Successfully launched with mode: $mode');
              break;
            }
          }
        } catch (e) {
          print('Failed with mode $mode: $e');
          continue;
        }
      }

      if (!launched) {
        print('All launch methods failed for: $url');
        // Show user-friendly error
        _showErrorDialog('Could not open YouTube video. Please check if YouTube app is installed.');
      }
    } catch (e) {
      print('Error launching URL: $e');
      _showErrorDialog('Error opening link: $e');
    }
  }

  void _showErrorDialog(String message) {
    // You can implement this to show a dialog to the user
    print('Error: $message');
  }
}