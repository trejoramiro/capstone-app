json.array! @messages.each do |message|
  json.id message.id
  json.name message.user.username
  json.body message.content
end
