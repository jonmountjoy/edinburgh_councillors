# This is a template for a Ruby scraper on Morph (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new

# Read in a page
page = agent.get("http://www.edinburgh.gov.uk/councillors/name")

# Find something on the page using css selectors
people = page.search('//li/div/h3/a/node()').map(&:text)

# Write out to the sqlite database using scraperwiki library
people.each do |person|
  ScraperWiki.save_sqlite(["name"], {"name" => person})
end
