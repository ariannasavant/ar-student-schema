require_relative '../config'

class ChangeStudents < ActiveRecord::Migration
  # def change
  #   add_column :students, :name, :string
  #   Student.all.each do |student|
  #     student.update_attributes! :name => student.first_name + " " + student.last_name
  #   end  
  #   remove_column :students, :first_name
  #   remove_column :students, :last_name
  #   add_column :students, :address, :string
  # end

  def up
    add_column :students, :name, :string
    Student.all.each do |student|
      student.update_attributes! :name => student.first_name + " " + student.last_name
    end  
    remove_column :students, :first_name
    remove_column :students, :last_name
    add_column :students, :address, :string
  end

  def down
    remove_column :students, :address
    add_column :students, :first_name
    add_column :students, :last_name
    Student.all.each do |student|
      student.update_attributes! :first_name => student[:name].rpartition(' ').first, :last_name => student[:name].rpartition(' ').last
    end
    remove_column :students, :name
  end

end
