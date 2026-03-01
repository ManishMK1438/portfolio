import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/home_exports.dart';

class BioErrorWidget extends StatelessWidget {
  final String message;
  final bool isDesktop;

  const BioErrorWidget({
    super.key,
    required this.message,
    this.isDesktop = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kWebPadding,
        vertical: 80,
      ),
      color: Colors.white,
      width: double.infinity,
      child: isDesktop
          ? Row(
              children: [
                Expanded(child: _errorIcon()),
                kGap50,
                Expanded(child: _errorContent(context)),
              ],
            )
          : Column(children: [_errorIcon(), kGap30, _errorContent(context)]),
    );
  }

  Widget _errorIcon() {
    return const Center(
      child: Icon(Icons.cloud_off_rounded, size: 100, color: Colors.grey),
    );
  }

  Widget _errorContent(BuildContext context) {
    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          "Oops! Something went wrong",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        kGap10,
        Text(
          message,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {
            // Trigger the specific fetch event again
            context.read<ProfileBloc>().add(const GetAboutMeEvent());
          },
          icon: const Icon(Icons.refresh_rounded),
          label: const Text("Retry Loading Bio"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }
}
