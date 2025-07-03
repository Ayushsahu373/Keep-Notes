import 'package:flutter/material.dart';

Widget noteEditor({
  required TextEditingController controller,
  required String hintText,
  required bool isHidden,
  required Function(String) onSave,
  required VoidCallback onCancel,
}) {
  return Offstage(
    offstage: isHidden,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintText,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onCancel,
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => onSave(controller.text),
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
