import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:ki_mit_talal/constants/colors.dart';
import 'package:ki_mit_talal/constants/sizes.dart';
import 'package:ki_mit_talal/constants/texts.dart';
import 'package:ki_mit_talal/utils/theme/theme.dart';

import '../navbar/navigationbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu,color: Colors.black),
        title: Text(ggAppTitle,style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20,top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child: IconButton(onPressed: () {},icon: Icon(Icons.account_circle)),
          )
        ],
      ),
      body: Center(
        child: Text("Profile"),
      ));
  }
}