class Dogs::Scraper
  attr_accessor :popularity, :name

  def self.scrape_dogs

    doc = Nokogiri::HTML(open("http://www.dogbreedslist.info/family-dog-breeds/#.Wotwi6inFPa"))

    doc.search("div.main-r")
    name = doc.css(".right-t").text
    popularity = doc.css(".pop p").text
    Dogs::DogsPopularity.new(name, popularity)

  end

end
