import 'package:flutter/material.dart';

class IssuedCertificatePage extends StatelessWidget {
  const IssuedCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: FloatingActionButton.extended(
            onPressed: () {},

            icon: Icon(Icons.add),
            label: Text("صدور گواهی",
            style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
