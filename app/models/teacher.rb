require_relative '../../db/config'
require 'date'

class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :students

  validates :email, :format => {  :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, 
                                  :message => "Please enter a valid email address."}
  validates :email, :uniqueness => true

end
