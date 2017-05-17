class SavedContact < ApplicationRecord
  # Direct associations

  belongs_to :student,
             :counter_cache => true

  # Indirect associations

  # Validations

end
