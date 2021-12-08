import 'package:studentvueclient/studentvueclient.dart';

void main() async {
  var client = StudentVueClient(
      'my username', 'my password', 'my studentvue mobile app url',
      mock: true);
  print('loading data');
  var grades = await client.loadGradebook();
  print(grades.toString());
  // this is static because you don't need a username and password for it
  var studentData = await StudentVueClient.loadDistrictsFromZip('zip code',
      callback: (pctLoaded) {
    print('${pctLoaded * 100}% loaded');
  }, mock: false);
  print(studentData.toString());
}
