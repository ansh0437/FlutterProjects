import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/numbers.dart';
import 'dots_indicator.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;

  final Function onPageChange;

  const ImageSlider({
    Key key,
    @required this.images,
    this.onPageChange,
  }) : super(key: key);

  @override
  ImageSliderState createState() {
    return new ImageSliderState();
  }
}

class ImageSliderState extends State<ImageSlider> {
  int page = 0;

  final _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: _buildPagerViewSlider(),
          ),
          Padding(
            padding: const EdgeInsets.all(Doubles.sixteen),
            child: _buildDotsIndicatorOverlay(),
          ),
        ],
      ),
    );
  }

  Widget _buildPagerViewSlider() {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: _controller,
      itemCount: widget.images.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(widget.images[index]);
      },
      onPageChanged: (int p) {
        setState(() {
          page = p;
        });
        widget.onPageChange(p);
      },
    );
  }

  Widget _buildDotsIndicatorOverlay() {
    return DotsIndicator(
      controller: _controller,
      color: AppColors.red,
      itemCount: widget.images.length,
    );
  }
}
