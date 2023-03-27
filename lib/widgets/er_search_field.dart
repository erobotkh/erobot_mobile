import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:erobot_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ErSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onChange;
  final Function(String?)? onSubmitted;
  final void Function()? onClear;

  const ErSearchField({
    Key? key,
    required this.controller,
    this.onChange,
    this.onSubmitted,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    InputBorder borderStyle = OutlineInputBorder(
      borderRadius: ConfigConstant.circlarRadius1,
      borderSide: BorderSide.none,
    );
    return ErTextField(
      controller: controller,
      hintText: 'Search',
      hintColor: colorScheme.secondaryContainer,
      fillColor: colorScheme.secondaryContainer.withOpacity(0.3),
      focusedBorder: borderStyle,
      border: borderStyle,
      margin: EdgeInsets.only(right: 16),
      keyboardType: TextInputType.text,
      prefixIcon: Icon(Icons.search, color: colorScheme.secondaryContainer),
      suffixIcon: buildSuffixIcons(context),
      onChanged: onChange,
      onSubmitted: onSubmitted,
    );
  }

  Padding buildSuffixIcons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: ConfigConstant.margin2),
      child: Wrap(
        spacing: ConfigConstant.margin1,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          buildSuffixIcon(
            context: context,
            icon: Icons.clear,
            onTap: onClear,
          ),
          buildSuffixIcon(
            context: context,
            icon: Icons.tune,
            onTap: () async {
              showModalActionSheet(
                context: context,
                actions: [
                  SheetAction(label: 'Members'),
                  SheetAction(label: 'Reputation'),
                ],
              ).then((value) {});
            },
          ),
        ],
      ),
    );
  }

  ErTapEffect buildSuffixIcon({
    required BuildContext context,
    required IconData icon,
    required void Function()? onTap,
  }) {
    return ErTapEffect(
      onTap: onTap,
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
    );
  }
}
