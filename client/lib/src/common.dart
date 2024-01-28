import 'dart:io';

const int port = 8000;
String httpServerURL = "http://$serverURL:$port";
String wsServerURL = "ws://$serverURL:$port";
String serverURL = Platform.isAndroid ? "10.0.2.2" : "localhost";
