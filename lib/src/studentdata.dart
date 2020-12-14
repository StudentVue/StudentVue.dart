class StudentData {
  String lockerInfo,
      formattedName,
      permId,
      gender,
      grade,
      address,
      lastNameGoesBy,
      nickname,
      birthdate,
      email,
      phone,
      homeLanguage,
      currentSchool,
      homeroomTeacher,
      homeroomTeacherEmail,
      homeroom,
      counselorName,
      photo,
      physicianName,
      physicianPhone,
      dentistName,
      dentistPhone;

  StudentData({this.lockerInfo, this.formattedName, this.permId, this.gender, this.grade, this.address, this.lastNameGoesBy, this.nickname, this.birthdate, this.email, this.phone, this.homeLanguage, this.currentSchool, this.homeroomTeacher, this.homeroomTeacherEmail, this.homeroom, this.counselorName, this.photo, this.physicianName, this.physicianPhone, this.dentistName, this.dentistPhone});

  @override
  String toString() {
    return 'StudentData{lockerInfo: $lockerInfo, formattedName: $formattedName, permId: $permId, gender: $gender, grade: $grade, address: $address, lastNameGoesBy: $lastNameGoesBy, nickname: $nickname, birthdate: $birthdate, email: $email, phone: $phone, homeLanguage: $homeLanguage, currentSchool: $currentSchool, homeroomTeacher: $homeroomTeacher, homeroomTeacherEmail: $homeroomTeacherEmail, homeroom: $homeroom, counselorName: $counselorName, photo: $photo, physicianName: $physicianName, physicianPhone: $physicianPhone, dentistName: $dentistName, dentistPhone: $dentistPhone}';
  }
}