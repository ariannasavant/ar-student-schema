require_relative '../app/models/teacher'
require 'faker'

module TeachersImporter
  def self.import
    attribute_array = []
    field_names = [:name, :email, :phone]
    9.times do 
      attribute_array << [Faker::Name.name, Faker::Internet.email, Faker::PhoneNumber.phone_number] 
    end
    attribute_array.each do |fake_info|
      teacher_info = Hash[field_names.zip(fake_info)]
      teacher = Teacher.create!(teacher_info)
    end 
  end
end
