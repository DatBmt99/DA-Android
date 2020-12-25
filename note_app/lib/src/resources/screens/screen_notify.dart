// // import 'package:note_app/services/push_notification.dart';

// // import '../../../main.dart';

// // class StartUpViewModel extends BaseModel {
// //   final PushNotificationService _pushNotificationService =
// //       locator<PushNotificationService>();

// //   Future handleStartUpLogic() async {
// //     await _pushNotificationService.initialise();
// //     var
// //   }
// // }
// import 'dart:async';


// Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
//   if (message.containsKey('data')) {
//     final dynamic data = message['data'];
//   }

//   if (message.containsKey('notification')) {
//     final dynamic notification = message['notification'];
//   }

// }
// final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

// @override
// void initState() {

//   super.initState();


//   Future.delayed(Duration.zero, () {
//     this.firebaseCloudMessagingListeners(context);});}

// void firebaseCloudMessagingListeners(BuildContext context) {
//   _firebaseMessaging.getToken().then((deviceToken) {
//     print("Firebase Device token: $deviceToken");

//   });
// }