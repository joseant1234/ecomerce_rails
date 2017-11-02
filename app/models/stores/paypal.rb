class Stores::Paypal
	include PayPal::SDK::REST
	attr_accessor :payment, :total, :return_url, :cancel_url, :items

	#constructor, se ejecuta cuando instancia la clase
	def initialize(total,items,options={})
		self.total = total
		self.items = items
		
		#{return_url: "/checkout", cancel_url: "/carrito"}
		options.each do |clave, valor|
			#crea o declara una  variable dinamica con el nombre clave y con el valor del parametro valor
			#pone como variable de clase para que pueda ser usado x cualquier metodo de la clase paypal.rb
			instance_variable_set("@#{clave}",valor)
			#@return_url = "/checkout"
			#@cancel_url = "/carrito"
		end
		
	end

	def process_payment
		self.payment = Payment.new(payment_options)
		self.payment
	end

	def process_card(card_data)
		options = payment_options
		options[:payer][:payment_method] = "credit_card"
		options[:payer][:funding_instruments] = [{
			credit_card: {
				type: CreditCardValidator::Validator.card_type(card_data[:number]),
				number: card_data[:number],
				expire_month: card_data[:expire_month],
				expire_year: card_data[:expire_year],
				cvv2: card_data[:cvv2]

			}
		}]
		self.payment = Payment.new(options)
		self.payment
	end

	def payment_options
		#el valor price debe ser el mismo q el de total, sino paypal manda un error
		#url return_url: luego del usuario halla hecho la compra
		#url cancel_url si la compra fue cancelada
		{
			intent: "sale",
			payer:{
				payment_method: "paypal"
			},
			transactions: [
				{
					item_list:{
						items: self.items
					},
					amount:{
						total: (self.total / 100),
						currency: "USD"
					},
					description: "Compra de tus productos en la plataforma"
				}
			],
			redirect_urls: {
				return_url: @return_url,
				cancel_url: @cancel_url
			}
		}
	end

	def self.get_email(payment_id)
		payment = Payment.find(payment_id)
		payment.payer.payer_info.email

	end
	# con el simbolo & se manda un bloque como parametro al metodo
	def self.checkout(payer_id,payment_id,&block)
		payment = Payment.find(payment_id)
		payment.payer.payer_info.email
		if payment.execute(payer_id: payer_id)
			yield if block_given?
		end		
	end

	# al ejecutar el metodo se pasa un bloque, el cual es ejecutado en el metodo a traves de la palabra yield
	#checkout(params[:PayerId],params[:PaypalId]) do
	#	puts "Pago procesado"
	#end
end
