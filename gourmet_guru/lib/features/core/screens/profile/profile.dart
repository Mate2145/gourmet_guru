import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:gourmet_guru/constants/colors.dart';
import 'package:gourmet_guru/constants/image_strings.dart';
import 'package:gourmet_guru/constants/sizes.dart';
import 'package:gourmet_guru/constants/texts.dart';
import 'package:gourmet_guru/features/core/screens/profile/edit_profile.dart';
import 'package:gourmet_guru/features/core/screens/profile/fav_recipes.dart';
import 'package:gourmet_guru/features/core/screens/profile/my_recipes.dart';
import 'package:gourmet_guru/firebase/auth/auth.dart';
import 'package:gourmet_guru/utils/theme/theme.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../navbar/navigationbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(ggAppTitle, style: Theme.of(context).textTheme.headline5),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(ggDefaultSize),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(ggAvatar)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: ggPrimaryColor,
                        ),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Admin", style: Theme.of(context).textTheme.headline4),
                Text("admin@gmail.com",
                    style: Theme.of(context).textTheme.bodyText2),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(EditProfile());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ggPrimaryColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: ggDark),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),

                //MENU
                ProfileTile(
                  title: "Settings",
                  icon: LineAwesomeIcons.cog,
                  onPress: () {},
                ),
                ProfileTile(
                  title: "Favourite Recipes",
                  icon: LineAwesomeIcons.pizza_slice,
                  onPress: () {
                    Get.to(() => FavRecipes());
                  },
                ),
                ProfileTile(
                  title: "My recipes",
                  icon: LineAwesomeIcons.user,
                  onPress: () {
                    Get.to(() => MyRecipes());
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                ProfileTile(
                    title: "About",
                    icon: LineAwesomeIcons.info,
                    onPress: () {}),
                ProfileTile(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  onPress: () {
                    AuthenticationFb.instance.logout();
                  },
                  endIcon: false,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ));
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress,
      this.endIcon = true,
      this.textColor})
      : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ggDark.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: ggPrimaryColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor),
      ),
      trailing: this.endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
