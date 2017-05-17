class SavedEvent < ApplicationRecord
  # Direct associations

  belongs_to :event,
             :counter_cache => true

  # Indirect associations

  # Validations

end
