import 'package:chrome_extension/alarms.dart';
import 'package:chrome_extension/bookmarks.dart';
import 'package:chrome_extension/chrome.dart';
import 'package:chrome_extension/power.dart';
import 'package:flutter/material.dart';

import 'qr_view.dart';

List<BookmarkTreeNode> list = [];

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Use the chrome.power API
  // chrome.power.requestKeepAwake(Level.display);

  // Use the chrome.storage API
  // await chrome.storage.local.set({'mykey': 'value'});
  // var values = await chrome.storage.local.get(null /* all */);
  // print(values['mykey']);

  // Use the chrome.alarms API
//  await chrome.alarms.create('MyAlarm', AlarmCreateInfo(delayInMinutes: 2));

  // await chrome.bookmarks.getRecent(30).then((value) => list.addAll(value));
  await chrome.bookmarks.getTree().then((value) => list.addAll(value));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chrome Extension',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookMarkView(),
    );
  }
}


// 从 bookmark 里面读取数据, 然后渲染出列表 取头三个
class BookMarkView extends StatelessWidget {
  BookMarkView(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list.length.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.map((e) => ListTile(title: Text("${chrome.bookmarks.get(e.id)}"))).toList(),
        ),
      ),
    );
  }
}