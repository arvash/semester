class Course < ActiveRecord::Base
  belongs_to :user
  has_many :courses_students, :dependent => :destroy
  has_many :students, :through => :courses_students
end
