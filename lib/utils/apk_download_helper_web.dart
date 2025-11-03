// Web implementation for APK download
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void downloadApk(String apkPath) {
  html.AnchorElement(href: apkPath)
    ..setAttribute('download', 'ZeroWave_App.apk')
    ..click();
}
