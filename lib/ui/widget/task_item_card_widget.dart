import 'package:flutter/material.dart';

class TaskItemCardWidget extends StatelessWidget {
  const TaskItemCardWidget({
    super.key,
    required this.title,
    this.isCompleted,
    this.onTap,
  });

  final String title;
  final bool? isCompleted;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.blueAccent,
            ),
            child: Center(
              child: Text(
                title[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: isCompleted == true ? Colors.black54 : Colors.black,
              decoration:
              isCompleted == true ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
