class RenamePdfFileIdToPdfFileId < ActiveRecord::Migration
  def change
  	rename_column :PdfFile, :PdfFile_id, :pdf_file_id
  end
end
