class Course < ActiveRecord::Base
  has_many :courses_students, :dependent => :destroy
  has_many :students, :through => :courses_students
end
