class Comment < ActiveRecord::Base
  belongs_to :slide
  belongs_to :pdf_file
end
