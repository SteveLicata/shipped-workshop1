class Boat < ApplicationRecord
# boat associations
  belongs_to :company
  has_and_belongs_to_many :jobs
# boat validation
  validates :name, uniqueness: true

# boat paperclip
  has_attached_file :image,
  :styles => { :medium => "300x300px>", :thumb => "100x100px>" },
  :default_url => "/assets/default_boat.jpg"
# boat validation
  validates_attachment_content_type :image,
    :content_type => /\Aimage\/.*\Z/

end
