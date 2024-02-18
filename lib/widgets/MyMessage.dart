import 'package:flutter/material.dart';
import 'package:gangnam_spot_chat/core/app_export.dart';
import 'package:gangnam_spot_chat/widgets/custom_elevated_button.dart';

class MyMessage extends StatelessWidget {
  final String message;
  const MyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomElevatedButton(
            // width: 193.h,
            text: message,
            buttonStyle: CustomButtonStyles.none,
            decoration:
                CustomButtonStyles.gradientPinkAToPinkADecoration,
            alignment: Alignment.centerRight),
        SizedBox(height: 8.v),
      ],
    );
  }
}
