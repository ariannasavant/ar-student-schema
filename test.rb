  $LOAD_PATH << 'app/models'
  Dir['app/models/*.rb'].each do |file|
    require File.basename(file, File.extname(file))
  end

  student = Student.first
  student.name = "Arianna Savant"
  student.save!

teacher = Teacher.create!(name: 'Anne Spalding', email: 'anne@dbc.com', phone: '3238960011')
teacher.students << student



