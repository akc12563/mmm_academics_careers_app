class User < ApplicationRecord
  # Direct associations

  has_many   :saved_events,
             :dependent => :destroy

  has_many   :bookmark_jobs,
             :class_name => "SavedJob",
             :dependent => :destroy

  has_many  :saved_contacts_as_self,
            :class_name => "SavedContact",
            :foreign_key => "self_id",
            :dependent => :destroy

  has_many  :saved_contacts_as_other,
            :class_name => "SavedContact",
            :foreign_key => "contact_id",
            :dependent => :destroy

  has_many  :offers,
            :dependent => :destroy

  # Indirect associations
  has_many :contacts, :through => :saved_contacts_as_self, :source => :other_user
  has_many :self_users, :through => :saved_contacts_as_other, :source => :self_user

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Carrierwave image uploader mount
   mount_uploader :photo, PhotoUploader
end
