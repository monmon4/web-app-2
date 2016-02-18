class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  # GET /slides
  # GET /slides.json
  def index
    @slides = PdfFile.find(params[:pdf_file_id]).slides.paginate(page: params[:page], per_page: 10)
    @pdf_file = PdfFile.find(params[:pdf_file_id])
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
    
  end

  # GET /slides/new
  def new
    @slide = Slide.new
  end

  # GET /slides/1/edit
  def edit
  end

  # POST /slides
  # POST /slides.json
  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to @slide, notice: 'Slide was successfully created.' }
        format.json { render :show, status: :created, location: @slide }
      else
        format.html { render :new }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    if exist = current_user.slides.find_by(id: params[:id])
      current_user.slides.delete(exist)
    else
      current_user.slides<<Slide.find_by(id: params[:id])
    end
    Slide.find_by(id: params[:id]).update(likes: Slide.find_by(id: params[:id]).accounts.count )
    redirect_to pdf_file_slide_path
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to slides_url, notice: 'Slide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      params.require(:slide).permit(:title, :likes, :PdfFile_id)
    end
end
