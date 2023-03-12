// import 'dart:convert';
//
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:health_concern/doctor/appointment/model/doctor_list.dart';
// import 'package:health_concern/doctor/doctor_dtails/doctor_details.dart';
// import 'package:health_concern/healthtips/HealthTips_Widget.dart';
// import 'package:share/share.dart';
//
// class DynamicLinkService {
//   Future handleDynamicLinks(BuildContext context) async {
//     // 1. Get the initial dynamic link if the app is opened with a dynamic link
//     final PendingDynamicLinkData data =
//         await FirebaseDynamicLinks.instance.getInitialLink();
//     var deepLink = data?.link;
//     // 2. handle link that has been retrieved
//     if (deepLink != null) {
//       _handleDeepLink(data, context);
//     }
//
//     // 3. Register a link callback to fire if the app is opened up from the background
//     // using a dynamic link.
//     FirebaseDynamicLinks.instance.onLink(
//         onSuccess: (PendingDynamicLinkData dynamicLink) async {
//       // 3a. handle link that has been retrieved
//       _handleDeepLink(dynamicLink, context);
//     }, onError: (OnLinkErrorException e) async {
//       print('Deeeeeeeeeeepp Link is NUlllllllllllllllllllllllllll');
//     });
//   }
//
//   void _handleDeepLink(PendingDynamicLinkData data, BuildContext context) {
//     final Uri deepLink = data?.link;
//     if (deepLink != null) {
//       final queryParams = deepLink.queryParameters;
//       if (queryParams.length > 0) {
//         String doctor = queryParams['doctorDetail'];
//         Doctors doctors = Doctors.fromJson(json.decode(doctor));
//         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DoctorsDetailsScreen(data: doctors)));
//         // Fluttertoast.showToast(msg: doctor, toastLength: Toast.LENGTH_LONG);
//       } else {
//         Fluttertoast.showToast(msg: 'Dynamic link is null', toastLength: Toast.LENGTH_LONG);
//       }
//     } else {
//       Fluttertoast.showToast(msg: 'Dynamic link is null', toastLength: Toast.LENGTH_LONG);
//     }
//   }
//
//   void shareDynamicLink(String data) async {
//     var parameters = DynamicLinkParameters(
//       uriPrefix: 'https://healthconcernnepal.page.link',
//       link: Uri.parse(
//           'https://healthconcernnepal/doctor-profile?doctorDetail=$data'),
//       androidParameters: AndroidParameters(
//         packageName: "np.com.healthconcern.healthconcernnepal",
//       ),
//       // iosParameters: IosParameters(
//       //   bundleId: "com.exmple.test",
//       //   appStoreId: '1498909115',
//       // ),
//     );
//     var dynamicUrl = await parameters.buildUrl();
//     var shortLink = await parameters.buildShortLink();
//     var shortUrl = shortLink.shortUrl;
//     print(shortLink.shortUrl);
//     Share.share(shortUrl.toString());
//   }
// }
