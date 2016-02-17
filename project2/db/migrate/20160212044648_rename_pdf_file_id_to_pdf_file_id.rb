class RenamePdfFileIdToPdfFileId < ActiveRecord::Migration
  def change
  	rename_column :slides, :PdfFile_id, :pdf_file_id
  end
end
