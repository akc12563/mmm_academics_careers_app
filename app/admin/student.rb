ActiveAdmin.register Student do

 permit_params :first_name, :last_name, :grad_year, :internship_company, :internship_location, :internship_position, :full_time_company, :full_time_position, :full_time_location, :current_status, :email

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
