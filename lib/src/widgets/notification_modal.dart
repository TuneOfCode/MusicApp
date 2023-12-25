import 'package:flutter/material.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Wrap(
        spacing: 60,
        children: [
          Container(height: 10),
          const Text(
            "Thông báo",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Container(height: 10),
          Text(
            'Bạn có muốn thực hiện hành động này không?',
            style: TextStyle(color: Colors.grey[600], fontSize: 18),
          ),
          Container(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.pop(context); // Close the sheet.
                },
                child: Text("Huỷ bỏ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Đồng ý",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
              )
            ],
          )
        ],
      ),
    );
  }
}
