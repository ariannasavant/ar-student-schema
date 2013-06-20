require_relative '../config'

class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |attribute|
      attribute.string :name
      attribute.string :email
      attribute.string :phone
    end
  end
end
