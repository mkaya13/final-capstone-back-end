first_user = User.first
second_user = User.second

first_doc = Doctor.create(first_name:"John", last_name:"Smith", major: "Cardiology", profile_picture: "https://www.kindpng.com/picc/m/490-4909569_png-images-of-doctors-group-png-download-free.png", fees: "200.00", available_time: "Mon - Fri, 9am - 5pm")

second_doc = Doctor.create(first_name:"Jane", last_name:"Doe", major: "Pediatrics", profile_picture: "https://thumbs.dreamstime.com/b/male-doctor-portrait-isolated-white-background-56744085.jpg", fees: "150.00", available_time: "Tue - Thu, 10am - 6pm")

third_doc = Doctor.create(first_name:"Sarah", last_name:"Lee", major: "Dermatology", profile_picture: "https://www.shutterstock.com/image-photo/portrait-her-she-nicelooking-attractive-260nw-1729215223.jpg", fees: "175.00", available_time: "Mon - Wed, 9am - 3pm")

fourth_doc = Doctor.create(first_name:"Michael", last_name:"Chen", major: "Oncology", profile_picture: "https://www.pngitem.com/pimgs/m/515-5158817_telemedicine-doctor-hd-png-download.png", fees: "250.00", available_time: "Thu - Sat, 10am - 7pm")

fifth_doc = Doctor.create(first_name:"Emily", last_name:"Rodriguez", major: "Psychiatry", profile_picture: "https://thumbs.dreamstime.com/b/portrait-beautiful-asian-woman-doctor-wearing-uniform-sitting-smiling-to-teeth-white-look-camera-feel-happy-218662857.jpg", fees: "150.00", available_time: "Mon - Fri, 11am - 7pm")

sixth_doc = Doctor.create(first_name:"David", last_name:"Kim", major: "Orthopedics", profile_picture: "https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg", fees: "225.00", available_time: "Mon - Thu, 8am - 4pm")

seventh_doc = Doctor.create(first_name:"Rachel", last_name:"Wong", major: "Gynecology", profile_picture: "https://st2.depositphotos.com/1013513/12104/i/950/depositphotos_121040752-stock-photo-smiling-female-doctors-working-in.jpg", fees: "190.00", available_time: "Mon - Fri, 9am - 5pm")

eighth_doc = Doctor.create(first_name:"William", last_name:"Park", major: "Neurology", profile_picture: "https://t3.ftcdn.net/jpg/02/95/51/80/360_F_295518052_aO5d9CqRhPnjlNDTRDjKLZHNftqfsxzI.jpg", fees: "275.00", available_time: "Wed - Sun, 11am - 7pm")

ninth_doc = Doctor.create(first_name:"Jessica", last_name:"Nguyen", major: "Allergy and Immunology", profile_picture: "https://static.vecteezy.com/system/resources/previews/005/128/689/large_2x/beautiful-woman-doctor-with-hijab-portrait-on-white-background-free-photo.jpg", fees: "150.00", available_time: "Tue - Thu, 8am - 4pm")

first_time_schedule = TimeSchedule.create(time_from:"9:00", time_to:"9:10", doctor: first_doc)
second_time_schedule = TimeSchedule.create(time_from: "9:10", time_to: "9:20", doctor: first_doc)
third_time_schedule = TimeSchedule.create(time_from: "9:20", time_to: "9:30", doctor: second_doc)

# When we create an object for Doctor Time table, we  have to create objects automatically for Doctor Appointment Time table!!!

first_doctor_time = DoctorTime.create(day: "Monday", doctor: first_doc, time_schedule_id: first_time_schedule.id, regular:false)
second_doctor_time = DoctorTime.create(day: "Monday", doctor: first_doc, time_schedule_id: second_time_schedule.id, regular: false)
third_doctor_time = DoctorTime.create(day: "Monday", doctor: first_doc, time_schedule_id: third_time_schedule.id, regular: false)
fourth_doctor_time = DoctorTime.create(day: "Wednesday", doctor: second_doc, time_schedule_id: third_time_schedule.id, regular: false)

# Need to make calculation with respect to days! Fill the time_from and time_to via Doctor Time an Time Schedule Tables OR grab them via Doctor Time an Time Schedule Tables!

first_doctor_appointment_time = DoctorAppointmentTime.create(doctor_time_id: first_doctor_time.id, doctor_id: first_doc.id, date:"10/04/2023", available: true, time_from: first_time_schedule.time_from, time_to: first_time_schedule.time_to)

second_doctor_appointment_time = DoctorAppointmentTime.create(doctor_time_id: second_doctor_time.id, doctor_id: first_doc.id, date:"10/04/2023", available: true, time_from: second_time_schedule.time_from, time_to: second_time_schedule.time_to)

third_doctor_appointment_time = DoctorAppointmentTime.create(doctor_time_id: third_doctor_time.id, doctor_id: first_doc.id, date:"10/04/2023", available: true, time_from: third_time_schedule.time_from, time_to: third_time_schedule.time_to)

fourth_doctor_appointment_time = DoctorAppointmentTime.create(doctor_time_id: fourth_doctor_time.id, doctor_id: second_doc.id, date:"13/04/2023", available: true, time_from: third_time_schedule.time_from, time_to: third_time_schedule.time_to)

# If and only if we have an available row inside doctor_appointment_time table!!
# Grab Date from doctor appointment time
# Grab Time from Time Schedule

first_user_first_appointment = Appointment.create(user_id: first_user.id, doctor_id: first_doc.id, doctor_appointment_time_id: first_doctor_appointment_time.id, description: "I have headeche", date: first_doctor_appointment_time.date, time_from: first_time_schedule.time_from, time_to: first_time_schedule.time_to, cancelled: false)

first_doctor_appointment_time.update(:available => false)

second_user_first_appointment = Appointment.create(user_id: second_user.id, doctor_id: second_doc.id, doctor_appointment_time_id: fourth_doctor_appointment_time.id, description: "I have stomachache", date: fourth_doctor_appointment_time.date, time_from: first_time_schedule.time_from, time_to: first_time_schedule.time_to, cancelled: false)

fourth_doctor_appointment_time.update(:available => false)