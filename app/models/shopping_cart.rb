# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :string
#  ip         :string
#  created_at :datetime
#  updated_at :datetime
#

class ShoppingCart < ActiveRecord::Base
	#through es a traves de la relacion q se va encontrar los products
	has_many :products, through: :in_shopping_carts
	has_many :in_shopping_carts
	#se puede hacer directo porque en MyPayment tiene una relacion que guarda el shoppingCart
	has_many :my_payments

	include AASM
	aasm column: "status" do
		state :created, initial: true
		state :payed
		state :failed

		event :pay do
			after do
				#MANDAR LOS ARCHIVOS QUE EL USUARIO COMPRO
				self.generate_links()
			end
			transitions from: :created, to: :payed
		end
		
	end
	
	#status = 0 , status = 1
	#enum status: {payed: 1, default: 0}
	#ShoppingCart.payed muestra todas las carritos de compra pagadas
	#ShoppingCart.find(1).payed! actualiza el carrito de compra a pagado

	def payment
		begin
			#si no hay payed envia un arreglo vacio y al realiza un metodo sobre un nil muestra error, para eso se utiliza rescue
			#es el shoppingCart.my_payments
			my_payments.payed.first
			#cualquier error se maneja a traves de una exception
		rescue Exception => e
			return nil
		end
	end

	def generate_links
		#genera un link por cada producto dentro del carrito de compra
		self.products.each do |product|
			#payment es el metodo
			Link.create(expiration_date: DateTime.now + 7.days, product: product, email: payment.email)
		end
	end

	def items
		#map return un arreglo con lo que se pase en el bloque
		self.products.map{ |product| product.paypal_form }
	end

	def total
		#SUMA A TRAVES DE SQL
		products.sum(:pricing)
	end
end
