source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '4.1.8'
gem 'rails', '4.2.5.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

#SEGURIDAD
gem 'devise'
gem 'haml-rails'
gem 'bootstrap-sass'
gem 'bootstrap-material-design'

group :production do
	gem 'mysql2', '~>0.3.9'
	#para funcion en production con uglifier
	gem 'therubyracer'
end

#PRUEBAS
group :development, :test do 
	gem 'shoulda-matchers'
	gem 'rspec-rails'
	gem 'factory_girl_rails'
	#Anotacion de los modelos
	gem 'annotate'
	#abre los correos en un navegador, agarra los correos que se manda desde el actionMailer y lo muestra en el navegador
	gem 'letter_opener'
end
gem 'paperclip'
#PAYPAL SDK
gem 'paypal-sdk-rest'
#para crear maqinas de estado
gem 'aasm'
#Credit card validator, para validar datos de la  tarjeta  como los digitos del numero, la fecha de expiracion, digitos cvc
#identifica el tipo de tarjeta de acuerdo a los digitos de la tarjeta
gem 'credit_card_validator'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]
