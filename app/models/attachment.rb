# == Schema Information
#
# Table name: attachments
#
#  id                   :integer          not null, primary key
#  product_id           :integer
#  archivo_file_name    :string
#  archivo_content_type :string
#  archivo_file_size    :integer
#  archivo_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

class Attachment < ActiveRecord::Base
  belongs_to :product

  # Metodo de paperclip que valida que halla un campo llamado archivo y que tenga un archivo adjunto.
  # tiene q haber un archivo adjunto con el registro almacenado en la BD.
  validates :archivo, attachment_presence: true
  # en el path se puede colocar atributos
  # atributo :attachment es el nombre de la propiedad en este caso es archivo
  has_attached_file :archivo, path: ":rails_root/archivos/:id/:style/:filename"

  #paperclip no valida el tipo de archivo
  do_not_validate_attachment_file_type :archivo

  
end
