  p $LOAD_PATH << 'app/models'
  Dir['app/models/*.rb'].each do |file|
    require File.basename(file, File.extname(file))
  end

  student = Student.first
  student.name = "Arianna Savant"
  student.save!

teacher = TeachersStudent.create!(student_id: 1, teacher_id: 1)

