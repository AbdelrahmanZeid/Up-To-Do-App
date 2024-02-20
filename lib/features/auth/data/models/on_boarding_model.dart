import 'package:notes_app/core/utiles/app_assets.dart';
import 'package:notes_app/core/utiles/app_strings.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  
}


List<OnBoardingModel> onBoardingItemList = [
    OnBoardingModel(
      title: AppString.onBoardingTitleOne,
      subTitle: AppString.onBoardingSubTitleOne,
      image: AppAssets.onOne,
    ),
    OnBoardingModel(
      title: AppString.onBoardingTitleTwo,
      subTitle: AppString.onBoardingSubTitleTwo,
      image: AppAssets.onTwo,
    ),
    OnBoardingModel(
      title: AppString.onBoardingTitleThree,
      subTitle: AppString.onBoardingSubTitleThree,
      image: AppAssets.onThree,
    ),
  ];
