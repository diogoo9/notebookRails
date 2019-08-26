class Contact < ActiveRecord::Base
  belongs_to :kind
  has_one :address
  has_many :phones 

  accepts_nested_attributes_for :address
  #has_many plural
  accepts_nested_attributes_for :phones
end
