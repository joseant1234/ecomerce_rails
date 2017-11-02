class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_shopping_cart

  private
  	#en ruby las clases pueden acceder a las variables de clase de la clase
  	def set_shopping_cart  	
  		#si no hay un carrito de compras en la computadora del cliente
  		if cookies[:shopping_cart_id].blank?
  			@shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
  			cookies[:shopping_cart_id] = @shopping_cart.id
  		else
  			@shopping_cart = ShoppingCart.find(cookies[:shopping_cart_id])
  		end
  		# permite gestionar un error tras una excepcion, 
      # por ejemplo que se elimine un registro y que se quiera acceder a este con find, la bd no lo va encontrar mostrando un error de no encontrar el registro
  		rescue ActiveRecord::RecordNotFound => e 
  			@shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
  			cookies[:shopping_cart_id] = @shopping_cart.id
  	end
end
