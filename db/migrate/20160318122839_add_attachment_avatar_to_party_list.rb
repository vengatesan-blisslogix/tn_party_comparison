class AddAttachmentAvatarToPartyList < ActiveRecord::Migration
  def self.up
   change_table :party_lists do |t|
     t.attachment :avatar
   end
 end

 def self.down
   remove_attachment :party_lists, :avatar
 end
end
