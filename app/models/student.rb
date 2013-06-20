require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base

  validates :email, :format => {  :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, 
                                  :message => "Please enter a valid email address."}
  validates :email, :uniqueness => true
  validates :age, :numericality => {  :greater_than => 5  }
  validates :phone, :format => {  :with => /^(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/,
                                  :message => "Please enter a valid 10-digit phone number."}


  # def name
  #   "#{first_name} #{last_name}"
  # end

  def age
    now = Date.today
    if now.month > birthday.month
      now.year - birthday.year
    else
      now.year - birthday.year - 1
    end
  end
    
end
