import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/home/presentation/home_screen.dart';
import 'package:healthy_mind/feature/memories/presentation/memories_screen.dart';
import 'package:healthy_mind/feature/notes/presentation/notes_screen.dart';
import 'package:healthy_mind/feature/settings/presentation/settings_screen.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_images.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: pages[index],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white.withOpacity(0.5),
          currentIndex: index,
          onTap: (indexFrom) async {
            setState(() {
              index = indexFrom;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarHomeActive,
                height: 30,
              ),
              icon: Image.asset(
                AppImages.navbarHome,
                height: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarNotesActive,
                height: 30,
              ),
              icon: Image.asset(
                AppImages.navbarNotes,
                height: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarMemorActive,
                height: 30,
              ),
              icon: Image.asset(
                AppImages.navbarMemor,
                height: 30,
              ),
              label: ' ',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarSettingsActive,
                height: 30,
              ),
              icon: Image.asset(
                AppImages.navbarSettings,
                height: 30,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const HomeScreen(),
  const NotesScreen(),
  const MemoriesScreen(),
  const SettingsScreen(),
];
