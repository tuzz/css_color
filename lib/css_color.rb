require "color"
require "color/css"

class CSSColor

  def self.parse(string)

    case string
    when /#/
      Color::RGB.from_html(string)
    when /%/
      integers = extract(string, max = 100)
      Color::RGB.from_percentage(*integers)
    when /rgb/i
      integers = extract(string, max = 255)
      Color::RGB.new(*integers)
    else
      Color::CSS[string]
    end or raise ArgumentError

  rescue ArgumentError

    raise UnknownColorError.new(
      "Couldn't make sense of #{string.inspect}"
    )

  end

  private
  def self.extract(string, max)
    integers = string.scan(/-?\d+/).map(&:to_i)

    raise ArgumentError unless integers.size == 3
    raise ArgumentError unless integers.all? { |i| (0..max).include?(i) }

    integers
  end

  class UnknownColorError < ArgumentError; end

end
