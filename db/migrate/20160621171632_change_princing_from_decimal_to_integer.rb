class ChangePrincingFromDecimalToInteger < ActiveRecord::Migration
  def change
  	change_column :products, :pricing, :integer
  end
end
