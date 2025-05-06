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
    return LayoutBuilder(
      builder: (contexto, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 6),
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  value.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              decoration: BoxDecoration(
                color: MiraColors.areiaDourada,
                borderRadius: BorderRadius.circular(5),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: percent,
                child: Container(
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 6),
              height: constraints.maxHeight * 0.15,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
