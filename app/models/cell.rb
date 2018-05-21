class Cell < ApplicationRecord
  has_attached_file :picture,
                    source_file_options: { all: '-auto-orient' },
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"
                    
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates :response, presence: true

  acts_as_commontable

  belongs_to :board

end
