class MockResponses {

  static final GradebookResponse =
  '''<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><ProcessWebServiceRequestResponse xmlns="http://edupoint.com/webservices/"><ProcessWebServiceRequestResult>&lt;Gradebook xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Type="Traditional" ErrorMessage="" HideStandardGraphInd="false" HideMarksColumnElementary="true" HidePointsColumnElementary="false" HidePercentSecondary="false" DisplayStandardsData="false" GBStandardsTabDefault="false"&gt;
     &lt;ReportingPeriods&gt;
          &lt;ReportPeriod Index="0" GradePeriod="P1" StartDate="8/19/2019" EndDate="9/27/2019" /&gt;
          &lt;ReportPeriod Index="1" GradePeriod="P2" StartDate="9/28/2019" EndDate="11/8/2019" /&gt;
          &lt;ReportPeriod Index="2" GradePeriod="P3/Fall" StartDate="11/9/2019" EndDate="12/20/2019" /&gt;
          &lt;ReportPeriod Index="3" GradePeriod="P4" StartDate="12/21/2019" EndDate="2/21/2020" /&gt;
          &lt;ReportPeriod Index="4" GradePeriod="P5" StartDate="2/22/2020" EndDate="4/17/2020" /&gt;
          &lt;ReportPeriod Index="5" GradePeriod="P6/Spring" StartDate="4/18/2020" EndDate="6/2/2020" /&gt;
     &lt;/ReportingPeriods&gt;
     &lt;ReportingPeriod GradePeriod="P4" StartDate="12/21/2019" EndDate="2/21/2020" /&gt;
     &lt;Courses&gt;
          &lt;Course Period="7" Title="AP EngLngComp72 A (ELAC302A)" Room="135" Staff="Lael Bajet" StaffEMail="BajetL@sfusd.edu" StaffGU="379C7799-3331-4C75-A3A7-35B22CBE4C3F" HighlightPercentageCutOffForProgressBar="50"&gt;
               &lt;Marks&gt;
                    &lt;Mark MarkName="P4" CalculatedScoreString="A" CalculatedScoreRaw="90.5"&gt;
                         &lt;StandardViews /&gt;
                         &lt;GradeCalculationSummary /&gt;
                         &lt;Assignments&gt;
                              &lt;Assignment GradebookID="1637597" Measure="Inferno PPE: 3-8" Type="Essays and Projects" Date="2/14/2020" DueDate="2/24/2020" Score="A" ScoreType="Letter Grade" Points="50.00 / 50.0000" Notes="" TeacherID="273733" StudentID="312711" MeasureDescription="See GC" HasDropBox="false" DropStartDate="2/14/2020" DropEndDate="2/15/2020"&gt;
                                   &lt;Resources /&gt;
                                   &lt;Standards /&gt;
                              &lt;/Assignment&gt;
                              <!-- Continued -->
                         &lt;/Assignments&gt;
                    &lt;/Mark&gt;
               &lt;/Marks&gt;
          &lt;/Course&gt;
          <!-- Continued -->
     &lt;/Courses&gt;
&lt;/Gradebook&gt;</ProcessWebServiceRequestResult></ProcessWebServiceRequestResponse></soap:Body></soap:Envelope>''';

  static final StudentInfoResponse = '''<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><ProcessWebServiceRequestResponse xmlns="http://edupoint.com/webservices/"><ProcessWebServiceRequestResult>&lt;StudentInfo xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Type="Detail"&gt;
     &lt;LockerInfoRecords /&gt;
     &lt;FormattedName&gt;Joe A Doe&lt;/FormattedName&gt;
     &lt;PermID&gt;PermId3d2d2&lt;/PermID&gt;
     &lt;Gender&gt;M&lt;/Gender&gt;
     &lt;Grade&gt;11&lt;/Grade&gt;
     &lt;Address&gt;742 Evergreen Terrace&lt;/Address&gt;
     &lt;LastNameGoesBy /&gt;
     &lt;NickName /&gt;
     &lt;BirthDate&gt;Jan 1 2000&lt;/BirthDate&gt;
     &lt;EMail&gt;student@school.org&lt;/EMail&gt;
     &lt;Phone&gt;+1 123-456 (7890)&lt;/Phone&gt;
     &lt;HomeLanguage /&gt;
     &lt;CurrentSchool&gt;Lowell HS&lt;/CurrentSchool&gt;
     &lt;Track /&gt;
     &lt;HomeRoomTch&gt;Carole Cadoppi&lt;/HomeRoomTch&gt;
     &lt;HomeRoomTchEMail&gt;CadoppiC@sfusd.edu&lt;/HomeRoomTchEMail&gt;
     &lt;HomeRoomTchStaffGU&gt;80A53656-ABDB-4208-9753-C012AF2C96D7&lt;/HomeRoomTchStaffGU&gt;
     &lt;OrgYearGU&gt;3EF9E4C8-35BA-48AE-810F-586E0B12E09E&lt;/OrgYearGU&gt;
     &lt;HomeRoom&gt;2103&lt;/HomeRoom&gt;
     &lt;CounselorName&gt;Wilson, Amber&lt;/CounselorName&gt;
     &lt;Photo&gt;&lt;/Photo&gt;
     &lt;EmergencyContacts /&gt;
     &lt;Physician Name="Dr. Doctor" Hospital="" Phone="+1 123-Doctor" Extn="" /&gt;
     &lt;Dentist Name="Dr. Dentist" Office="" Phone="+1 123-Dentist" Extn="" /&gt;
     &lt;UserDefinedGroupBoxes&gt;
          &lt;UserDefinedGroupBox GroupBoxLabel="Other Data"&gt;
               &lt;UserDefinedItems&gt;
                    &lt;UserDefinedItem ItemLabel="Counselor Name" ItemType="REV_EDIT_TEXT" Rev_Text="" SourceObject="0AFBF98B-3A86-4173-9BCC-E43C032ABEC4" SourceElement="CounselorFormattedName" VCID="211C518E-F1A8-4FBF-8C3D-3792541E4FE9" Value="Wilson, Amber" /&gt;
               &lt;/UserDefinedItems&gt;
          &lt;/UserDefinedGroupBox&gt;
     &lt;/UserDefinedGroupBoxes&gt;
&lt;/StudentInfo&gt;</ProcessWebServiceRequestResult></ProcessWebServiceRequestResponse></soap:Body></soap:Envelope>''';

}