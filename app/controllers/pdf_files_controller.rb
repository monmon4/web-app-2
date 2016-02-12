class PdfFilesController < ApplicationController
  def index
  	@pdf_file =PdfFile.all
   end

  def new
  	@pdf_file =PdfFile.new
   end

  def create
  	@pdf_file =PdfFile.new(pdf_file_params)
   
    if @pdf_file.save
       pdf = Magick::ImageList.new("public#{@pdf_file.attachment}")
      pdf.each_with_index do |img, i|
        img.write "app/assets/images/#{@pdf_file.name}_#{i}.jpg"
        @pdf_file.slides.create(title: "#{@pdf_file.name}_#{i}.jpg", likes: 0)
      end
    redirect_to pdf_files_path, notice: "The pdf_file #{@pdf_file.name} has been uploaded."
     else
      render "new"
    end
  end

  def destroy
  	@pdf_file =PdfFile.find(params[:id])
    @pdf_file.destroy
    redirect_to pdf_files_path, notice: "The pdf_file #{@pdf_file.name} has been deleted."
   end

private
  def pdf_file_params
  	params.require(:pdf_file).permit(:name, :attachment)
  end
end
