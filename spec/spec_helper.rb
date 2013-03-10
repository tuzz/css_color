require "rspec"
require "css_color"

def p(string)
  CSSColor.parse(string).html
end
