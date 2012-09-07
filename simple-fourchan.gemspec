# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simple-fourchan/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chim Kan"]
  gem.email         = ["designium@gmail.com"]
  gem.description   = "4chan is a gem that fetches posts from 4chan. Current version only fetches a specific listing now and it works only for READ. There's the 4chan.js that posts but the documentation is not clear yet. Index will come once it 4chan releases it or you discover how to fetch it though json."
  gem.summary       = "4chan is a gem that fetches posts from 4chan. Current version only fetches a specific listing now and it works only for READ. There's the 4chan.js that posts but the documentation is not clear yet. Index will come once it 4chan releases it or you discover how to fetch it though json."
  gem.homepage      = "https://github.com/designium/simple-fourchan"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "simple-fourchan"
  gem.require_paths = ["lib"]
  gem.version       = Simple::Fourchan::VERSION
  gem.post_install_message = "***************************************\n     Thanks for using 4chan gem    \n                                       \n                   LOL                 \n          U belongs to us now.         \n***************************************\n"

end
