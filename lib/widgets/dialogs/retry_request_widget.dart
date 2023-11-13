import 'package:flutter/material.dart';

Widget retryRequestWidget({required Function fn}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.0,
          child: Image.asset(
            'assets/images/logo_no_bg.png',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 12.0),
        const Text(
          'UHBC - Inspeções',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w300,
            letterSpacing: 2.5,
          ),
        ),
        const SizedBox(height: 30),
        const Text('Ocorreu um erro!', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () => fn(),
          child: const Text('Tentar novamente'),
        )
      ],
    ),
  );
}
