class SavedContact < ApplicationRecord
  # Direct associations

  belongs_to :self_user, :class_name => "User", :foreign_key => "self_id"
  belongs_to :other_user, :class_name => "User", :foreign_key => "contact_id"
  # Indirect associations

  # Validations

end
