require_relative 'lib/lib'
require 'phraseapp-rest'

phrase_key     = File.open("#{__dir__}/secrets/.phrase").read.strip!
sheet_title    = 'phrase-translations'
project_name   = 'Provider Email'
sheet          = Spreadsheet.new(title: sheet_title)
rows           = sheet.tab(title: project_name)

locale_name    = 'de_en'

Phraseapp::Rest.configure do |config|
  config.token = phrase_key
end
api      = Phraseapp::Rest::Factory.api
projects = Phraseapp::Rest::Resource::Project.new(client: api)
project  = projects.list.detect{|p| p[:name] == project_name }
if project.nil?
  raise "Project with name [#{project_name}] not found"
end
puts "project: #{project[:id]} / updated_at: #{project[:updated_at]} / name: #{project[:name]}"

locales = Phraseapp::Rest::Resource::Locale.new(client: api, project_id: project[:id])
locale  = locales.list.detect{|l| l[:name] == locale_name }
if locale.nil?
  raise "Locale [#{locale_name}] not found in Phrase project: #{project[:id]}"
end
puts "locale:  #{locale[:id]} / updated_at: #{locale[:updated_at]} / name: #{locale[:name]}"
puts locales.download(id: locale[:id])

# rows.each do |row|
#   puts row[:key_name]
# end
