import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'package:pharmacy/services/pharmacy_medicine_service.dart';
import 'package:pharmacy/views/check_login.dart';
import 'package:pharmacy/views/home/medicine_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> Medicines = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkLogin(context);
      await loadMedicines();
    });
  }

  Future<void> loadMedicines() async {
    print("TOKEN: ${TokenStorage.token}");

    if (TokenStorage.token == null || TokenStorage.token!.isEmpty) {
      setState(() => isLoading = false);
      return;
    }

    try {
      final response = await PharmacyMedicineService().getMedicines();

      print("RESPONSE: ${response.data}");

      setState(() {
        Medicines = response.data['data'] ?? [];
        isLoading = false;
      });
    } catch (e, st) {
      print('TYPE: ${e.runtimeType}');
      print('STACK: $st');
      print('ERROR: $e');

      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(color: kPrimary));
    }

    if (Medicines.isEmpty) {
      return const Center(child: Text("Dermanlar entek ýok"));
    }

    return ListView.builder(
      itemCount: Medicines.length,
      itemBuilder: (context, index) {
        final pharmacyMedicine = Medicines[index];

        return MedicineCard(
          title: pharmacyMedicine['name'] ?? '',
          price: pharmacyMedicine['price'] as int,
          newprice: pharmacyMedicine['new_price'] as int?,
          onTap: () {},
        );
      },
    );
  }
}
