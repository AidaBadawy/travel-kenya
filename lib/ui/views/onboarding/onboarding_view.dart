import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_kenya/ui/common/app_colors.dart';
import 'package:travel_kenya/ui/common/app_images.dart';
import 'package:travel_kenya/ui/common/styles.dart';
import 'package:travel_kenya/ui/common/ui_helpers.dart';
import 'package:travel_kenya/ui/widgets/button_widget.dart';
import 'package:travel_kenya/ui/widgets/onboarding_widget.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  onPageChanged: (value) {
                    viewModel.setCurrentPageIndex(value);
                  },
                  children: List.generate(
                    viewModel.onBoardingList.length,
                    (index) => OnboardingWidget(
                      image: viewModel.onBoardingList[index],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: manropeExtraBold.copyWith(
                            color: kcWhite, fontSize: 40, letterSpacing: .8),
                        child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          onFinished: () {
                            viewModel.setDisplayTwo(true);
                          },
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Explore',
                              speed: const Duration(milliseconds: 300),
                            ),
                          ],
                        ),
                      ),
                      verticalSpaceTiny,
                      Visibility(
                        visible: viewModel.displayTwo,
                        child: DefaultTextStyle(
                          style: dancingScript.copyWith(
                              color: kcWhite, fontSize: 50, letterSpacing: .8),
                          child: AnimatedTextKit(
                            pause: const Duration(milliseconds: 400),
                            totalRepeatCount: 1,
                            onFinished: () {
                              viewModel.setDisplayThree(true);
                            },
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Kenya',
                                speed: const Duration(milliseconds: 300),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpaceTiny,
                      Visibility(
                        visible: viewModel.displayThree,
                        child: DefaultTextStyle(
                          style: manropeExtraBold.copyWith(
                              color: kcWhite, fontSize: 40, letterSpacing: .8),
                          child: AnimatedTextKit(
                            pause: const Duration(milliseconds: 400),
                            totalRepeatCount: 1,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'with us.',
                                speed: const Duration(milliseconds: 300),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 10,
                  child: Column(
                    children: [
                      Row(
                        children: List.generate(
                          viewModel.onBoardingList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: index == viewModel.currentPageIndex
                                    ? kcWhite
                                    : kcWhite.withOpacity(.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 5,
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      SizedBox(
                        width: size.width - 50,
                        child: ButtonWidget(
                          onPressed: () => viewModel.navigateToHome(),
                          isBusy: false,
                          text: "Let's Get Started",
                          btnColor: theme.colorScheme.secondary,
                          textColor: kcWhite,
                          radius: 8,
                          height: 60,
                          fontSize: 16,
                          hasIcon: true,
                          icon: icArrowRight,
                          iconColor: kcWhite,
                          iconSpacing: 8,
                          // iconHeight: 24,
                        ),
                      ),
                    ],
                  ),
                )

                // Container(
                //   height: 100,
                //   width: double.infinity,
                //   decoration: const BoxDecoration(
                //     color: kcWhite,
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(15),
                //       topRight: Radius.circular(15),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
