import 'package:studentvueclient/studentvueclient.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    StudentVueClient s;

    setUp(() {
      s = StudentVueClient('username', 'password', true);
    });

    test('First Test', () async {
      // expect(awesome.isAwesome, isTrue);
      var d = await s.loadGradebook();
      expect(d.classes.isNotEmpty, isTrue);
    });
  });
}
