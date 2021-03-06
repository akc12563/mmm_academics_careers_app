Rails.application.routes.draw do
#routes for internship and full time show pages
 get "/internship_accepts", :controller =>"offers", :action =>"internship"
 get "/fulltime_accepts", :controller=> "offers", :action =>"fulltime"



  # Routes for the Offer resource:
  # CREATE
  get "/offers/new", :controller => "offers", :action => "new"
  post "/create_offer", :controller => "offers", :action => "create"

  # READ
  get "/offers", :controller => "offers", :action => "index"
  get "/offers/:id", :controller => "offers", :action => "show"

  # UPDATE
  get "/offers/:id/edit", :controller => "offers", :action => "edit"
  post "/update_offer/:id", :controller => "offers", :action => "update"

  # DELETE
  get "/delete_offer/:id", :controller => "offers", :action => "destroy"
  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "users#index"
  # Routes for the Saved_contact resource:
  # CREATE
  get "/saved_contacts/new", :controller => "saved_contacts", :action => "new"
  post "/create_saved_contact", :controller => "saved_contacts", :action => "create"

  # READ
  get "/saved_contacts", :controller => "saved_contacts", :action => "index"
  get "/saved_contacts/:id", :controller => "saved_contacts", :action => "show"

  # UPDATE
  get "/saved_contacts/:id/edit", :controller => "saved_contacts", :action => "edit"
  post "/update_saved_contact/:id", :controller => "saved_contacts", :action => "update"

  # DELETE
  get "/delete_saved_contact/:id", :controller => "saved_contacts", :action => "destroy"
  #------------------------------

  # Routes for the Saved_event resource:
  # CREATE
  get "/saved_events/new", :controller => "saved_events", :action => "new"
  post "/create_saved_event", :controller => "saved_events", :action => "create"

  # READ
  get "/saved_events", :controller => "saved_events", :action => "index"
  get "/saved_events/:id", :controller => "saved_events", :action => "show"

  # UPDATE
  get "/saved_events/:id/edit", :controller => "saved_events", :action => "edit"
  post "/update_saved_event/:id", :controller => "saved_events", :action => "update"

  # DELETE
  get "/delete_saved_event/:id", :controller => "saved_events", :action => "destroy"
  #------------------------------

  # Routes for the Saved_job resource:
  # CREATE
  get "/saved_jobs/new", :controller => "saved_jobs", :action => "new"
  post "/create_saved_job", :controller => "saved_jobs", :action => "create"

  # READ
  get "/saved_jobs", :controller => "saved_jobs", :action => "index"
  get "/saved_jobs/:id", :controller => "saved_jobs", :action => "show"

  # UPDATE
  get "/saved_jobs/:id/edit", :controller => "saved_jobs", :action => "edit"
  post "/update_saved_job/:id", :controller => "saved_jobs", :action => "update"

  # DELETE
  get "/delete_saved_job/:id", :controller => "saved_jobs", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Event resource:
  # CREATE
  get "/events/new", :controller => "events", :action => "new"
  post "/create_event", :controller => "events", :action => "create"

  # READ
  get "/events", :controller => "events", :action => "index"
  get "/events/:id", :controller => "events", :action => "show"

  # UPDATE
  get "/events/:id/edit", :controller => "events", :action => "edit"
  post "/update_event/:id", :controller => "events", :action => "update"

  # DELETE
  get "/delete_event/:id", :controller => "events", :action => "destroy"
  #------------------------------

  # Routes for the Job resource:
  # CREATE
  get "/jobs/new", :controller => "jobs", :action => "new"
  post "/create_job", :controller => "jobs", :action => "create"

  # READ
  get "/jobs", :controller => "jobs", :action => "index"
  get "/jobs/:id", :controller => "jobs", :action => "show"

  # UPDATE
  get "/jobs/:id/edit", :controller => "jobs", :action => "edit"
  post "/update_job/:id", :controller => "jobs", :action => "update"

  # DELETE
  get "/delete_job/:id", :controller => "jobs", :action => "destroy"
  #------------------------------

  # Routes for the Student resource:
  # CREATE
  get "/students/new", :controller => "students", :action => "new"
  post "/create_student", :controller => "students", :action => "create"

  # READ
  get "/students", :controller => "students", :action => "index"
  get "/students/:id", :controller => "students", :action => "show"

  # UPDATE
  get "/students/:id/edit", :controller => "students", :action => "edit"
  post "/update_student/:id", :controller => "students", :action => "update"

  # DELETE
  get "/delete_student/:id", :controller => "students", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
