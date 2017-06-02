class Event < ApplicationRecord
  # Direct associations
  belongs_to :user

  has_many   :saved_events,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
