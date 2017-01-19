class Boat < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :jobs

  has_attached_file :image,
  :styles => { :medium => "300x300px>", :thumb => "100x100px>" },
  :default_url => "/assets/default_boat.jpg"

  validates_attachment_content_type :image,
    :content_type => /\Aimage\/.*\Z/

end
