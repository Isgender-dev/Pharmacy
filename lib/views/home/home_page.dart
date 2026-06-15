import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'package:pharmacy/services/pharmacy_medicine_service.dart';
import 'package:pharmacy/views/check_login.dart';
import 'package:pharmacy/views/menu/menu_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> pharmacyMedicines = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkLogin(context);
      await loadPharmacyMedicines();
    });
  }

  Future<void> loadPharmacyMedicines() async {
    print("TOKEN: ${TokenStorage.token}");
    if (TokenStorage.token == null || TokenStorage.token!.isEmpty) {
      setState(() => isLoading = false);
      return;
    }

    try {
      final response = await PharmacyMedicineService().getPharmacyMedicines();
      
      print("RESPONSE: ${response.data}");

      setState(() {
        pharmacyMedicines = response.data['data'] ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(color: kPrimary));
    }

    if (pharmacyMedicines.isEmpty) {
      return const Center(child: Text("Dermanlar entek ýok"));
    }

    return ListView.builder(
      itemCount: pharmacyMedicines.length,
      itemBuilder: (context, index) {
        final pharmacyMedicine = pharmacyMedicines[index];

        return MenuItem(
          icon: Icons.medication_outlined,
          title: (pharmacyMedicine['name'] ?? '').toString(),
          onTap: () {},
        );
      },
    );
  }
}
