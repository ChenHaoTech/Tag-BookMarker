import 'package:chrome_extension/bookmarks.dart';
import 'package:flutter/material.dart';

import 'qr_view.dart';

List<BookmarkTreeNode> list = [];
void main() {
  chrome.bookmarks.getTree().then((value) => list.addAll(value));
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
          children: list.map((e) => ListTile(title: Text(e.title))).toList(),
        ),
      ),
    );
  }
}