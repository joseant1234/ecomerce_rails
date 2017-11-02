#direccion donde esta el servidor de mail
#tipo de autenticacion puede ser plain, login
ActionMailer::Base.smtp_settings = {
	address: "smtrp.gmail.com",
	port: 587,
	domain: "gmail.com",
	user_name: "aa@gmail.com",
	password: "asdqwe",
	authentication: :login,
	enable_starttls_auto: true
}