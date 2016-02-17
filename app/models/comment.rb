class Comment < ActiveRecord::Base
  belongs_to :pdf_file
  belongs_to :slide
end
