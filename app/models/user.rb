class User < ApplicationRecord
  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  belongs_to :company
  has_many :issues
  has_many :interventions
  
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  mount_uploader :picture, PictureUploader

  def csv
    CSV.generate do |csv|
      csv << %w{ user_id user_firstname user_lastname user_email }
      csv << [ self.id, self.firstname, self.lastname, self.email ]
    end
  end

end
