require_relative '../app/models/student'

module StudentsImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/students.csv")
    field_names = nil
    Student.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')    #array of strings
        if field_names.nil?
          field_names = data      #headers becoming field_names (column names)
        else
          attribute_hash = Hash[field_names.zip(data)]
          student = Student.create!(attribute_hash)
        end
      end
    end
  end
end
