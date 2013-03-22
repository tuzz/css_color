Gem::Specification.new do |s|
  s.name        = "css_color"
  s.version     = "1.0.1"
  s.summary     = "CSS Color"
  s.description = "Make sense of any css color string."
  s.author      = "Chris Patuzzo"
  s.email       = "chris@patuzzo.co.uk"
  s.homepage    = "https://github.com/tuzz/css_color"
  s.files       = ["README.md"] + Dir["lib/**/*.*"]

  s.add_dependency "color"
  s.add_development_dependency "rspec"
end
