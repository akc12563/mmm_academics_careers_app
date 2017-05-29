class AddPriorPositionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :prior_position, :string
  end
end
