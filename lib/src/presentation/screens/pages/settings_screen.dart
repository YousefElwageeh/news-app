// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/assets_manger.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            leading: SvgPicture.asset(ImageAssets.contactUsIc),
            title: Text(AppStrings.contactUs,
                style: Theme.of(context).textTheme.bodyLarge),
            trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            onTap: () {
              _contactUs();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
            title: Text(AppStrings.inviteYourFriends,
                style: Theme.of(context).textTheme.bodyLarge),
            trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            onTap: () {
              _inviteFriends();
            },
          ),
        ],
      ),
    );
  }

  _contactUs() async {
    const _url = 'https://www.facebook.com/profile.php?id=100009439773463';
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw "Could not launch $_url";
    }
  }

  Future<void> _inviteFriends() async {
    // its a task for you to share app name to friends
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }
}
