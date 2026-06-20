import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'package:pharmacy/views/profile/registration.dart';

Future<void> checkLogin(BuildContext context) async {
  final token = TokenStorage.token;

  if (token == null || token.isEmpty) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Center(child: Text('Agza boluň')),
          content: const Text(
            'Bu hyzmatdan peýdalanmak üçin hasabyňyza giriň ýa-da täze hasap dörediň',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ýap', style: TextStyle(color: kRed),),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Registration()),
                );
              },
              child: const Text('Giriş', style: TextStyle(color: kPrimary),),
            ),
          ],
        ),
      );
    });
  }
}