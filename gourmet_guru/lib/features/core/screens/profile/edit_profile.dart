import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:gourmet_guru/constants/colors.dart';
import 'package:gourmet_guru/constants/image_strings.dart';
import 'package:gourmet_guru/constants/sizes.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/texts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile",
              style: Theme.of(context).textTheme.headline6),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
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
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Full Name"),
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                      ),
                      SizedBox(
                        height: ggFormHeight - 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text(EmailLabelText),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(
                        height: ggFormHeight - 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text(PasswordLabelText),
                          prefixIcon: Icon(Icons.fingerprint),
                        ),
                      ),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
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
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(TextSpan(
                        text: "Joined  ",
                        style: TextStyle(fontSize: 12),
                        children: [
                          TextSpan(
                              text: "1 April 2023",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                        ])),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent.withOpacity(0.2),
                            elevation: 0,
                            foregroundColor: Colors.red,
                            shape: const StadiumBorder(),
                            side: BorderSide.none),
                        child: const Text("Delete"))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
