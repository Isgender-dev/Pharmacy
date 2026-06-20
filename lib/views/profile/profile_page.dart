import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'package:pharmacy/models/user.dart';
import 'package:pharmacy/services/auth_service.dart';
import 'package:pharmacy/services/user_service.dart';
import 'package:pharmacy/views/profile/registration.dart';
import 'package:pharmacy/views/profile/widgets/dashboard.dart';
import 'package:pharmacy/views/profile/widgets/menu_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadUser();

    if (TokenStorage.token == null || TokenStorage.token!.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Registration()),
        );
      });
    }
  }

  Future<void> loadUser() async {
    try {
      final result = await UserService().getMyUser();

      setState(() {
        user = result;
        loading = false;
      });
    } catch (e) {
      print("USER ERROR: $e");

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: kGreyShade),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ExpansionTile(
                  title: Text(
                    user == null ? "Ýüklenýär..." : '${user!.Name}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    user?.Email ?? "",
                    style: TextStyle(color: kGreyLight),
                  ),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: kGreyShade,
                    child: user == null
                        ? null
                        : Text(
                            user!.Name[0].toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                  ),
                  iconColor: kGrey,
                  collapsedIconColor: kGrey,
                  children: [
                    MenuButton(
                      icon: Icons.dashboard_outlined,
                      title: "Dolandyryş paneli",
                      onTap: () {},
                    ),
                    MenuButton(
                      icon: Icons.receipt_long_outlined,
                      title: "Sargytlarym",
                      onTap: () {},
                    ),
                    MenuButton(
                      icon: Icons.notifications_none,
                      title: "Bildirişler",
                      onTap: () {},
                    ),
                    MenuButton(
                      icon: Icons.star_border,
                      title: "Bahalandyrmalarym",
                      onTap: () {},
                    ),
                    MenuButton(
                      icon: Icons.account_circle_outlined,
                      title: "Hasabym",
                      onTap: () {},
                    ),
                    MenuButton(
                      icon: Icons.person_outline,
                      title: "Profili täzele",
                      onTap: () {},
                    ),
                    MenuButton(
                      icon: Icons.key_outlined,
                      title: "Paroly üýtget",
                      onTap: () {},
                    ),
                    MenuButton(
                      icon: Icons.logout,
                      title: "Çykmak",
                      onTap: () async {
                        await AuthService().logout();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Registration(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Dolandyryş paneli",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(height: 15),

          DashboardCard(
            icon: AntDesign.shoppingcart,
            title: "Jemi sargytlar",
            iconBg: kRedLight,
            iconColor: kRed,
          ),

          DashboardCard(
            icon: AntDesign.reload1,
            title: "Garaşylýan sargytlar",
            iconBg: kOrangeLight,
            iconColor: kOrange,
          ),

          DashboardCard(
            icon: AntDesign.car,
            title: "Sargyt işlenýär",
            iconBg: kIndigoLight,
            iconColor: kIndigo,
          ),
          DashboardCard(
            icon: AntDesign.check,
            title: "Tamamlanan sargytlar",
            iconBg: kGreenLight,
            iconColor: kGreen,
          ),
        ],
      ),
    );
  }
}
