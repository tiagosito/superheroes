import 'package:flutter/material.dart';

class SuperHeroHomeEditText extends StatelessWidget {
  const SuperHeroHomeEditText({
    Key? key,
    required this.onTap,
    required this.editingController,
  }) : super(key: key);

  final Function(String) onTap;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          onTap.call(value);
        },
        controller: editingController,
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          labelText: "Superhero",
          hintText: "type",
          labelStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          focusColor: Colors.white,
        ),
      ),
    );
  }
}
