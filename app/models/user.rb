class User < ApplicationRecord
  # Direct associations

  has_many   :saved_contacts,
             :dependent => :destroy

  has_many   :saved_events,
             :dependent => :destroy

  has_many   :bookmark_jobs,
             :class_name => "SavedJob",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
