import 'package:flutter/material.dart';

class AppHeadline extends StatelessWidget {
  const AppHeadline.large(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : size = _HeadlineSize.large;

  const AppHeadline.medium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : size = _HeadlineSize.medium;

  const AppHeadline.small(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : size = _HeadlineSize.small;

  final String text;
  final _HeadlineSize size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    late final TextStyle baseStyle;

    switch (size) {
      case _HeadlineSize.large:
        baseStyle = theme.textTheme.headlineLarge!;
        break;
      case _HeadlineSize.medium:
        baseStyle = theme.textTheme.headlineMedium!;
        break;
      case _HeadlineSize.small:
        baseStyle = theme.textTheme.headlineSmall!;
        break;
    }

    return Text(
      text,
      style: baseStyle.copyWith(color: color),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody.large(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : size = _BodySize.large;

  const AppBody.medium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : size = _BodySize.medium;

  const AppBody.small(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : size = _BodySize.small;

  final String text;
  final _BodySize size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    late final TextStyle baseStyle;

    switch (size) {
      case _BodySize.large:
        baseStyle = theme.textTheme.bodyLarge!;
        break;
      case _BodySize.medium:
        baseStyle = theme.textTheme.bodyMedium!;
        break;
      case _BodySize.small:
        baseStyle = theme.textTheme.bodySmall!;
        break;
    }

    return Text(
      text,
      style: baseStyle.copyWith(color: color),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

//
// /// Label text components
class AppLabel extends StatelessWidget {
  const AppLabel.large(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : size = _LabelSize.large;

  const AppLabel.medium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : size = _LabelSize.medium;

  const AppLabel.small(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : size = _LabelSize.small;

  final String text;
  final _LabelSize size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    late final TextStyle baseStyle;

    switch (size) {
      case _LabelSize.large:
        baseStyle = theme.textTheme.labelLarge!;
        break;
      case _LabelSize.medium:
        baseStyle = theme.textTheme.labelMedium!;
        break;
      case _LabelSize.small:
        baseStyle = theme.textTheme.labelSmall!;
        break;
    }

    return Text(
      text,
      style: baseStyle.copyWith(color: color),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

enum _DisplaySize { large, medium, small }

enum _HeadlineSize { large, medium, small }

enum _TitleSize { large, medium, small }

enum _BodySize { large, medium, small }

enum _LabelSize { large, medium, small }
