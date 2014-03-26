class AddAttachmentImageToTins < ActiveRecord::Migration
  def self.up
    change_table :tins do |t|
    	t.attachment :image
    end
  end

  def self.down
    drop_attached_file :tins, :image
  end
end