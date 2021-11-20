import 'package:erobot_mobile/app/data/widgets/er_tap_effect.dart';
import 'package:erobot_mobile/constants/config_constant.dart';
import 'package:flutter/material.dart';

class ErMainActionButton extends StatelessWidget {
  const ErMainActionButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.iconData,
    this.labelColor,
    this.iconColor,
    this.centerLabel = true,
    this.backgroundColor,
    this.trailingIconData,
    this.leading,
    this.margin,
    this.borderColor,
    this.width,
    this.disable = false,
    this.expand = true,
  }) : super(key: key);

  final String label;
  final bool centerLabel;
  final EdgeInsets? margin;
  final IconData? iconData;
  final VoidCallback onTap;
  final Color? labelColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final IconData? trailingIconData;
  final Widget? leading;
  final double? width;
  final bool disable;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color:
          disable ? Theme.of(context).colorScheme.background : backgroundColor ?? Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(ConfigConstant.radius1),
      border: borderColor != null
          ? Border.all(color: disable ? Theme.of(context).colorScheme.secondaryVariant : borderColor!)
          : null,
    );

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final labelColor = disable
        ? Theme.of(context).colorScheme.onBackground
        : this.labelColor ?? Theme.of(context).colorScheme.onPrimary;
    final iconColor = this.iconColor ?? theme.primaryColor;
    final labelStyle = textTheme.bodyText2!.copyWith(color: labelColor);

    final padding = const EdgeInsets.symmetric(horizontal: ConfigConstant.margin2);

    final labelMargin = EdgeInsets.symmetric(
      horizontal: iconData != null || leading != null ? ConfigConstant.iconSize2 + ConfigConstant.margin0 : 0,
    );

    return Container(
      margin: margin,
      child: ErTapEffect(
        onTap: disable ? null : onTap,
        child: Container(
          height: ConfigConstant.objectHeight1,
          width: width,
          padding: const EdgeInsets.symmetric(
            horizontal: ConfigConstant.margin1,
          ),
          decoration: decoration,
          child: Stack(
            fit: !expand ? StackFit.loose : StackFit.expand,
            alignment: Alignment.center,
            children: [
              if (iconData != null || leading != null)
                Container(
                  padding: padding,
                  alignment: Alignment.centerLeft,
                  child: leading == null
                      ? Icon(
                          iconData,
                          size: ConfigConstant.iconSize2,
                          color: iconColor,
                        )
                      : Container(child: leading),
                ),
              Container(
                padding: padding,
                alignment: !expand
                    ? null
                    : centerLabel
                        ? Alignment.center
                        : Alignment.centerLeft,
                margin: labelMargin,
                child: Text(
                  label,
                  style: labelStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              if (trailingIconData != null)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: padding,
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      trailingIconData,
                      size: ConfigConstant.iconSize2,
                      color: iconColor,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
