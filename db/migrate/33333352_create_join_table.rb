require_relative '../config'

class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :teachers_students, :id => false do |t|
      t.references :teacher, :null => false
      t.references :student, :null => false
    end
  end
end
