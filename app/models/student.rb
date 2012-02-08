class Student < ActiveRecord::Base
  has_many :courses_students, :dependent => :destroy
  has_many :courses, :through => :courses_students
  #:class_name => "MyApplication::Course"
end
