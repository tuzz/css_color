## CSS Color

Make sense of any css color string.

The [color gem](https://rubygems.org/gems/color) is fantastic, but it is a requirement that you know what type of color you're parsing: `#fff`, `blue`, `rgb(0, 0, 0)`

This gem handles that requirement for you:

```ruby
require "css_color"

CSSColor.parse("#fff")
#=> RGB [#ffffff]

CSSColor.parse("blue")
#=> RGB [#0000ff]

CSSColor.parse("rgb(0, 0, 0)")
#=> RGB [#000000]

CSSColor.parse("rgb(50%, 50%, 50%)")
#=> RGB [#808080]
```

The return type is an instance of the `Color` class, which has a rich feature set.

This gem aims to comply with the color grammar defined [here](http://www.w3.org/TR/SVG/types.html#DataTypeColor).

RGBA, HSL and HSLA are not part of this specification. You're welcome to implement them and send a pull request.
