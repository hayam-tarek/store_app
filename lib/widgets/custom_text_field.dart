import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.label,
    this.onChanged,
    this.keyboardType,
    this.initialValue,
    required this.hintText,
  });
  final String? label;
  final String? initialValue;
  final String hintText;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 80,
        child: TextFormField(
          // initialValue: initialValue,
          controller: textEditingController..text = initialValue ?? '',
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'The field is empty';
            }
            return null;
          },
          decoration: InputDecoration(
            suffix: IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.black,
              ),
              onPressed: () {
                textEditingController.clear();
              },
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.green,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
