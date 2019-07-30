# frozen_string_literal: true

module ApplicationHelper
	def get_api(a)
  i = 0
  t = []
  search = a.to_s
  url = "https://trouver.datasud.fr/api/3/action/package_search?q=#{search}"
  response = HTTParty.get(url)
  data = response.parsed_response["result"]["results"]
  puts data.length
  while i < data.length
    t << data[i]["name"]
    t2 << data[i]["type"]
    i = i + 1
  end
  
  return t
end
end
