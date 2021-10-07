import 'package:flutter/material.dart';

class RandomItemButton extends StatelessWidget {
  const RandomItemButton({
    Key? key,
    required this.onTap,
    required this.randomItemExecuted,
  }) : super(key: key);

  final Function onTap;
  final ValueNotifier<bool> randomItemExecuted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(
          valueListenable: randomItemExecuted,
          builder: (context, value, child) {
            return FloatingActionButton(
              backgroundColor: Colors.grey[700],
              mini: true,
              child: Icon(randomItemExecuted.value ? Icons.replay_outlined : Icons.shuffle, color: Colors.white, size: 16.0),
              onPressed: () {
                onTap.call();
              },
            );
          }),
    );
  }
}
