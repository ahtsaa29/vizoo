import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:vizoo/resources/jitsi_meet_methods.dart';
import 'package:vizoo/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  //  joinMeeting(BuildContext context) async {
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              iconData: Icons.videocam,
              ontap: createNewMeeting,
              text: "New",
            ),
            HomeMeetingButton(
              iconData: Icons.add_box_rounded,
              ontap: () async {
                Navigator.pushNamed(context, '/video-call');
              },
              text: "Join",
            ),
            HomeMeetingButton(
              iconData: Icons.calendar_today,
              ontap: () {},
              text: "Schedule",
            ),
            HomeMeetingButton(
              iconData: Icons.arrow_upward_rounded,
              ontap: () {},
              text: "Share",
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(
              "Create/Join meeting with just a click.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
