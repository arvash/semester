class StudentsController < ApplicationController
  before_filter :check ,:except=>[:index, :show, :new, :create]
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
    @student.user_id=current_user.id
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
    @student.user_id=current_user.id
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
  private
  def check
    @student = Student.find(params[:id])
    if @student.user_id != current_user.id
      #flash.now[:alert] = "You Cant perform that action."
      redirect_to students_path, :notice  => "You Cant perform that action."
      
    end
  end
end
