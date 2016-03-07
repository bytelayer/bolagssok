require "open-uri"
require "json"

if ARGV.empty?
  abort("Usage: #$0 <company name>")
end

arg = ARGV.join(" ")
encoded_name = URI::encode(arg)

url = "http://localhost:3000/search?format=json&q=" + encoded_name
json = JSON.parse(open(url).read, {:quirks_mode => true})

if json.nil?
  puts "Company not found"
  exit 1
else
  puts json["number"]
end
