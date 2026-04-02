import 'package:to_do_app/core/utils/constants/app_icons.dart';
import 'package:to_do_app/core/utils/constants/app_strings.dart';
import 'package:to_do_app/features/onboarding/model/onboarding_model.dart';

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: AppStrings.kOnboardingTitle1,
    desc: AppStrings.kOnboardingDesc1,
    imagePath: AppIcons.kOnboardingIcon1,
  ),
  OnboardingModel(
    title: AppStrings.kOnboardingTitle2,
    desc: AppStrings.kOnboardingDesc2,
    imagePath: AppIcons.kOnboardingIcon2,
  ),
  OnboardingModel(
    title: AppStrings.kOnboardingTitle3,
    desc: AppStrings.kOnboardingDesc3,
    imagePath: AppIcons.kOnboardingIcon3,
  ),
  OnboardingModel(
    title: AppStrings.kOnboardingTitle4,
    desc: AppStrings.kOnboardingDesc4,
    imagePath: AppIcons.kOnboardingIcon4,
  ),
];
