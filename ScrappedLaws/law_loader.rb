require 'json'
# params: file_name law_id

file_name = ARGV[0]
law_id = ARGV[1]

file = File.read(file_name)
data_hash = JSON.parse(file)

for i in 0..data_hash["items"].size - 1
  if data_hash["items"][i]["type"] == "article"
    number = data_hash["items"][i]["number"]
    body = data_hash["items"][i]["body"]
    Article.create(position: i, number: number, body: body, law_id: law_id)
  end
  if data_hash["items"][i]["type"] == "chapter"
    number = data_hash["items"][i]["number"]
    name = data_hash["items"][i]["name"]
    Chapter.create(position: i, number: number, name: name, law_id: law_id)
  end
  if data_hash["items"][i]["type"] == "title"
    number = data_hash["items"][i]["number"]
    name = data_hash["items"][i]["name"]
    Title.create(position: i, number: number, name: name, law_id: law_id)
  end
end