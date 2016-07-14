class Restaurant < ActiveRecord::Base

	extend WithUserAssociationExtension

	has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

	belongs_to :user

	validates :name, length: { minimum: 3 }, uniqueness: true

end
