import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/numbers.dart';
import '../../../constants/pages.dart';
import '../../../constants/strings.dart';
import '../../../data/models/boarding_dto.dart';
import '../../widgets/curved_container.dart';
import '../../widgets/slider/dots_indicator.dart';
import '../base/base_stateful.dart';
import 'boarding_page.dart';

class Boarding extends BasePage {
  final PageController mPageController = PageController();

  final List<BoardingDTO> mBoardingList = BoardingDTO.list;

  @override
  _BoardingState createState() => _BoardingState();
}

class _BoardingState extends BaseState<Boarding> {
  int iPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPop,
      child: buildScaffold(
        darkStatusBar: true,
        body: Stack(
          children: [
            CurvedContainer(width: getWidth(), height: getHeight()),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: widget.mPageController,
                        itemCount: widget.mBoardingList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BoardingPage(widget.mBoardingList[index]);
                        },
                        onPageChanged: (int index) {
                          setState(() {
                            iPageIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(Doubles.sixteen),
                    child: iPageIndex == widget.mBoardingList.length - 1
                        ? _buildGetStarted()
                        : _buildDotIndicator(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetStarted() {
    return InkWell(
      onTap: () {
        /// TODO
        // DatingPreference.boardingShowed.save(true);
        pushClearPages(Pages.login);
      },
      child: Padding(
        padding: const EdgeInsets.all(Doubles.four),
        child: Text(Strings.getStarted,
            style: TextStyle(
              color: AppColors.red,
              fontSize: Doubles.twenty,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Padding(
      padding: const EdgeInsets.all(Doubles.ten),
      child: DotsIndicator(
        controller: widget.mPageController,
        color: AppColors.red,
        itemCount: widget.mBoardingList.length,
      ),
    );
  }
}
