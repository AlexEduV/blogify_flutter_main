import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_dimensions.dart';

class SegmentedSwitch extends StatelessWidget {
  final int selectedIndex;
  final List<String> options;
  final ValueChanged<int> onChanged;
  final double buttonHeight;

  const SegmentedSwitch({
    required this.selectedIndex,
    required this.options,
    required this.onChanged,
    this.buttonHeight = 40.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double segmentWidth = 1 / options.length;

    //todo: calculate animation duration based on index delta;
    const animationDuration = 200;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.majorS),
        border: Border(bottom: BorderSide(color: AppColors.lightGrey, width: 0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.offGrey,
            offset: const Offset(0, 2),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppDimensions.minorL),
      child: Stack(
        children: [
          // Slider
          AnimatedAlign(
            duration: const Duration(milliseconds: animationDuration),
            curve: Curves.easeInOut,
            // Calculate alignment: -1.0 is far left, 1.0 is far right
            alignment: Alignment(-1.0 + (selectedIndex * (2.0 / (options.length - 1))), 0.0),
            child: FractionallySizedBox(
              widthFactor: segmentWidth,
              child: Container(
                height: buttonHeight,
                decoration: BoxDecoration(
                  color: AppColors.dark, // Your dark blue
                  borderRadius: BorderRadius.circular(AppDimensions.majorS),
                ),
              ),
            ),
          ),

          //Buttons
          Semantics(
            child: Row(
              children: List.generate(options.length, (index) {
                final isSelected = index == selectedIndex;
                return Expanded(
                  child: Semantics(
                    button: true,
                    selected: isSelected,
                    child: GestureDetector(
                      onTap: () => onChanged(index),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        height: buttonHeight,
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: animationDuration),
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.dark,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                          ),
                          child: Text(options[index]),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
