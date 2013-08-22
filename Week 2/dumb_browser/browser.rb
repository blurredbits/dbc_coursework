require_relative 'util'

class Browser

  include Page

  def run!
    display_prompt
    parse_input
    display_page_info
  end

end

Browser.new.run!
