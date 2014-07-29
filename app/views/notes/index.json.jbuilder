json.array!(@notes) do |note|
  json.extract! note, :id, :note, :references, :
  json.url note_url(note, format: :json)
end
