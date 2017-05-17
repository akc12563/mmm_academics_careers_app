class EventsController < ApplicationController
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(:distinct => true).includes(:saved_events).page(params[:page]).per(10)

    render("events/index.html.erb")
  end

  def show
    @saved_event = SavedEvent.new
    @event = Event.find(params[:id])

    render("events/show.html.erb")
  end

  def new
    @event = Event.new

    render("events/new.html.erb")
  end

  def create
    @event = Event.new

    @event.title = params[:title]
    @event.description = params[:description]
    @event.date_time = params[:date_time]
    @event.location = params[:location]
    @event.audience = params[:audience]

    save_status = @event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/events/new", "/create_event"
        redirect_to("/events")
      else
        redirect_back(:fallback_location => "/", :notice => "Event created successfully.")
      end
    else
      render("events/new.html.erb")
    end
  end

  def edit
    @event = Event.find(params[:id])

    render("events/edit.html.erb")
  end

  def update
    @event = Event.find(params[:id])

    @event.title = params[:title]
    @event.description = params[:description]
    @event.date_time = params[:date_time]
    @event.location = params[:location]
    @event.audience = params[:audience]

    save_status = @event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/events/#{@event.id}/edit", "/update_event"
        redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Event updated successfully.")
      end
    else
      render("events/edit.html.erb")
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "Event deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Event deleted.")
    end
  end
end
