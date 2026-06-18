import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'package:pharmacy/models/user.dart';
import 'package:pharmacy/services/auth_service.dart';
import 'package:pharmacy/services/user_service.dart';
import 'package:pharmacy/views/profile/profile.dart';

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
          MaterialPageRoute(builder: (_) => const Profile()),
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
              border: Border.all(color: kGrayShade),
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
                    user == null
                        ? "Ýüklenýär..."
                        : '${user!.FirstName} ${user!.LastName}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    user?.Email ?? "",
                    style: TextStyle(color: kGrayLight),
                  ),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: kGrayShade,
                    child: user == null
                        ? null
                        : Text(
                            user!.FirstName[0].toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                  ),
                  iconColor: kGray,
                  collapsedIconColor: kGray,
                  children: [
                    _MenuButton(
                      icon: Icons.dashboard_outlined,
                      title: "Dolandyryş paneli",
                      onTap: () {},
                    ),
                    _MenuButton(
                      icon: Icons.receipt_long_outlined,
                      title: "Sargytlarym",
                      onTap: () {},
                    ),
                    _MenuButton(
                      icon: Icons.notifications_none,
                      title: "Bildirişler",
                      onTap: () {},
                    ),
                    _MenuButton(
                      icon: Icons.star_border,
                      title: "Bahalandyrmalarym",
                      onTap: () {},
                    ),
                    _MenuButton(
                      icon: Icons.account_circle_outlined,
                      title: "Hasabym",
                      onTap: () {},
                    ),
                    _MenuButton(
                      icon: Icons.person_outline,
                      title: "Profili täzele",
                      onTap: () {},
                    ),
                    _MenuButton(
                      icon: Icons.key_outlined,
                      title: "Paroly üýtget",
                      onTap: () {},
                    ),
                    _MenuButton(
                      icon: Icons.logout,
                      title: "Çykmak",
                      onTap: () async {
                        await AuthService().logout();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const Profile()),
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

          _DashboardCard(
            icon: AntDesign.shoppingcart,
            title: "Jemi sargytlar",
            iconBg: kRedLight,
            iconColor: kRed,
          ),

          _DashboardCard(
            icon: AntDesign.reload1,
            title: "Garaşylýan sargytlar",
            iconBg: kOrangeLight,
            iconColor: kOrange,
          ),

          _DashboardCard(
            icon: AntDesign.car,
            title: "Sargyt işlenýär",
            iconBg: kIndigoLight,
            iconColor: kIndigo,
          ),
          _DashboardCard(
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

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuButton({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        iconColor: kGray,
        foregroundColor: kGray,
        side: BorderSide(color: kGray),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [Icon(icon), const SizedBox(width: 15), Text(title)],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconBg;
  final Color iconColor;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.iconBg,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kGrayShade),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: iconBg,
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
