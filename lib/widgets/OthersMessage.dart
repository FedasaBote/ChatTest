import 'package:flutter/material.dart';
import 'package:gangnam_spot_chat/core/app_export.dart';
import 'package:gangnam_spot_chat/models/Message.dart';

class OthersMessage extends StatelessWidget {
  final Message message;
  const OthersMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message.profile_url == ''
                ? CircleAvatar(
                  child: Icon(Icons.person),
                )
                : CustomImageView(
                    imagePath: message.profile_url,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    margin: EdgeInsets.only(bottom: 32.v)),
                Container(
                    margin: EdgeInsets.only(left: 10.h),
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.h, vertical: 9.v),
                    decoration: AppDecoration.fillGray
                        .copyWith(
                            borderRadius: BorderRadiusStyle
                                .customBorderLR18),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(message.user_nickname,
                              style:
                                  theme.textTheme.bodyMedium),
                          SizedBox(height: 7.v),
                          Text(message.message,
                              style:
                                  theme.textTheme.bodyLarge)
                        ]))
              ]),
          Padding(
              padding: EdgeInsets.only(left: 8.h, top: 48.v),
              child:
                  Text("1분 전", style: theme.textTheme.bodySmall))
        ]),
        SizedBox(height: 8.v),
      ],
    );
  }
}
