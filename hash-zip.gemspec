require "pathname"
Gem::Specification.new do |s|
  s.name         = "hash-zip"
  s.version      = "0.2.20230803"
  s.date         = "2023-08-03"
  s.summary      = "Hash#zip and Hash#zip_compact methods"
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
