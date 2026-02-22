import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  final _nameCont = TextEditingController();
  final _emailCont = TextEditingController();
  final _subjectCont = TextEditingController();
  final _messageCont = TextEditingController();

  @override
  void dispose() {
    _nameCont.dispose();
    _emailCont.dispose();
    _subjectCont.dispose();
    _messageCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: primaryColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomField(
                  hint: AppStrings.nameHint,
                  controller: _nameCont,
                  label: AppStrings.nameLabel,
                ),
              ),
              kGap20,
              Expanded(
                child: CustomField(
                  hint: AppStrings.emailHint,
                  controller: _emailCont,
                  label: AppStrings.emailLabel,
                ),
              ),
            ],
          ),
          kGap20,
          CustomField(
            hint: AppStrings.subjectHint,
            controller: _subjectCont,
            label: AppStrings.subjectLabel,
          ),
          kGap20,
          CustomField.multiline(
            maxLines: 7,
            hint: AppStrings.messageHint,
            controller: _messageCont,
            label: AppStrings.messageLabel,
          ),
          kGap40,
          PrimaryButton(text: AppStrings.submit, onTap: () {}).expand(),
        ],
      ).addPadding(padding: .all(30)),
    );
  }
}
