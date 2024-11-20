import 'package:aziko/src/module/widgets/widgets.dart';

class WidgetsData {
  static List<WidgetsDataEntity> widgetsList = [
    const WidgetsDataEntity(
      widgetName: 'Test widget',
      root: WidgetsTestWidget(),
    ),
    const WidgetsDataEntity(
      widgetName: 'Eshop',
      root: AddProductView(),
    ),
    const WidgetsDataEntity(
      widgetName: 'Animation widget',
      root: AnimationWidgetPage(),
    ),
    const WidgetsDataEntity(
      widgetName: 'Swipeable button animation',
      root: SwipeableButtonAnimationPage(),
    ),
    const WidgetsDataEntity(
      widgetName: 'Button widgets',
      root: ButtonWidgetsPage(),
    ),
    const WidgetsDataEntity(
      widgetName: 'Text styles widgets',
      root: TextStylesWidget(),
    ),
  ];
}
