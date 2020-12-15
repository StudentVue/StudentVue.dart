import 'package:studentvueclient/studentvueclient.dart';

void main() async {
  var client = StudentVueClient('my username', 'my password', 'my studentvue mobile app url', mock: true);
  print('loading data');
  var grades = await client.loadGradebook();
  print(grades.toString());
  var studentData = await client.loadStudentData(callback: (pctLoaded) {
    print('${pctLoaded * 100}% loaded');
  });
  print(studentData.toString());
}
