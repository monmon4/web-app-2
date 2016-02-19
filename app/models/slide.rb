class Slide < ActiveRecord::Base
  belongs_to :pdf_file
  has_and_belongs_to_many :accounts
  has_many :comments
  
  def next 
  	pdf_file.slides.where("id > ?", id).order("id ASC").first
  end

  def prev
  	pdf_file.slides.where("id < ?", id).order("id DESC").first
  end
  

end
