class RemoveInternshipCompanyFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :internship_company, :string
  end
end
