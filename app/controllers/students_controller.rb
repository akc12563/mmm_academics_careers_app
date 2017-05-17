class StudentsController < ApplicationController
  def index
    @students = Student.all

    render("students/index.html.erb")
  end

  def show
    @saved_contact = SavedContact.new
    @student = Student.find(params[:id])

    render("students/show.html.erb")
  end

  def new
    @student = Student.new

    render("students/new.html.erb")
  end

  def create
    @student = Student.new

    @student.first_name = params[:first_name]
    @student.last_name = params[:last_name]
    @student.grad_year = params[:grad_year]
    @student.internship_company = params[:internship_company]
    @student.internship_location = params[:internship_location]
    @student.internship_position = params[:internship_position]
    @student.full_time_company = params[:full_time_company]
    @student.full_time_position = params[:full_time_position]
    @student.full_time_location = params[:full_time_location]
    @student.current_status = params[:current_status]
    @student.email = params[:email]

    save_status = @student.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/students/new", "/create_student"
        redirect_to("/students")
      else
        redirect_back(:fallback_location => "/", :notice => "Student created successfully.")
      end
    else
      render("students/new.html.erb")
    end
  end

  def edit
    @student = Student.find(params[:id])

    render("students/edit.html.erb")
  end

  def update
    @student = Student.find(params[:id])

    @student.first_name = params[:first_name]
    @student.last_name = params[:last_name]
    @student.grad_year = params[:grad_year]
    @student.internship_company = params[:internship_company]
    @student.internship_location = params[:internship_location]
    @student.internship_position = params[:internship_position]
    @student.full_time_company = params[:full_time_company]
    @student.full_time_position = params[:full_time_position]
    @student.full_time_location = params[:full_time_location]
    @student.current_status = params[:current_status]
    @student.email = params[:email]

    save_status = @student.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/students/#{@student.id}/edit", "/update_student"
        redirect_to("/students/#{@student.id}", :notice => "Student updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Student updated successfully.")
      end
    else
      render("students/edit.html.erb")
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy

    if URI(request.referer).path == "/students/#{@student.id}"
      redirect_to("/", :notice => "Student deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Student deleted.")
    end
  end
end
