import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/home_exports.dart';

class BioSection extends StatelessWidget {
  const BioSection({super.key, this.isDesktop = true});

  final bool isDesktop;

  Widget _image({required AboutMeEntity data}) {
    final placeHolder = data.image.isNullOrEmpty;

    return Align(
      alignment: isDesktop
          ? .centerLeft
          : .center, // Keeps the image on the left side
      child:
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: placeHolder
                ? Image.asset(
                    AppImages.resume1,
                    height: 500,
                    cacheWidth: 800,
                    // 2. Change to 'cover' to ensure the image perfectly fills the shadow box bounds
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    data.image,
                    errorBuilder: (context, error, stack) => Image.asset(
                      AppImages.resume1,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                    height: 500,
                    cacheWidth: 800,
                    // 2. Change to 'cover' to ensure the image perfectly fills the shadow box bounds
                    fit: BoxFit.cover,
                  ),
          ).addShadow(
            color: primaryColor.withValues(alpha: 0.2),
            blurRadius: 400,
            spreadRadius: 50,
            offset: const Offset(0, 0),
          ),
    );
  }

  Widget _text({required AboutMeEntity data, required BuildContext context}) {
    return Column(
      crossAxisAlignment: isDesktop ? .start : .center,
      children: [
        Text(
          AppStrings.bio,
          textAlign: isDesktop ? .start : .center,
          style: context.textTheme.headlineLarge?.copyWith(fontSize: 36),
        ),
        kGap25,
        Text(
          data.bio.orFallback(AppStrings.bioSummary),
          style: context.textTheme.bodyMedium?.copyWith(
            color: descriptionTextColor,
          ),
        ),
        kGap10,
        Align(
          alignment: .centerLeft,
          child: Container(
            padding: .symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: .circular(kBorderRadius16),
              border: Border.all(color: primaryColor.withValues(alpha: 0.2)),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                  padding: .all(10),
                  decoration: BoxDecoration(
                    borderRadius: .all(.circular(8)),
                    color: primaryColor.withValues(alpha: 0.1),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.graduationCap,
                    size: 18,
                    color: primaryColor,
                  ),
                ),
                kGap20,
                Text(
                  data.degree.orFallback(AppStrings.bca),
                  style: context.textTheme.titleSmall,
                ),
                kGap10,
                Text(
                  data.university.orFallback(AppStrings.university),
                  style: context.textTheme.bodySmall,
                ),
                kGap10,
                Text(
                  data.duration.orFallback(AppStrings.duration),
                  style: context.textTheme.bodySmall,
                ),
                kGap10,
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      // Only rebuild if aboutMe status or data changes
      buildWhen: (prev, curr) =>
          prev.aboutMeStatus != curr.aboutMeStatus ||
          prev.aboutMe != curr.aboutMe,
      builder: (context, state) {
        if (state.aboutMeStatus == ProfileStatus.loading) {
          return BioShimmer(
            isDesktop: isDesktop,
          ); // Standardize your loading UI
        }

        if (state.aboutMeStatus == ProfileStatus.failure) {
          return BioErrorWidget(message: state.aboutMeError);
        }

        final data = state.aboutMe;

        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: kWebPadding,
            vertical: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              isDesktop
                  ? Row(
                      children: [
                        Expanded(
                          child: _image(data: data),
                        ), // Pass dynamic data here
                        kGap50,
                        Expanded(
                          child: _text(context: context, data: data),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _text(context: context, data: data),
                        kGap50,
                        _image(data: data),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
