class SavedEventsController < ApplicationController
  before_action :current_user_must_be_saved_event_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_saved_event_user
    saved_event = SavedEvent.find(params[:id])

    unless current_user == saved_event.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @saved_events = current_user.saved_events.page(params[:page]).per(10)

    render("saved_events/index.html.erb")
  end

  def show
    @saved_event = SavedEvent.find(params[:id])

    render("saved_events/show.html.erb")
  end

  def new
    @saved_event = SavedEvent.new

    render("saved_events/new.html.erb")
  end

  def create
    @saved_event = SavedEvent.new

    @saved_event.event_id = params[:event_id]
    @saved_event.user_id = params[:user_id]

    save_status = @saved_event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_events/new", "/create_saved_event"
        redirect_to("/saved_events")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved event created successfully.")
      end
    else
      render("saved_events/new.html.erb")
    end
  end

  def edit
    @saved_event = SavedEvent.find(params[:id])

    render("saved_events/edit.html.erb")
  end

  def update
    @saved_event = SavedEvent.find(params[:id])

    @saved_event.event_id = params[:event_id]
    @saved_event.user_id = params[:user_id]

    save_status = @saved_event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_events/#{@saved_event.id}/edit", "/update_saved_event"
        redirect_to("/saved_events/#{@saved_event.id}", :notice => "Saved event updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved event updated successfully.")
      end
    else
      render("saved_events/edit.html.erb")
    end
  end

  def destroy
    @saved_event = SavedEvent.find(params[:id])

    @saved_event.destroy

    if URI(request.referer).path == "/saved_events/#{@saved_event.id}"
      redirect_to("/", :notice => "Saved event deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Saved event deleted.")
    end
  end
end
