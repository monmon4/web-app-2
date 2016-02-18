class Slide < ActiveRecord::Base
  belongs_to :pdf_file
  has_and_belongs_to_many :accounts
  has_many :comments, dependent: :destroy
end
