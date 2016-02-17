json.array!(@slides) do |slide|
  json.extract! slide, :id, :title, :likes, :PdfFile_id
  json.url slide_url(slide, format: :json)
end
