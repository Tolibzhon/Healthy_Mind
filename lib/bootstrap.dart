import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:healthy_mind/web_page.dart';
import 'config/root_data_source.dart';
import 'config/root_model.dart';
import 'main.dart';

Future<void> startApp() async {
  final cachedRootModel = await RootDataSource().getRoot();
  if (cachedRootModel == null) {
    final rootSnapshot = await FirebaseDatabase.instance.ref('json_root').get();
    if (rootSnapshot.value != null) {
      final root =
          RootModel.fromJson(rootSnapshot.value as Map<dynamic, dynamic>);
      await RootDataSource().saveRoot(root.toJson());
      if (root.meditationOn) {
        runApp(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: WebViewPage(
              url: '${root.healthy1}${root.mind2}',
            ),
          ),
        );
      } else {
        runApp(MyApp());
      }
    } else {
      runApp(MyApp());
    }
  } else {
    if (cachedRootModel.meditationOn) {
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WebViewPage(
            url: '${cachedRootModel.notes3}${cachedRootModel.relaxation4}',
          ),
        ),
      );
    } else {
      runApp(MyApp());
    }
  }
}
