import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SessionStepper extends StatelessWidget {
  final int currentStep;

  const SessionStepper({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStepItem(1, 'Session', true, true),
        _buildConnector(true),
        _buildStepItem(2, '', false, false),
        _buildConnector(false),
        _buildStepItem(3, '', false, false),
        _buildConnector(false),
        _buildStepItem(4, '', false, false),
      ],
    );
  }

  Widget _buildStepItem(int step, String label, bool isActive, bool isFirst) {
    return Expanded(
      flex: isFirst ? 3 : 1,
      child: Row(
        children: [
          if (isFirst)
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B00),
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
                .animate(onPlay: (controller) => controller.repeat(reverse: true))
                .shimmer(duration: 2000.ms, delay: 1000.ms),
            )
          else
            Expanded(
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFFFF6B00) : const Color(0xFFFFF0E6),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  step.toString(),
                  style: TextStyle(
                    color: isActive ? Colors.white : const Color(0xFFFF6B00),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildConnector(bool isActive) {
    return Container(
      width: 20,
      height: 2,
      color: isActive ? const Color(0xFFFF6B00) : const Color(0xFFFFF0E6),
    );
  }
}
