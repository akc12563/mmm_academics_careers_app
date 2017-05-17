class SavedJobsController < ApplicationController
  before_action :current_user_must_be_saved_job_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_saved_job_user
    saved_job = SavedJob.find(params[:id])

    unless current_user == saved_job.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.bookmark_jobs.ransack(params[:q])
      @saved_jobs = @q.result(:distinct => true).includes(:job, :user).page(params[:page]).per(10)

    render("saved_jobs/index.html.erb")
  end

  def show
    @saved_job = SavedJob.find(params[:id])

    render("saved_jobs/show.html.erb")
  end

  def new
    @saved_job = SavedJob.new

    render("saved_jobs/new.html.erb")
  end

  def create
    @saved_job = SavedJob.new

    @saved_job.job_id = params[:job_id]
    @saved_job.user_id = params[:user_id]

    save_status = @saved_job.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_jobs/new", "/create_saved_job"
        redirect_to("/saved_jobs")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved job created successfully.")
      end
    else
      render("saved_jobs/new.html.erb")
    end
  end

  def edit
    @saved_job = SavedJob.find(params[:id])

    render("saved_jobs/edit.html.erb")
  end

  def update
    @saved_job = SavedJob.find(params[:id])

    @saved_job.job_id = params[:job_id]
    @saved_job.user_id = params[:user_id]

    save_status = @saved_job.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_jobs/#{@saved_job.id}/edit", "/update_saved_job"
        redirect_to("/saved_jobs/#{@saved_job.id}", :notice => "Saved job updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved job updated successfully.")
      end
    else
      render("saved_jobs/edit.html.erb")
    end
  end

  def destroy
    @saved_job = SavedJob.find(params[:id])

    @saved_job.destroy

    if URI(request.referer).path == "/saved_jobs/#{@saved_job.id}"
      redirect_to("/", :notice => "Saved job deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Saved job deleted.")
    end
  end
end
