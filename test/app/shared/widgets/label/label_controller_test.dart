import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:example_hasura_flutter/app/shared/widgets/label/label_controller.dart';
import 'package:example_hasura_flutter/app/app_module.dart';

void main() {
  initModule(AppModule());
  LabelController label;

  setUp(() {
    label = AppModule.to.get<LabelController>();
  });

  group('LabelController Test', () {
    test("First Test", () {
      expect(label, isInstanceOf<LabelController>());
    });

    test("Set Value", () {
      expect(label.value, equals(0));
      label.increment();
      expect(label.value, equals(1));
    });
  });
}
