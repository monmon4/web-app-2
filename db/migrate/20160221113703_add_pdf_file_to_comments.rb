class AddPdfFileToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :pdf_file, index: true, foreign_key: true
    
  end
end
