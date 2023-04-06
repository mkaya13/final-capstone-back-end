# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(first_name:"Mert", last_name:"Kaya", email:"mert@hotmail.com", password:"12345678")

first_doc = Doctor.create(first_name:"James", last_name:"Bond", major: "neurosurgeon", profile_picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaSeZJ9uHTNOG4Rfn0TlW6ieywFJgsDB0Npmho57aewEmH-p4KtzHGj5jHxVQTw2w2w4c&usqp=CAU", fees: "2000.00")

first_time_schedule = TimeSchedule.create(time_from:"9:00", time_to:"9:10")
second_time_schedule = TimeSchedule.create(time_from: "9:10", time_to: "9:20")
third_time_schedule = TimeSchedule.create(time_from: "9:20", time_to: "9:30")

first_doctor_time = DoctorTime.create(day: "Monday", doctor_id: first_doc.id, time_schedule_id: first_time_schedule.id)
second_doctor_time = DoctorTime.create(day: "Monday", doctor_id: first_doc.id, time_schedule_id: second_time_schedule.id)
third_doctor_time = DoctorTime.create(day: "Monday", doctor_id: first_doc.id, time_schedule_id: third_time_schedule.id)


first_appointment = Appointment.create(description: "First appointment for Mert", date: Date.parse("10/04/2023"), time: Time.now, users_id: first_user.id, doctor: first_doc)

first_doc_available = DoctorAvailableTime.create(date: Date.parse("10/04/2023"), time: Time.now, available: true, appointments_id: first_appointment.id)