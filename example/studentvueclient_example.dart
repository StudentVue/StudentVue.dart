import 'package:studentvueclient/studentvueclient.dart';

void main() async {
  var client = StudentVueClient('my username', 'my password', 'my studentvue mobile app url');
  print('loading data');
  var grades = await client.loadGradebook(callback: (pctLoaded) {
    print('${pctLoaded * 100}% loaded');
  });
  print('loaded grades for ${grades.classes.length + 1} classes:');
  grades.classes.forEach((e) {
    print('${e.className}, grade : ${e.pctGrade}');
  });
}
