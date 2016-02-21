class CommentsController < ApplicationController
	def create
		if comment_parent[:slide_id] != nil
			@comment= Slide.find_by(id: comment_parent[:slide_id]).comments.new(comment_params)
			
				if @comment.save
					redirect_to pdf_file_slide_path({id: comment_parent[:slide_id],pdf_file_id: comment_parent[:pdf_file_id]}), notice: "comment successfully added!"
				else
					redirect_to pdf_files_path, alert: "unable to add comment!"
				end
		else
				if comment_parent[:pdf_file_id] != nil
					@comment= PdfFile.find_by(id: comment_parent[:pdf_file_id]).comments.new(comment_params)
					
					if @comment.save
						redirect_to pdf_file_slides_path({id: comment_parent[:pdf_file_id]}), notice: "comment successfully added!"
					else
						redirect_to pdf_files_path, alert: "unable to add comment!"
					end
				else
					redirect_to pdf_files_path, alert:  "unable to add comment!"
				end
		end
	end

	def destroy
	end

	private

	def comment_parent
		params.permit(:pdf_file_id, :slide_id)
	end

	def comment_params
		params.require(:comment).permit(:comment)
	end

end



