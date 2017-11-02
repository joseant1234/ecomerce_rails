class CreateMyEmails < ActiveRecord::Migration
  def change
    create_table :my_emails do |t|
      t.string :email
      t.string :ip
      t.integer :state

      t.timestamps
    end
  end
end
