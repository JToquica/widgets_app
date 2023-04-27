import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    "Busca la comida",
    "Laborum est anim consectetur sit.",
    "assets/images/1.png",
  ),
  SlideInfo(
    "Entrega rapida",
    "In ea fugiat dolor et eiusmod aliqua velit nisi aute quis.",
    "assets/images/2.png",
  ),
  SlideInfo(
    "Disfruta la comida",
    "Ex duis non nulla eiusmod incididunt nisi.",
    "assets/images/3.png",
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "app_tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  int currentPage = 0;
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('App Tutorial'),
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            onPageChanged: (value) {
              currentPage = value;
              setState(() {});
            },
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl),
                )
                .toList(),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: TextButton(
              onPressed: context.pop,
              child: const Text("Salir"),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: slides.map((slide) {
                final int index = slides.indexOf(slide);
                final double size = index == currentPage ? 18 : 12;
                final double radius = index == currentPage ? 9 : 6;
                final Color color =
                    index == currentPage ? colors.primary : Colors.grey;

                return GestureDetector(
                  onTap: () {
                    pageViewController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 40,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                      onPressed: context.pop,
                      child: const Text("Comenzar"),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle titleStyle = Theme.of(context).textTheme.titleLarge!;
    final TextStyle captionStyle = Theme.of(context).textTheme.bodySmall!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, height: size.height * 0.45),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
