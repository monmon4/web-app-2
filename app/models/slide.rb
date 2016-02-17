class Slide < ActiveRecord::Base
  belongs_to :pdf_file
  has_many :comments, dependent: :destroy
end
