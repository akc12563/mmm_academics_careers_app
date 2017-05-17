class SavedJob < ApplicationRecord
  # Direct associations

  belongs_to :job,
             :counter_cache => :bookmark_jobs_count

  # Indirect associations

  # Validations

end
