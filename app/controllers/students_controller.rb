class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to @student, :notice => "Successfully created student."
    else
      render :action => 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end
  
   def update
    params[:student][:course_ids] ||= []
    @student = Student.find(params[:id])
     if @student.update_attributes(params[:student])
      redirect_to @student, :notice  => "Successfully updated student."
    else
      render :action => 'edit'
    end
  end

   def assign_course
     @student = Student.find(params[:id])
     @student.course_ids.each do |var|
     @courses_student= CoursesStudent.new
     @courses_student.student_id = @student.id
     @courses_student.course_id = var
     end

   end

   def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_url, :notice => "Successfully destroyed student."
  end
end
