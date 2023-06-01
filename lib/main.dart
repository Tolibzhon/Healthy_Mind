import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind/bootstrap.dart';
import 'package:healthy_mind/config/app_url.dart';
import 'package:healthy_mind/feature/auth/splash_screen.dart';
import 'package:healthy_mind/feature/logic/cubits/get_memories_cubit/get_memories_cubit.dart';
import 'package:healthy_mind/feature/logic/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:healthy_mind/feature/logic/models/memories_hive_model.dart';
import 'package:healthy_mind/feature/logic/models/note_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/memories_repo.dart';
import 'package:healthy_mind/feature/logic/repositories/note_repo.dart';
import 'package:healthy_mind/firebase_options.dart';
import 'package:healthy_mind/services/notification_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:in_app_review/in_app_review.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: AppUrl.apphudApiKey); // 3. Apphud
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationServiceFb().activate();
  await Hive.initFlutter();
  Hive.registerAdapter(
    NoteHiveModelAdapter(),
  );
  Hive.registerAdapter(MemoriesHiveModelAdapter());

  startApp();

  NotificationServiceFb notificationService = NotificationServiceFb();
  notificationService.activate(); // 2. Уведомления

  await Future.delayed(const Duration(seconds: 14));
  try {
    final InAppReview inAppReview =
        InAppReview.instance; // 1. Оценка приложения

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      inAppReview.openStoreListing(
        appStoreId: '6449524442',
      );
    }
  } catch (e) {
    throw Exception(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNoteCubit(NoteRepoImpl()),
        ),
        BlocProvider(
          create: (context) => GetMemoriesCubit(MemoriesRepoImpl()),
        ),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldKey,
        debugShowCheckedModeBanner: false,
        title: 'Helthy Mind',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
