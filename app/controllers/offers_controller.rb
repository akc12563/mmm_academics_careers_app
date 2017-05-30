class OffersController < ApplicationController
  def internship
    @offers = Offer.where(:status=>"1", :intern_fulltime=>true)

    render("offers/internship_accepted.html.erb")
  end

  def fulltime
    @offers = Offer.where(:status=>"1", :intern_fulltime=>false)

    render("offers/fulltime_accepted.html.erb")

  end

  def index

    @q = Offer.ransack(params[:q])
    @offers = @q.result.includes(:user).page(params[:page]).per(10)


    render("offers/index.html.erb")
  end

  def show
    @offer = Offer.find(params[:id])

    render("offers/show.html.erb")
  end

  def new
    @offer = Offer.new

    render("offers/new.html.erb")
  end

  def create
    @offer = Offer.new

    @offer.company = params[:company]
    @offer.position = params[:position]
    @offer.intern_fulltime = params[:intern_fulltime]
    @offer.location = params[:location]
    @offer.status = params[:status]
    @offer.user_id = params[:user_id]

    save_status = @offer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/offers/new", "/create_offer"
        redirect_to("/offers")
      else
        redirect_back(:fallback_location => "/", :notice => "Offer created successfully.")
      end
    else
      render("offers/new.html.erb")
    end
  end

  def edit
    @offer = Offer.find(params[:id])

    render("offers/edit.html.erb")
  end

  def update
    @offer = Offer.find(params[:id])

    @offer.company = params[:company]
    @offer.position = params[:position]
    @offer.intern_fulltime = params[:intern_fulltime]
    @offer.location = params[:location]
    @offer.status = params[:status]
    @offer.user_id = params[:user_id]

    save_status = @offer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/offers/#{@offer.id}/edit", "/update_offer"
        redirect_to("/offers/#{@offer.id}", :notice => "Offer updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Offer updated successfully.")
      end
    else
      render("offers/edit.html.erb")
    end
  end

  def destroy
    @offer = Offer.find(params[:id])

    @offer.destroy

    if URI(request.referer).path == "/offers/#{@offer.id}"
      redirect_to("/", :notice => "Offer deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Offer deleted.")
    end
  end
end
