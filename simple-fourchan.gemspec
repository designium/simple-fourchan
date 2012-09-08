# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simple-fourchan/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chim Kan"]
  gem.email         = ["designium@gmail.com"]
  gem.description   = "Simple 4chan is a gem that fetches posts from 4chan. A complete reading solution to fetch posts from 4chan into your ruby, any rack-based or rails app. You set the board and simple-fourchan will fetch all posts from a board or thread number."
  gem.summary       = "Simple 4chan is a gem that fetches posts from 4chan. A complete reading solution to fetch posts from 4chan into your ruby, any rack-based or rails app. You set the board and simple-fourchan will fetch all posts from a board or thread number."
  gem.homepage      = "https://github.com/designium/simple-fourchan"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "simple-fourchan"
  gem.require_paths = ["lib"]
  gem.version       = Simple::Fourchan::VERSION
  gem.post_install_message = "***************************************\n     Thanks for using 4chan gem    \n                                       \n                   LOL                 \n          U belongs to us now.         \n***************************************\n"

  gem.add_dependency('json')
end
