import '../domain/entities/widget_list_entity.dart';
import '../presentation/pages/with_bloc/multi_select_toggle_btn_bloc/multi_toggle_btn_bloc_page.dart';
import '../presentation/pages/with_bloc/single_select_toggle_btn_bloc/single_toggle_btn_bloc_page.dart';
import '../presentation/pages/with_stateful/multi_select_toggle_btn_state_ful/multi_toggle_btn_state_ful_page.dart';
import '../presentation/pages/with_stateful/single_select_toggle_btn_state_ful/single_toggle_btn_state_ful_page.dart';

class Data {
  static List<WidgetListEntity> widgetsList = [
    WidgetListEntity(
      name: 'Single Select Toggle Button',
      stateFul: const SingleToggleBtnWithStateFulPage(),
      bloc: SingleToggleBtnWithBlocPage(),
    ),
    WidgetListEntity(
      name: 'Multi Select Toggle Button',
      stateFul: const MultiToggleBtnWithStateFulPage(),
      bloc: MultiSelectToggleBtnWithBlocPage(),
    ),
    // const WidgetListEntity(name: 'Pop Up Menu Button', stateFul: true),
  ];
}
