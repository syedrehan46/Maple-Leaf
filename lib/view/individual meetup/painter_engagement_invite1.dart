import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/custom%20widgets/background_image.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';

import '../../utils/app_colors.dart';

class PainterEngagementInvite1 extends StatefulWidget {
  String? city;
  String? painterName;
  String? painterNumber;

  PainterEngagementInvite1(
      {super.key, this.city, this.painterNumber, this.painterName});

  @override
  State<PainterEngagementInvite1> createState() =>
      _PainterEngagementInvite1State();
}

class _PainterEngagementInvite1State extends State<PainterEngagementInvite1> {
  void showKpiDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)
          ),
          backgroundColor: Colors.white,
          title: Text(
            'KPI..!!!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: SizedBox(
            height: 50,
            child: Text(
              'Are you sure to want to finalised engagement?',
              style: TextStyle(fontSize: 16),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Add your "Yes" logic here
              },
              child: Text(
                'Yes',
                style: TextStyle(color: AppColors.redColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text(
                'No',
                style: TextStyle(color: AppColors.redColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background Image
          BackgroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbar(title: 'Painter Engagement'),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "${widget.city ?? ''} ${widget.city != null ? '(${widget.city})' : ''}",
                  style: TextStyle(
                    color: AppColors.redColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 45,
                width: media.width * (0.8),
                decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.painterName}",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.painterNumber}",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: AppColors.blackColor,width: 3)),
                child: Center(child:Icon(Icons.camera_alt) ,),
              ),
              SizedBox(height: 5,),
              Center(
                child: Text(
                  "Attachments",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: AppColors.blackColor,width: 3)),
                child: Center(child:Icon(Icons.camera_alt) ,),
              ),
              SizedBox(height: 5,),
              Center(
                child: Text(
                  "I am Painter Attachments",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 30,
                width: media.width * (0.5),
                decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                child: InkWell(
                  onTap: (){
                    showKpiDialog(context);
                  },
                  child: Center(
                    child: Text(
                      "FINALISED",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content layer
        ],
      ),
    );
  }
}
