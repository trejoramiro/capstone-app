json.data @data.each do |row|
  json.id row["id"]
  json.lat row["lat"]
  json.lng row["lng"]
end
