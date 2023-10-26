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
                // const Positioned(
                //   top: 50,
                //   left: 25,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [],
                //   ),
                // ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                              style: manropeExtraBold.copyWith(
                                  color: kcWhite,
                                  fontSize: 40,
                                  letterSpacing: .8),
                              child: AnimatedTextKit(
                                totalRepeatCount: 1,
                                onFinished: () {
                                  print("done");
                                },
                                onNextBeforePause: (p0, p1) {
                                  print("pause 1");

                                  viewModel.setDisplayTwo(true);
                                },
                                onNext: (p0, p1) {
                                  print("pause 2");
                                },
                                animatedTexts: [
                                  TypewriterAnimatedText('Explore',
                                      speed: const Duration(milliseconds: 150),
                                      cursor: ""),
                                ],
                              ),
                            ),
                            verticalSpaceTiny,
                            Visibility(
                              visible: viewModel.displayTwo,
                              child: DefaultTextStyle(
                                style: dancingScript.copyWith(
                                    color: kcWhite,
                                    fontSize: 50,
                                    letterSpacing: .8),
                                child: AnimatedTextKit(
                                  // pause: const Duration(milliseconds: 0),
                                  totalRepeatCount: 1,
                                  onFinished: () {
                                    viewModel.setDisplayThree(true);
                                  },
                                  animatedTexts: [
                                    TypewriterAnimatedText('Kenya',
                                        speed:
                                            const Duration(milliseconds: 150),
                                        cursor: ''),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpaceTiny,
                            Visibility(
                              visible: viewModel.displayThree,
                              child: DefaultTextStyle(
                                style: manropeExtraBold.copyWith(
                                    color: kcWhite,
                                    fontSize: 40,
                                    letterSpacing: .8),
                                child: AnimatedTextKit(
                                  // pause: const Duration(milliseconds: 0),
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'with us.',
                                      speed: const Duration(milliseconds: 150),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpaceSmall,
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
                          ],
                        ),
                        SizedBox(
                          width: 60,
                          child: RoundButtonWidget(
                            btnColor: theme.colorScheme.secondary,
                            isBusy: false,
                            icon: icArrowRight,
                            iconColor: kcWhite,
                            onPressed: () => viewModel.navigateToHome(),
                            height: 60,
                            radius: 50,
                          ),
                        )
                      ],
                    ),
                  ),
                )
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
