import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_cotainer.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

/// -- Most of the styling is already defined in the Utils -> Themes -> ChipTheme.dart
class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,

        /// Text color when selected
        labelStyle: TextStyle(
          color: selected ? TColors.white : null,
        ),

        /// Color circle (for color attributes)
        avatar: isColor
            ? TCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunctions.getColor(text)!,
              )
            : null,

        /// Remove extra spacing when color chip
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,

        /// Make it perfectly circular for color
        shape: isColor ? const CircleBorder() : null,

        /// Background color handling
        backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,

        selectedColor:
            isColor ? THelperFunctions.getColor(text)! : TColors.primary,
      ),
    );
  }
}
