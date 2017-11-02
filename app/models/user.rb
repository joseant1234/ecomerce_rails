# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products

  def orders
  	#muestro los productos que no tenga usuarios, por eso es left join, sino seria joins(:users)
  	#self.id es el id del objeto que se esta utilizando
  	#el where sería where(users.id = ?), solo que con where(users: {id: self.id, aa: aaa}) se puede pasar otras condiciones
  	MyPayment.joins(:products)
  		.joins("LEFT JOIN users ON products.user_id = users.id")
  		.where(users: {id: self.id})
  end
end
