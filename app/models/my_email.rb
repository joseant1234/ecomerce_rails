# == Schema Information
#
# Table name: my_emails
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  state      :integer
#  created_at :datetime
#  updated_at :datetime
#

class MyEmail < ActiveRecord::Base
	validates_presence_of :email, message: "Woop! Parece que olvidastes colocar el correo"
	validates_uniqueness_of :email, message: "Este correo ya fue registrado"

	validates_format_of :email, with: Devise::email_regexp, message: "No enviastas un correo"
end
