import 'package:flutter/material.dart';
import 'package:gangnam_spot_chat/core/app_export.dart';
import 'package:gangnam_spot_chat/models/Message.dart';
import 'package:gangnam_spot_chat/widgets/MessageDisplay.dart';
import 'package:gangnam_spot_chat/widgets/app_bar/appbar_leading_image.dart';
import 'package:gangnam_spot_chat/widgets/app_bar/appbar_title.dart';
import 'package:gangnam_spot_chat/widgets/app_bar/appbar_trailing_image.dart';
import 'package:gangnam_spot_chat/widgets/app_bar/custom_app_bar.dart';
import 'package:gangnam_spot_chat/widgets/custom_text_form_field.dart';
import 'package:gangnam_spot_chat/services/HttpHelper.dart';

// ignore_for_file: must_be_immutable
class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<Message>? messages;

  getMessages() async {
    messages = await HttpHelper.getMessages();
    setState(() { });
    await Future.delayed(Duration(milliseconds: 100));
    scrollController.animateTo(
      // 0.0,
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut,
    );
  }

  addMessage() async {
    final message = messageController.text;
    messages!.add(Message(message: message, user_id: '', user_nickname: '', profile_url: ''));
    messageController.clear();
    setState(() { });
    await Future.delayed(Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (messages == null) {
      getMessages();
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(16.h),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: messages!.map((message) => MessageDisplay(message: message)).toList(),
                      ),
                    ),
                    _buildSendAMessagePrompt(context)
                  ],
                ))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 27.h,
        leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgBtconBack,
          margin: EdgeInsets.only(left: 20.h, top: 18.v, bottom: 18.v),
          onTap: () { }
        ),
        centerTitle: true,
        title: AppbarTitle(text: "강남스팟"),
        actions: [
          AppbarTrailingImage(
            imagePath: ImageConstant.imgFrame5344,
            margin: EdgeInsets.symmetric(horizontal: 19.h, vertical: 18.v),
          )
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildSendAMessagePrompt(BuildContext context) {
    return Container(
        decoration: AppDecoration.fillGray900,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 4.h, right: 16.h),
                  decoration: AppDecoration.fillGray900,
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgPlus,
                        color: Colors.white,
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 4.v)),
                    Expanded(
                        child: CustomTextFormField(
                            controller: messageController,
                            hintText: "안녕하세요",
                            hintStyle: TextStyle(color: Colors.grey),
                            textInputAction: TextInputAction.done,
                            suffix: GestureDetector(
                              onTap: () => messageController.text == '' ? null : addMessage(),
                              child: Container(
                                  padding: EdgeInsets.all(7.h),
                                  margin:
                                      EdgeInsets.fromLTRB(30.h, 12.v, 12.h, 12.v),
                                  decoration: BoxDecoration(
                                      color: appTheme.pinkA400,
                                      borderRadius: BorderRadius.circular(12.h)),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgArrowright,
                                      color: Colors.black,
                                      height: 10.adaptSize,
                                      width: 10.adaptSize)),
                            ),
                            suffixConstraints: BoxConstraints(maxHeight: 48.v)))
                  ])),
            ]));
  }
}
