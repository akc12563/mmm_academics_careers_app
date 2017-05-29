class AddPriorIndustryToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :prior_industry, :string
  end
end
