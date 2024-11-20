import 'package:aziko/src/module/test/domain/entities/test_data_entity.dart';
import 'package:aziko/src/module/test/presentation/pages/pages.dart';
import 'package:aziko/src/module/test/presentation/widgets/widgets.dart';

class TestData {
  static List<TestDataEntity> testList = [
    const TestDataEntity(
      testName: 'Test widget',
      root: TestWidget(),
    ),
    const TestDataEntity(
      testName: 'CRUD test',
      root: CrudPage(),
    ),
  ];
}
