import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t7mara/core/utils/colors.dart';
import 'package:t7mara/feature/favorite/presentation/page/favorite.dart';
import 'package:t7mara/feature/home/presentation/page/home.dart';
import 'package:t7mara/feature/notification/presentation/page/notification.dart';
import 'package:t7mara/feature/profile/presentation/page/profile.dart';
import 'package:t7mara/feature/purchases/presentation/page/purchases.dart';

class NavigationBarScreen extends StatefulWidget {
  final int index;
  const NavigationBarScreen({super.key, this.index = 0});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int selectItem = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const PurchasesScreen(),
    const NotificationScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index != 0) {
      setState(() {
        selectItem = widget.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectItem],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ColorApp.white,
        selectedFontSize: 18,
        backgroundColor: ColorApp.primary,
        currentIndex: selectItem,
        elevation: 0,
        onTap: (value) {
          setState(() {
            selectItem = value;
          });
        },
        selectedItemColor: ColorApp.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Home.svg'),
            activeIcon: SvgPicture.asset('assets/icons/Home.svg'),
            label: 'الرئيسيه',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Note.svg'),
            activeIcon: SvgPicture.asset('assets/icons/Note.svg'),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/Notification.svg'),
            activeIcon: SvgPicture.asset('assets/icons/Notification.svg'),
            label: 'الاشعارات',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/heart.svg'),
            activeIcon: SvgPicture.asset('assets/icons/heart.svg'),
            label: 'المفضله',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/User.svg'),
            activeIcon: SvgPicture.asset('assets/icons/User.svg'),
            label: 'حسابي',
          )
        ],
      ),
    );
  }
}
