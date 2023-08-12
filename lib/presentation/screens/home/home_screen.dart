import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tutorial_one_app/config/helper/functions_string/functions_string_title.dart';
import 'package:tutorial_one_app/domain/entities/tutorial.dart';
import 'package:tutorial_one_app/presentation/providers/tutorial_provider.dart';
import 'package:tutorial_one_app/presentation/shared/widgets/text_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final pageProvider = context.watch<TutorialProvider>();
    final size = MediaQuery.of(context).size;
    final controller = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _PageContainerImage(
            size: size,
            pageTutorial: pageProvider.pageTutorial,
            controller: controller,
          ),
          Positioned(
            bottom: size.height * .1,
            left: size.width * .03,
            right: size.width * .03,
            child: _ButtonBottom(
                controller: controller,
                finalPage: pageProvider.pageTutorial.length - 1),
          ),
          Positioned(
            left: size.width * .03,
            bottom: 10,
            child: SmoothPageIndicator(
              controller: controller,
              count: pageProvider.pageTutorial.length,
              effect: WormEffect(
                  dotWidth: size.width * .3,
                  dotHeight: 7,
                  dotColor: Colors.lightBlue.shade100,
                  activeDotColor: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}

class _PageContainerImage extends StatelessWidget {
  const _PageContainerImage(
      {required this.size,
      required this.pageTutorial,
      required this.controller});

  final Size size;
  final List<Tutorial> pageTutorial;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * .03,
          right: size.width * .03,
          bottom: size.height * .055),
      child: PageView.builder(
        controller: controller,
        itemCount: pageTutorial.length,
        itemBuilder: (context, index) {
          final page = pageTutorial[index];
          final firstTitle = FunctionStringTitle.firstTextTitle(page.title);
          return Stack(
            children: [
              Center(
                child: Image.asset(
                  page.imgUrl,
                  height: size.height * .5,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                    child: SizedBox(
                  width: size.width * .7,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextTutorial(
                            text: firstTitle,
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                          TextTutorial(
                            text: page.title.substring(
                              FunctionStringTitle.subStringTitle(firstTitle),
                            ),
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      TextTutorial(
                        text: page.description,
                        fontSize: 20,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                )),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ButtonBottom extends StatefulWidget {
  const _ButtonBottom({required this.controller, required this.finalPage});
  final PageController controller;
  final int finalPage;

  @override
  State<_ButtonBottom> createState() => _ButtonBottomState();
}

class _ButtonBottomState extends State<_ButtonBottom> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.blue,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: () {
          widget.controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
          if (widget.controller.page == widget.finalPage) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: StreamBuilder(
                    stream: Stream.periodic(const Duration(milliseconds: 300),
                            (value) => (value * 2) / 100)
                        .takeWhile((value) => value < 100),
                    builder: (context, snapshot) {
                      final double value = snapshot.data ?? 0;
                      return CircularProgressIndicator(
                        value: value,
                      );
                    }),
              ),
            );
          }
        },
        child: SizedBox(
          width: size.width,
          height: size.height * .08,
          child: const Center(
              child: TextTutorial(
            text: 'Next',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          )),
        ),
      ),
    );
  }
}
