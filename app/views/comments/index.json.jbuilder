json.array!(@comments) do |comment|
  json.extract! comment, :id, :comment, :pdf_file_id, :slide_id
  json.url comment_url(comment, format: :json)
end
