class AddBookmarkJobCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bookmark_jobs_count, :integer
  end
end
