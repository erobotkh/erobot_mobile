import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
        ),
      ),
      body: Column(
        children: [
          testColors(
            context,
            Theme.of(context).colorScheme.primary,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.primaryVariant,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.secondary,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.secondaryVariant,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.background,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.surface,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.error,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.onPrimary,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.onSecondary,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.onBackground,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.onSurface,
          ),
          testColors(
            context,
            Theme.of(context).colorScheme.onError   ,
          ),
        ],
      ),
      // body: testText(context),
    );
  }

  Container testColors(BuildContext context, Color color) {
    return Container(
      height: 50,
      width: double.infinity,
      color: color,
    );
  }

  Column testText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Headline 2',
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          'Headline 3',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Headline 4',
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          'Headline 5',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          'Subtitle 1',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          'Subtitle 2',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          'Body text 1',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'Body Text 2',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          'Button',
          style: Theme.of(context).textTheme.button,
        ),
        Text(
          'Captions',
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          'Overline',
          style: Theme.of(context).textTheme.overline,
        ),
      ],
    );
  }
}
