class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :product, index: true
      t.attachment :archivo

      t.timestamps
    end
  end
end
