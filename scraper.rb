# This is a template for a Ruby scraper on Morph (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new

# Read in a page
page = agent.get("http://www.edinburgh.gov.uk/councillors/name")

# Find something on the page using css selectors
people = page.search('div[@class="info"]')

# Write out to the sqlite database using scraperwiki library
people.each do |x|
  link = x.search('h3/a/@href').text
  name = x.search('h3/a').text
  ScraperWiki.save_sqlite(["name","link"], {"name" => name, "link" => link})
end
