class Course
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :content, type: String
  field :duration, type: String
  field :price, type: BigDecimal

  belongs_to :school
end
