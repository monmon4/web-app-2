class CommentsController < ApplicationController
	before_action :set_slide, only: [:create]
	def create
		@comment= @slide.comments.new(comment_params)
		if @comment.save
			redirect_to pdf_file_slide_path({id: comment_parent[:slide_id],pdf_file_id: comment_parent[:pdf_file_id]}),
			 notice: "comment successfully added!"
		else
			redirect_to pdf_files_path, alert:"failed to add comment!"
		end
	end

	private
	def set_slide
		@slide=Slide.find(params[:slide_id])
	end
	def comment_params
		params.require(:comment).permit(:comment)
	end
	def comment_parent
		params.permit(:pdf_file_id, :slide_id)
	end

end
