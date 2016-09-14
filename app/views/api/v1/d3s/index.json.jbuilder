json.children @venues.each do |venue|
  json.packageName venue["packageName"]
  json.className venue["name"]
  json.value venue["distance"]
  json.rating venue["rating"]
  json.value2 venue["value2"]
  json.lat venue["lat"]
  json.lng venue["lng"]
  json.location venue["location"]
end
