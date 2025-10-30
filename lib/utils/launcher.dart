import 'package:url_launcher/url_launcher.dart';

Future<void> openUri(Uri uri) async {
  if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
    // ignore: avoid_print
    print('Could not launch: $uri');
  }
}

Future<void> mailTo({
  required String email,
  String? subject,
  String? body,
}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      if (subject != null) 'subject': subject,
      if (body != null) 'body': body,
    },
  );
  await openUri(uri);
}

Future<void> callTo(String phone) async {
  final uri = Uri(scheme: 'tel', path: phone);
  await openUri(uri);
}
