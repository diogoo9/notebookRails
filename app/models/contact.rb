class Contact < ActiveRecord::Base
  belongs_to :kind
  has_one :address
  has_many :phones 

  accepts_nested_attributes_for :address
  #has_many plural
  #reject_if para rejeitar o campo em branco do telefone e permitir apagar 
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: {minimum: 3}
end
