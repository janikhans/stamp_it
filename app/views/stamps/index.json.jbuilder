json.array!(@stamps) do |stamp|
  json.extract! stamp, :id, :user_id, :speaker, :spoken_date, :completion_date, :outcome, :proof, :quote, :completed_at
  json.url stamp_url(stamp, format: :json)
end
