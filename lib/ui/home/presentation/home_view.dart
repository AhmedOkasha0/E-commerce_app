import 'package:ecommerec_app/core/utils/app_color.dart';
import 'package:ecommerec_app/core/utils/constants.dart';
import 'package:ecommerec_app/core/utils/media_query.dart';
import 'package:ecommerec_app/ui/home/widget/list_view.dart';
import 'package:ecommerec_app/ui/home/widget/text_form.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
];
final _controller = PageController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(17),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImagePath.miniLogo),
          SizedBox(
            height: context.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: context.width * 0.78, child: CustomTextForm()),
              IconButton(onPressed: () {}, icon: (Image.asset(ImagePath.cart))),
            ],
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          Container(
            height: context.height * 0.35,
            width: context.width * 1,
            child: CustomListView(
              imageUrl: imgList,
              controller: _controller,
            ),
          ),
          Positioned(
            height: 1,
            top: 12,
            left: 12,
            right: 2,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: SlideEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  dotColor: AppColor.primaryColor,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1,
                  activeDotColor: AppColor.primaryColor),
            ),
          )
        ],
      )),
    );
  }
}
