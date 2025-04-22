import 'package:flutter/material.dart';
import 'package:mira/models/theme.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    required this.label,
    required this.value,
    required this.percent,
    super.key,
  });

  final String label;
  final double value;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: Text(
            value.toStringAsFixed(2),
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          decoration: BoxDecoration(
            color: MiraColors.areiaDourada,
            borderRadius: BorderRadius.circular(5),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: percent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
