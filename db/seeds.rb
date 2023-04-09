first_user = User.create(first_name:"Mert", last_name:"Kaya", email:"mert@hotmail.com", password:"12345678")

first_doc = Doctor.create(first_name:"James", last_name:"Bond", major: "neurosurgeon", profile_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaSeZJ9uHTNOG4Rfn0TlW6ieywFJgsDB0Npmho57aewEmH-p4KtzHGj5jHxVQTw2w2w4c&usqp=CAU", fees: "2000.00")

second_doc = Doctor.create(first_name:"Jack", last_name:"Bauwer", major: "Dentist", profile_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJW5IT4O0Q4vhItGr2QSdzZh22Ft5HZRYe2g-SWEdxlV1I9aKcYJ4z2NxsOKPu-GNrFJU&usqp=CAU", fees: "1000.00")

first_time_schedule = TimeSchedule.create(time_from:"9:00", time_to:"9:10", doctor: first_doc)
second_time_schedule = TimeSchedule.create(time_from: "9:10", time_to: "9:20", doctor: first_doc)
third_time_schedule = TimeSchedule.create(time_from: "9:20", time_to: "9:30", doctor: first_doc)

# When we create an object for Doctor Time table, we  have to create objects automatically for Doctor Appointment Time table!!!

first_doctor_time = DoctorTime.create(day: "Monday", doctor: first_doc, time_schedule_id: first_time_schedule.id, regular:false)
second_doctor_time = DoctorTime.create(day: "Monday", doctor: first_doc, time_schedule_id: second_time_schedule.id, regular: false)
third_doctor_time = DoctorTime.create(day: "Monday", doctor: first_doc, time_schedule_id: third_time_schedule.id, regular: false)

# Need to make calculation with respect to days! Fill the time_from and time_to via Doctor Time an Time Schedule Tables OR grab them via via Doctor Time an Time Schedule Tables!

first_doctor_appointment_time = DoctorAppointmentTime.create(doctor_time_id: first_doctor_time.id, doctor_id: first_doc.id, date:"10/04/2023", available: true)
second_doctor_appointment_time = DoctorAppointmentTime.create(doctor_time_id: second_doctor_time.id, doctor_id: first_doc.id, date:"10/04/2023", available: true)
third_doctor_appointment_time = DoctorAppointmentTime.create(doctor_time_id: third_doctor_time.id, doctor_id: first_doc.id, date:"10/04/2023", available: true)

# If and only if we have an available row inside doctor_appointment_time table!!
# Grab Date from doctor appointment time
# Grab Time from Time Schedule

first_user_first_appointment = Appointment.create(user_id: first_user.id, doctor_id: first_doc.id, doctor_appointment_time_id: first_doctor_appointment_time.id, description: "I have headeche", date: first_doctor_appointment_time.date, time_from: first_time_schedule.time_from, time_to: first_time_schedule.time_to, cancelled: false)