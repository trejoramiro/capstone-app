json.children @venues.each do |venue|
  json.packageName venue["packageName"]
  json.className venue["name"]
  json.value venue["distance"]
end
