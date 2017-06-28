require "pathname"
Gem::Specification.new do |s|
  s.name         = "hash-zip"
  s.version      = "0.1.20170628"
  s.date         = "2017-06-28"
  s.summary      = "Hash#zip method"
  s.description  = "Zip two or more Hashes"
  s.authors      = ["Tomasz Wegrzanowski"]
  s.email        = "Tomasz.Wegrzanowski@gmail.com"
  s.files        = %W[Rakefile .rspec lib spec README.md].map{|x| Pathname(x).find.to_a.select(&:file?)}.flatten.map(&:to_s)
  s.homepage     = "https://github.com/taw/hash-zip"
  s.license      = "MIT"
  # development
  s.add_development_dependency "pry"
  # tests
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
