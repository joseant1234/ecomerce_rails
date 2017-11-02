class LinkAttachment < ActiveRecord::Base
  belongs_to :link
  belongs_to :attachment
  before_create :set_defaults

  def is_invalid?
  	DateTime.now > self.expiration_date
  end

  private
  	def set_defaults
  		self.expiration_date = DateTime.now + 30.minutes
  	end
end
