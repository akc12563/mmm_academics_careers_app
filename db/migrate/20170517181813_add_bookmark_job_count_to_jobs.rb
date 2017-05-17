class AddBookmarkJobCountToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :bookmark_jobs_count, :integer
  end
end
