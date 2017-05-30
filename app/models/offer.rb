class Offer < ApplicationRecord

  belongs_to :user

  validate :single_accepted

  def single_accepted
    other_accepted_internships = user.offers.where(intern_fulltime: true, status: "1").count > 0
    other_accepted_fulltime = user.offers.where(intern_fulltime: false, status: "1").any?
    if (intern_fulltime == true && status == "1" && other_accepted_internships) || (intern_fulltime == false && status == "1" && other_accepted_fulltime)
      errors.add(:base, 'you can only have 1 accepted offer')
    end
  end

  # def accepted?
  #   status == '1'
  # end
end
