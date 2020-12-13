import 'package:dio/dio.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:xml/xml.dart';

// void debugPrint(dynamic d) {
//   print(d);
// }

class StudentVueClient {

  final domain;
  String reqURL;

  final String username, password;
  final bool studentAccount;
  StudentVueClient(this.username, this.password, this.domain, {this.studentAccount = true});

  final Dio _dio = Dio(BaseOptions(validateStatus: (_) => true));

  Future<StudentVueData> loadGradebook({Function(double) callback}) async {

    reqURL = 'https://' + domain + '/Service/PXPCommunication.asmx?WSDL';

    var requestData = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
        <ProcessWebServiceRequest xmlns="http://edupoint.com/webservices/">
            <userID>$username</userID>
            <password>$password</password>
            <skipLoginLog>1</skipLoginLog>
            <parent>${studentAccount ? '0' : '1'}</parent>
            <webServiceHandleName>PXPWebServices</webServiceHandleName>
            <methodName>Gradebook</methodName>
            <paramStr>&lt;Parms&gt;&lt;ChildIntID&gt;0&lt;/ChildIntID&gt;&lt;/Parms&gt;</paramStr>
        </ProcessWebServiceRequest>
    </soap:Body>
</soap:Envelope>''';

    var headers = <String, List<String>>{
      'Content-Type' : ['text/xml']
    };

    var res = await _dio.post(
        reqURL,
        data: requestData,
        options: Options(
            headers: headers
        ),
        onSendProgress: (one, two) {
          if (callback != null) {
            callback((one / two) * 0.5);
          }
        },
        onReceiveProgress: (one, two) {
          if (callback != null) {
            callback((one / two) * 0.5 + 0.5);
          }
        }
    );


    final document = XmlDocument.parse(HtmlUnescape().convert(res.data));
    await Future.delayed(const Duration(milliseconds: 1500));
//    final document = XmlDocument.parse(testData);
    if(res.data.toString().contains('Invalid user id or password')) {
      return StudentVueData()..error = 'Invalid user id or password';
    }
    if(res.data.toString().contains('The user name or password is incorrect')) {
      return StudentVueData()..error = 'The user name or password is incorrect';
    }
    var currentMP = document.findAllElements('ReportingPeriod').first.getAttribute('GradePeriod');

//    debugPrint('currentMP: ${currentMP}');

    StudentVueData svData = StudentVueData();

    XmlElement courses = document.findAllElements('Courses').first;
    List<SchoolClass> classes = List();
    for(int i = 0; i < courses.children.length; i++) {
      XmlNode current = courses.children[i];
//      debugPrint('adding: $current');
      if(current.getAttribute('Title') == null) continue;
      SchoolClass _class = SchoolClass();
      // when regex in doubt
//      _class.className = current.getAttribute('Title').replaceAll(RegExp('\(([A-Z])\w+\)'), '');
      // take the easy way out
      _class.className = current.getAttribute('Title').substring(0, current.getAttribute('Title').indexOf('('));
      _class.period = int.tryParse(current.getAttribute('Period') ?? '0') ?? -1;
      _class.roomNumber = current.getAttribute('Room') ?? 'N/A';
      _class.classTeacher = current.getAttribute('Staff') ?? 'N/A';
      _class.classTeacherEmail = current.getAttribute('StaffEMail') ?? 'N/A';

      current = current.findAllElements('GradeCalculationSummary').first;
      if (current == null) {
        classes.add(_class);
        continue;
      }

      _class.assignmentCategories = List<AssignmentCategory>();
      for(int i = 0; i < current.children.length; i++) {
        if(current.children[i].getAttribute('Type') == 'TOTAL') {
          _class.earnedPoints = double.tryParse(current.children[i].getAttribute('Points') ?? '');
          _class.earnedPoints = double.tryParse(current.children[i].getAttribute('PointsPossible') ?? '');
          _class.pctGrade = current.children[i].getAttribute('WeightedPct');
        } // else {
        AssignmentCategory category = AssignmentCategory();
        category.name = current.children[i].getAttribute('Type');
        category.weight = double.tryParse((current.children[i].getAttribute('Weight') ?? '').replaceAll('%', '')) ?? 0.0;
        category.earnedPoints = double.tryParse(current.children[i].getAttribute('Points') ?? '') ?? 0.0;
        category.possiblePoints = double.tryParse(current.children[i].getAttribute('PointsPossible') ?? '') ?? 0.0;
        _class.assignmentCategories.add(category);
//          debugPrint('added category for class ${_class.className} : ${category}');
        // }
      }

      current = current.parent.findAllElements('Assignments').first;
      if (current == null) {
        classes.add(_class);
        continue;
      }

      _class.assignments = List<Assignment>();
      for(int i = 0; i < current.children.length; i++) {
        Assignment ass = Assignment();
        ass.assignmentName = current.children[i].getAttribute('Measure') ?? 'Assignment';
        ass.category = current.children[i].getAttribute('Type') ?? 'No Category';
        ass.date = current.children[i].getAttribute('DueDate') ?? '';
        ass.earnedPoints = current.children[i].getAttribute('Score') == 'Not Graded' ? -1 : double.tryParse((current.children[i].getAttribute('Points') ?? 'N/A').replaceAll(' ', '').split('/')[0]) ?? -1;
        if(current.children[i].getAttribute('Score') == 'Not Graded') {
          ass.possiblePoints = double.tryParse((current.children[i].getAttribute('Points') ?? '').replaceAll(' Points Possible', ''));
        } else {
//          ass.possiblePoints = double.tryParse(current.children[i].getAttribute('Score') ?? '') == null ? -1 : double.tryParse((current.children[i].getAttribute('Points') ?? 'N/A').replaceAll(' ', '').split('/').last) ?? -1;
          if(double.tryParse(current.children[i].getAttribute('Score') ?? 'N/A') == null) {
            List<String> pointsStr = (current.children[i].getAttribute('Points') ?? 'N/A').replaceAll(' ', '').split('/');
            if(pointsStr.length < 2) {
              ass.possiblePoints = -1;
            } else {
              double pp = double.tryParse(pointsStr[1]);
              ass.possiblePoints = pp ?? -1;
            }
          } else {
            ass.possiblePoints = double.tryParse(current.children[i].getAttribute('Score') ?? 'N/A');
          }
        }
        _class.assignments.add(ass);
      }

      classes.add(_class);
    }
    svData.classes = classes;

    return svData;
  }

}

class StudentVueData {
  List<SchoolClass> classes;
  String studentName;

  String error;

  StudentVueData({this.classes, this.studentName});
}

class SchoolClass {
  String className, classTeacher, classTeacherEmail, markingPeriod, roomNumber, pctGrade;
  double earnedPoints, possiblePoints;
  int period;
  List<AssignmentCategory> assignmentCategories;
  List<Assignment> assignments;

  SchoolClass({this.className, this.classTeacher, this.classTeacherEmail, this.markingPeriod, this.period, this.earnedPoints, this.possiblePoints, this.assignmentCategories, this.assignments});
}

class Assignment {
  String assignmentName, date, category;
  // earn points = -1 means grade not added
  double earnedPoints, possiblePoints;

  Assignment({this.assignmentName, this.date, this.earnedPoints, this.possiblePoints});
}

class AssignmentCategory {
  double earnedPoints;
  double possiblePoints;
  double weight;
  String name;

  AssignmentCategory({this.name, this.weight});

  @override
  String toString() {
    return 'AssignmentCategory{earnedPoints: $earnedPoints, possiblePoints: $possiblePoints, weight: $weight, name: $name}';
  }
}