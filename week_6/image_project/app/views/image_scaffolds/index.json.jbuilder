json.array!(@image_scaffolds) do |image_scaffold|
  json.extract! image_scaffold, :id, :title, :description, :image
  json.url image_scaffold_url(image_scaffold, format: :json)
end
