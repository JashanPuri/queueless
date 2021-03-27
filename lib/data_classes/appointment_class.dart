class Appointment{

  final int appointmentId;
  final int patientId;
  final String patientName;
  final int doctorId;
  final int age;
  final String description;
  final DateTime estimatedAppointmentTime;
  bool ischeckedup;
  Appointment({this.appointmentId,this.patientId,this.patientName,this.doctorId,this.estimatedAppointmentTime,this.ischeckedup,this.age,this.description});
}
List<Appointment> appointments = [

  Appointment(appointmentId: 1,patientId: 1,patientName:"Rahul Kalse",doctorId: 1,estimatedAppointmentTime: DateTime.parse('2020-03-27T20:30:00'),ischeckedup: true,age: 15),
  Appointment(appointmentId: 2,patientId: 2,patientName:"Abhiyog Vardhan",doctorId: 2,estimatedAppointmentTime: DateTime.parse('2020-03-27T17:30:00'),ischeckedup: false,age: 23),
  Appointment(appointmentId: 3,patientId: 3,patientName:"Ruhi Advani",doctorId: 3,estimatedAppointmentTime: DateTime.parse('2020-03-27T11:30:00'),ischeckedup: false,age: 18),
  Appointment(appointmentId: 4,patientId: 4,doctorId: 4,patientName:"Manik Manha",estimatedAppointmentTime: DateTime.parse('2020-03-27T20:00:00'),ischeckedup: true,age: 26),
  Appointment(appointmentId: 5,patientId: 5,doctorId: 5,patientName:"Tanay Bharucha",estimatedAppointmentTime: DateTime.parse('2020-03-28T15:30:00'),ischeckedup: false,age: 40),
  Appointment(appointmentId: 6,patientId: 6,doctorId: 6,patientName:"Shamil Kalre",estimatedAppointmentTime: DateTime.parse('2020-03-28T21:00:00'),ischeckedup: true,age: 19),

];

List<Appointment> getAppointmentsByUserId(int patientId){
    return appointments.where((element) => element.patientId == patientId).toList();
}

List<Appointment> getAppointmentsByDoctorId(int doctorId){
  return appointments.where((element) => element.doctorId == doctorId && !element.ischeckedup).toList();
}

List<Appointment> getAppointmentsHistoryByDoctorId(int doctorId){
  return appointments.where((element) => element.doctorId == doctorId && element.ischeckedup).toList();
}

List<Appointment> getAppointmentsHistoryByPatientId(int patientId){
  return appointments.where((element) => element.patientId == patientId && element.ischeckedup).toList();
}