# == Schema Information
#
# Table name: schools
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  contact_email :string           not null
#  pitch         :string
#  subdomain     :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_schools_on_name       (name)
#  index_schools_on_subdomain  (subdomain) UNIQUE
#

class School < ActiveRecord::Base
  validates :name, :subdomain, :contact_email, presence: true
  validates :contact_email, uniqueness: { case_sensitive: false },
            format: /\A(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Z‌​a-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}\z/i

  has_many :courses
end
