class Event < ApplicationRecord
  # Direct associations

  has_many   :saved_events,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
