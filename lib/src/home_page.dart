import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:colornote/src/color_note_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  List<IconData> iconList = [
    Icons.event_note_rounded,
    Icons.calendar_today_sharp,
    Icons.search,
    Icons.menu,
  ];

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorNoteTheme.backgroundColor,
        appBar: AppBar(
          title: Image.asset(
            "assets/images/title.png",
            width: size.width * 0.35,
          ),
          shadowColor: Colors.grey,
          elevation: 1,
          backgroundColor: ColorNoteTheme.topBarColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/pallete.png",
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        body: Center(
          child: Text("${activeIndex + 1}"),
        ),
        floatingActionButton: GestureDetector(
          onTap: () => addItemDialog(),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: ColorNoteTheme.activeColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          elevation: 6,
          borderColor: Colors.grey,
          backgroundColor: ColorNoteTheme.bottomBarColor,
          activeColor: ColorNoteTheme.activeColor,
          activeIndex: activeIndex,
          icons: iconList,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) => setState(() => activeIndex = index),
          //other params
        ),
      ),
    );
  }
  
  void addItemDialog() async{
    return await showDialog(context: context, builder: (_)=> SimpleDialog(
      title: const Text("Add"),
      shape: Border.all(),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 24),
      children: [
        GestureDetector(
          onTap: () {
            
          },
          child: Row(
            children: [
              Image.asset("assets/images/p.png"),
              const Text("Text"),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
            
          },
          child: Row(
            children: [
              Image.asset("assets/images/tS.png"),
              
              const Text("Checklist"),
            ],
          ),
        ),
      ],
    ));
  }
}
