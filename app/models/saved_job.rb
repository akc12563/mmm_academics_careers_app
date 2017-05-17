class SavedJob < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => :bookmark_jobs_count

  belongs_to :job,
             :counter_cache => :bookmark_jobs_count

  # Indirect associations

  # Validations

end
