# Solution for Challenge: Scraping HN 1: Building Objects. Started 2013-05-22T14:24:03+00:00
require 'nokogiri'

class Post

  attr_accessor :comment_array,:title, :url, :points, :item_id

  def initialize
    @title = ""
    @url = ""
    @points = ""
    @item_id = ""
    @comment_array = []
  end

  def comments
    puts "Title: #{title}"
    puts "Url: #{url.to_s}"
    puts "Points: #{points}"
    puts "Item Id: #{item_id.to_s}"
    puts "Comment count: #{num_comments}"
    puts "-" * 80
    @comment_array.each do |comment|
      puts "User: #{comment.user}"
      puts "Comment: #{comment.comment_text}"
      puts "-" * 80
    end
  end

  def add_comments(parser)
    @comment_array = parser.create_comment_array
  end

  def num_comments
    @comment_array.size
  end

end

class Comment

  attr_reader :user, :comment_text

  def initialize(comment_text, user)
    @comment_text = comment_text
    @user = user
  end
end

class Parser
  attr_reader :webpage , :page
  def initialize(webpage)
    @webpage = webpage
    @page = nil
  end

  def create_nokogiri_object
    @page = Nokogiri::HTML(File.open(@webpage))
  end

  def create_comment_array
    comment_array = []
    comment_count = @page.css('.comment > font:first-child').size
    comment_count.times do |element|
      comment_text = @page.css('.comment > font:first-child')[element].inner_text
      user = @page.css('.comhead > a:first-child')[element].inner_text
      comment_array << Comment.new(comment_text, user)
    end
    comment_array
  end

  def create_post(post)
    post.title = @page.css('title').text
    post.url = @page.search('.title > a:first-child').map {|link| link['href']}
    post.points = @page.search('.subtext > span:first-child').text
    post.item_id = @page.search('.subtext > a:nth-child(3)').map {|element| element.get_attribute('href')}
  end

end

#-------------------------------------------------------------------------------
# Instantiate a Post object
# Parse the Hacker News HTML
# Create a new comment object for each comment in the HTML, adding it to the Post object
# post_3.html

test = Parser.new('post_3.html')
test.create_nokogiri_object
new_post = Post.new
test.create_post(new_post)
new_post.add_comments(test)
new_post.comments


# Solution for Challenge: Scraping HN 1: Building Objects. Started 2013-05-22T21:15:21+00:00
