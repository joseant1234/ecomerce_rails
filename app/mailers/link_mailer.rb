class LinkMailer < ActionMailer::Base
	default from: "donwload@tiendus.com"

	def download_link(link)
		@link = link
		@product = link.product
		mail(to: link.email, subject: "Descarga los productos que adquiristes en tiendus")

	end
end