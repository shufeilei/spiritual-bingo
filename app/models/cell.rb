class Cell < ApplicationRecord
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize: "200x200"
  end

  validates :response, presence: true

  belongs_to :board

  acts_as_commontable
end
