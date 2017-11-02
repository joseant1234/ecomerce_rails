class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      #scale cantidad de decimales, precision son 10 numero, 8 numeros q no son decimales q con scale dice q 2 son decimales
      t.decimal :pricing, scale: 2, precision: 10
      t.text :description
      t.references :user, index: true
      t.attachment :avatar

      t.timestamps
    end
  end
end
