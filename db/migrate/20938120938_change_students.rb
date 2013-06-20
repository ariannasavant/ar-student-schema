require_relative '../config'

class ChangeStudents < ActiveRecord::Migration
  def change
    add_column :students, :name, :string
    Student.all.each do |student|
      student.update_attributes! :name => student.first_name + " " + student.last_name
    end  
    remove_column :students, :first_name
    remove_column :students, :last_name
    add_column :students, :address, :string
  end
end
