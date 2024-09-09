import 'package:aziko/src/module/test/presentation/widgets/test_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testList = TestData.testList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Center(
          child: testList.isNotEmpty
              ? ListView.builder(
                  itemCount: testList.length,
                  itemBuilder: ((context, index) {
                    final test = testList[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => test.root,
                            ),
                          );
                        },
                        title: Text(test.testName),
                      ),
                    );
                  }),
                )
              : const Center(
                  child: Text(
                    'Empty',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
        ),
      ),
    );
  }
}
