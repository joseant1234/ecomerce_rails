module ControllerMacros
	def login_user
		#el bloque este esta dentro de before :each se ejecute x cada una de las pruebas. En un context hay mas de una prueba, x cada prueba se ejecutará el login_user
		before :each do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryGirl.create(:user, email: "jaja@hotmail.com")
			#loguear al usuario
			sign_in user
		end
	end
end