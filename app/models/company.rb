class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
# company association
  has_many :boats
# company paperclip
  has_attached_file :image,
    :styles => { :medium => "300x300px>", :thumb => "100x100px>" },
    :default_url => "/assets/default_company.jpg"

  validates_attachment_content_type :image,
    :content_type => /\Aimage\/.*\Z/
end
