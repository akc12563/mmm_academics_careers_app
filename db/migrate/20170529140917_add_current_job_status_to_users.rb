class AddCurrentJobStatusToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_job_status, :string
  end
end
