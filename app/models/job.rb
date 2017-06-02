class Job < ApplicationRecord
  # Direct associations
  belongs_to :user

  has_many   :bookmark_jobs,
             :class_name => "SavedJob",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
