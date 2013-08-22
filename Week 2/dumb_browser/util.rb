require 'net/http'
require 'nokogiri'

module Page

  def parse_input
    uri = URI.parse(@input)
    response = Net::HTTP.get_response(uri)
    if response.body.length == 0
      puts "Input is invalid - Please give me something I can work with."
    else
      @page = Nokogiri::HTML::Document.parse(response.body)
    end
  end

  def display_page_info
    page_info = ""
    page_info << "Title: #{display_title}\n"
    page_info << "Word Count: #{word_count}\n"
    page_info << "Links: \n"
    display_links.each_with_index do |link, index|
      page_info << "#{index+1}. #{link}\n"
    end
    puts page_info
  end

  def display_prompt
    puts "What URL do you want to see in this super smart browser?"
    @input = gets.chomp
  end

  def display_title
    @page.css('title').inner_text
  end

  def display_links
    news_links = @page.css("a").map { |link| link['href'] }.compact
    http_links = news_links.select { |link| link =~ /http.+/ }
  end

  def word_count
    @page.search('body p').inject(0) { |words, p_tag| words + p_tag.inner_text.length }
  end

end

#toy code
# uri = URI.parse("http://www.flickr.com/")
# response = Net::HTTP.get_response(uri)
# first_response = response.body
# #p response.body

# doc = Nokogiri::HTML::Document.parse(response.body)
# puts doc.css('title').inner_text
# news_links = doc.css("a").select { |link| link }
# news_links.each{ |link| puts link['href']}


#end toycode
