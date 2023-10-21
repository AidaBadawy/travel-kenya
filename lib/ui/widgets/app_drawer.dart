import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:travel_kenya/ui/common/app_images.dart';
import 'package:travel_kenya/ui/common/box_text.dart';
import 'package:travel_kenya/ui/views/home/home_viewmodel.dart';

class AppDrawer extends StackedView<HomeViewModel> {
  const AppDrawer({super.key});

  // final _navigationService = locator<NavigationService>();

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    bool isDark = getThemeManager(context).isDarkMode;
    var theme = Theme.of(context);

    return Container(
      height: size.height,
      width: size.width,
      color: theme.colorScheme.background,
      child: AnimationLimiter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: MediaQuery.of(context).size.width / 2,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              TextButton(
                onPressed: () => viewModel.navigateToHomePage(context),
                child: ManropeText.semiBold(
                    "Home", 20, theme.colorScheme.onPrimaryContainer),
              ),
              TextButton(
                onPressed: () => viewModel.navigateToExplorePage(context),
                child: ManropeText.semiBold(
                    "Explore", 20, theme.colorScheme.onPrimaryContainer),
              ),
              TextButton(
                onPressed: () => viewModel.navigateToEventsPage(context),
                child: ManropeText.semiBold(
                    "Events", 20, theme.colorScheme.onPrimaryContainer),
              ),
              TextButton(
                onPressed: () => viewModel.navigateToTripsPage(context),
                child: ManropeText.semiBold(
                    "Trips", 20, theme.colorScheme.onPrimaryContainer),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color: theme.colorScheme.onPrimaryContainer)),
                    child: IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: SvgPicture.asset(icEngland),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     // setState(() {
                  //     viewModel.setIsRevealed();
                  //     // });
                  //   },
                  //   child: AnimatedContainer(
                  //     duration: const Duration(milliseconds: 500),
                  //     curve: Curves.easeInOut,
                  //     width: 50.0,
                  //     height: 50.0,
                  //     decoration: const BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.blue,
                  //     ),
                  //     child: Center(
                  //       child: viewModel.isRevealed
                  //           ? ClipPath(
                  //               clipper: CircleRevealClipper(),
                  //               child: Container(
                  //                 width: 200.0,
                  //                 height: 200.0,
                  //                 color: Colors.blue,
                  //                 alignment: Alignment.topCenter,
                  //                 padding: const EdgeInsets.only(top: 70.0),
                  //                 child: const Column(
                  //                   children: [
                  //                     Text(
                  //                       'Widget 1',
                  //                       style: TextStyle(color: Colors.red),
                  //                     ),
                  //                     Text(
                  //                       'Widget 2',
                  //                       style: TextStyle(color: Colors.blue),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             )
                  //           : null,
                  //     ),
                  //   ),
                  // ),
                  // PopupMenuButton<String>(
                  //   // position: PopupMenuPosition.over,
                  //   offset: const Offset(-30, -150),
                  //   // onSelected: (String result) {
                  //   //   // Handle the option selected from the popup menu.
                  //   //   print('Selected: $result');
                  //   // },
                  //   itemBuilder: (BuildContext context) =>
                  //       <PopupMenuEntry<String>>[
                  //     const PopupMenuItem<String>(
                  //       value: 'Option 1',
                  //       child: Text('Option 1'),
                  //     ),
                  //     const PopupMenuItem<String>(
                  //       value: 'Option 2',
                  //       child: Text('Option 2'),
                  //     ),
                  //     const PopupMenuItem<String>(
                  //       value: 'Option 3',
                  //       child: Text('Option 3'),
                  //     ),
                  //   ],
                  //   child: SvgPicture.asset(icEngland),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color: theme.colorScheme.onPrimaryContainer)),
                    child: IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: Icon(Icons.close,
                          size: 28,
                          color: theme.colorScheme.onPrimaryContainer),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color: theme.colorScheme.onPrimaryContainer)),
                    child: IconButton(
                      onPressed: () => viewModel.toggleDarkLightMode(context),
                      icon: Icon(
                          isDark
                              ? Icons.dark_mode_outlined
                              : Icons.light_mode_outlined,
                          size: 28,
                          color: theme.colorScheme.onPrimaryContainer),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class CircleRevealClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
