import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind/feature/auth/splash_screen.dart';
import 'package:healthy_mind/feature/logic/cubits/delete_memories_cubit/delete_memories_cubit.dart';
import 'package:healthy_mind/feature/logic/cubits/get_memories_cubit/get_memories_cubit.dart';
import 'package:healthy_mind/feature/logic/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:healthy_mind/feature/logic/models/memories_hive_model.dart';
import 'package:healthy_mind/feature/logic/models/note_hive_model.dart';
import 'package:healthy_mind/feature/logic/repositories/memories_repo.dart';
import 'package:healthy_mind/feature/logic/repositories/note_repo.dart';
import 'package:hive_flutter/hive_flutter.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteHiveModelAdapter(),);
  Hive.registerAdapter(MemoriesHiveModelAdapter());

  runApp(const MyApp());

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
