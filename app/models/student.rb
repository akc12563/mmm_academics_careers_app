class Student < ApplicationRecord
  # Direct associations

  has_many   :saved_contacts,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
