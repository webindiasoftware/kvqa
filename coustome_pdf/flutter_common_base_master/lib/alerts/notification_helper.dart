// /*
//  * Project      : tmt_common_base
//  * File         : notification_helper.dart
//  * Description  : Helper class for showing local notifications on Android and iOS/iPad
//  * Author       : kannappan
//  * Date         : 2025-02-18
//  * Version      : 1.0
//  * Ticket       :
//  */
//
// import 'dart:io';
//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationHelper {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   /// Initialize notification permissions (required for iOS/iPad)
//   /// Call this once when the app starts, before showing any notifications
//   static Future<bool> initialize() async {
//     if (Platform.isIOS) {
//       // Request notification permissions for iOS/iPad
//       final bool? result = await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//       return result ?? false;
//     }
//     // Android doesn't require explicit permission request for notifications
//     return true;
//   }
//
//   /// Show a local notification on both Android and iOS/iPad
//   static Future<void> showNotification(
//     int id,
//     String title,
//     String body,
//   ) async {
//     // Android notification details
//     var androidDetails = AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       channelDescription: 'Notifications for restricted area alerts',
//       importance: Importance.high,
//       priority: Priority.high,
//       showWhen: true,
//     );
//
//     // iOS/iPad notification details (DarwinNotificationDetails works for both iOS and macOS)
//     var iosDetails = DarwinNotificationDetails(
//       presentAlert: true, // Show alert when app is in foreground
//       presentBadge: true, // Update app badge
//       presentSound: true, // Play sound
//     );
//
//     // Create notification details for both platforms
//     var notificationDetails = NotificationDetails(
//       android: androidDetails,
//       iOS: iosDetails,
//     );
//
//     await flutterLocalNotificationsPlugin.show(
//       id,
//       title,
//       body,
//       notificationDetails,
//     );
//   }
// }
