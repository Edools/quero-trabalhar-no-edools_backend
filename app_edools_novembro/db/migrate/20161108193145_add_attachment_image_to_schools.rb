class AddAttachmentImageToSchools < ActiveRecord::Migration
  def self.up
    change_table :schools do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :schools, :image
  end
end
