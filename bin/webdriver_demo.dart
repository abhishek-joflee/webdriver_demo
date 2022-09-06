import 'dart:developer';

import 'package:puppeteer/puppeteer.dart';

import 'dart:io';

void main(List<String> arguments) async {
  log("Start the browser and go to a web page");
  var browser = await puppeteer.launch(headless: false);
  try {
    var page = await browser.newPage();

    log("launching dart.dev site");
    await page.goto('https://dart.dev', wait: Until.load);

    log("Take a screenshot of the page");
    var screenshot = await page.screenshot();

    log("Save it to a file");
    await File('dartDev.png').writeAsBytes(screenshot);
  } catch (e, st) {
    log("Error", error: e, stackTrace: st);
  } finally {
    log("Goodbye");
    await browser.close();
  }
}
