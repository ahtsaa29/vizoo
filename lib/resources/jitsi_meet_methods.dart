import 'dart:developer';

import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:vizoo/resources/auth_methods.dart';
import 'package:vizoo/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  Future<void> createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required isVideoMuted,
    String userName = '',
  }) async {
    try {
      var jitsiMeet = JitsiMeet();
      var options = JitsiMeetConferenceOptions(
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": false,
          "startWithVideoMuted": false,
          "subject": "Jitsi with Flutter",
        },
        featureFlags: {
          "unsaferoomwarning.enabled": false,
          FeatureFlags.welcomePageEnabled: false,
          FeatureFlags.audioMuteButtonEnabled: isAudioMuted,
          FeatureFlags.videoMuteEnabled: isVideoMuted,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: userName != ''
              ? userName
              : _authMethods.user.displayName,
          email: _authMethods.user.email,
          avatar: _authMethods.user.photoURL,
        ),
      );
      _firestoreMethods.addToMeetingHistory(roomName);
      jitsiMeet.join(options);
    } catch (e) {
      log("e:: ${e.toString()}");
    }
  }
}
