class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  has_many :students, dependent: :destroy

  validates :name, :email, :pitch, :subdomain, presence: true
  validates_uniqueness_of :name, :email, :subdomain
  validates_format_of :subdomain, with: /[A-z\d]*.[A-z\d]*\.edools.com/
  has_attached_file :image, :styles => { :medium => "150x150>", :thumb => "120x90#" }
  validates_attachment :image, :presence => true

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
