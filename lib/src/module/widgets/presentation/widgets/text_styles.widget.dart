import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStylesWidget extends StatelessWidget {
  const TextStylesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text styles'),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Display Large - 48/Bold',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              10.verticalSpace,
              Text(
                'Display Medium - 44/Bold',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              10.verticalSpace,
              Text(
                'Display Small - 34/Bold',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              10.verticalSpace,
              Text(
                'Headline Large - 30/Bold',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              10.verticalSpace,
              Text(
                'Headline Medium - 24/Bold',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              10.verticalSpace,
              Text(
                'Headline Small - 24',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              10.verticalSpace,
              Text(
                'Title Large - 20',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              10.verticalSpace,
              Text(
                'Title Medium - 18/Bold',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              10.verticalSpace,
              Text(
                'Title Small - 18',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              10.verticalSpace,
              Text(
                'Body Large - 16/Bold',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              10.verticalSpace,
              Text(
                'Body Medium - 16',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              10.verticalSpace,
              Text(
                'Body Small - 14/Bold',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              10.verticalSpace,
              Text(
                'Label Large - 14',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              10.verticalSpace,
              Text(
                'Label lMedium - 11',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              10.verticalSpace,
              Text(
                'Label Small - 8',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
