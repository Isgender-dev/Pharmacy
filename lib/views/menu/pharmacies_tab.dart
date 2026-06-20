import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'package:pharmacy/services/pharmacy_service.dart';
import 'package:pharmacy/views/menu/menu_item.dart';

class PharmaciesTab extends StatefulWidget {
  PharmaciesTab({super.key});

  @override
  State<PharmaciesTab> createState() => _PharmaciesTabState();
}

class _PharmaciesTabState extends State<PharmaciesTab> {
  List<dynamic> pharmacies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPharmacies();
  }

  Future<void> loadPharmacies() async {
    print("TOKEN: ${TokenStorage.token}");

    try {
      final response = await PharmacyService().getPharmacies();

      print("RESPONSE: ${response.data}");

      setState(() {
        pharmacies = response.data['data'] ?? [];
        isLoading = false;
      });
    } catch (e, st) {
      print("TYPE: ${e.runtimeType}");
      print("STACKTRACE: $st");
      print("ERROR: $e");

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(color: kPrimary));
    }

    if (pharmacies.isEmpty) {
      return const Center(child: Text("Dermanhanalar entek ýok"));
    }

    return ListView.builder(
      itemCount: pharmacies.length,
      itemBuilder: (context, index) {
        final pharmacy = pharmacies[index];
        return MenuItem(
          icon: Icons.medical_services_rounded,
          title: pharmacy['name'] ?? '',
          onTap: () {},
        );
      },
    );
  }
}
