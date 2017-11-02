class EmailsController < ApplicationController
  def create
  	@email = MyEmail.new(email: params[:email])
  	if @email.save
  		#render json serializa el objeto @email a JSON, poner a una estructura JSON
  		render json: @email
  	else
  		render json: @email.errors, status: :unprocessable_entity
  	end
  end
end
	