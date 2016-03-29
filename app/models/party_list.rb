class PartyList < ActiveRecord::Base
	has_many :candidates
	has_many :votes
	validates :name, presence: true, uniqueness: true
	has_attached_file :avatar,
                   styles: {
                     medium: '300x300>',
                     thumb: '100x100>'
                   }                    

 validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}
 validates_with AttachmentSizeValidator, attributes: :avatar,
                                         less_than: 2.megabytes
end
