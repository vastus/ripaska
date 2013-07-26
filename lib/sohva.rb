require 'json'

require 'rest-client'

class Sohva

  DB = 'localhost:5984/blog'

  # param type(sym)  doc type
  # param view(sym)  doc view name
  def self.find_all(type, view)
    docs = RestClient.get self.view_uri(type, view)
    docs = JSON.parse(docs)
    docs["rows"].map {|row| row["value"]}
  end

  def self.find_one(type, prop, value)
    value = CGI.escape('"' + value + '"')
    doc = RestClient.get self.view_uri(type, :published) + "?key=#{value}"
    doc = JSON.parse(doc)
    doc["rows"].first["value"]
  end

  private
  def self.view_uri(type, view)
    "#{DB}/_design/#{type.to_s}/_view/#{view.to_s}"
  end

end

