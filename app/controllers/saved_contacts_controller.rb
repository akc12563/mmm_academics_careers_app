class SavedContactsController < ApplicationController
  before_action :current_user_must_be_saved_contact_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_saved_contact_user
    saved_contact = SavedContact.find(params[:id])

    unless current_user == saved_contact.self_user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @saved_contacts = SavedContact.where({:self_id=>current_user.id})

    render("saved_contacts/index.html.erb")
  end

  def show
    @saved_contact = SavedContact.find(params[:id])

    render("saved_contacts/show.html.erb")
  end

  def new
    @saved_contact = SavedContact.new

    render("saved_contacts/new.html.erb")
  end

  def create
    @saved_contact = SavedContact.new

    @saved_contact.contact_id = params[:contact_id]
    @saved_contact.self_id = params[:self_id]

    save_status = @saved_contact.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_contacts/new", "/create_saved_contact"
        redirect_to("/saved_contacts")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved contact created successfully.")
      end
    else
      render("saved_contacts/new.html.erb")
    end
  end

  def edit
    @saved_contact = SavedContact.find(params[:id])

    render("saved_contacts/edit.html.erb")
  end

  def update
    @saved_contact = SavedContact.find(params[:id])

    @saved_contact.contact_id = params[:contact_id]
    @saved_contact.self_id = params[:self_id]
    @saved_contact.comments = params[:comments]

    save_status = @saved_contact.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_contacts/#{@saved_contact.id}/edit", "/update_saved_contact"
        redirect_to("/saved_contacts", :notice => "Saved contact updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved contact updated successfully.")
      end
    else
      render("saved_contacts/edit.html.erb")
    end
  end

  def destroy
    @saved_contact = SavedContact.find(params[:id])

    @saved_contact.destroy

    if URI(request.referer).path == "/saved_contacts/#{@saved_contact.id}"
      redirect_to("/", :notice => "Saved contact deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Saved contact deleted.")
    end
  end
end
