# 4chan

4chan is a gem that fetches posts from 4chan. Current version only fetches a specific listing now and it works only for READ. There's the 4chan.js that posts but the documentation is not clear yet. Index will come once it 4chan releases it or you discover how to fetch it though json.

## Installation

Just do in your Gemfile or install and do require '4chan'.

    gem 'simple-fourchan'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple-fourchan

## Usage

For now, you can only fetch a reply list to a subject.

    array = Fourchan::Post.new "w", "1403853"

Example:

If the gem is loaded:

    array = Fourchan::Post.new "w", "1403853"

It returns an array of 4chan posts.

You should start like this:

    Fourchan::Post.new "BOARD_LETTER", "THREAD_NUMBER"

    array = Fourchan::Post.new "w", "1403853"
    posts = array.all

Useful methods:

Some methods may be missed depending what user submitted: title, image, thumb, etc....

    posts.each do |post|
      post.title            # =>   "One of the best anime's in my opinion!"
      post.now           # =>    "09\/06\/12(Thu)14:20"
      post.name         # =>    "Anonymous"
      post.email         # =>     "random@email.com"
      post.com           # =>     "One of the best anime's in my opinion!"
      post.image        # =>     "http://images.4chan.org/w/src/1346955606165.jpg"
      post.thumb        # =>     "http://thumbs.4chan.org/w/thumb/1346955606165s.jpg"
      post.link            # =>     "http://boards.4chan.org/w/res/1403853"
    end


You can also do this in a more through way:

    posts.each do |post|

      puts post.no
      # 1403714
      puts post.sticky
      # 0
      puts post.closed
      # 0
      puts post.now
      # "09\/06\/12(Thu)14:20"
      puts post.name
      # "Anonymous"
      puts post.email
      # ""
      puts post.sub
      # ""
      puts post.com
      # "One of the best anime's in my opinion!"
      puts post.filename
      # "yoshimori and tokine wallpaper"
      puts post.ext
      # ".jpg"
      puts post.w
      # 1024
      puts post.h
      # 693
      puts post.tn_w
      # 250
      puts post.tn_h
      #169
      puts post.tim
      # 1346955606165
      puts post.time
      # 1346955606
      puts post.md5
      # "Rw+TXj1fkCTDKmj2DP2SfQ=="
      puts post.fsize
      # 257664
      puts post.resto
      # 0
      puts post.trip
      # ""
      # Check the end of this file to see the json example from 4chan.
    end

For now, you should be able to access the content in the following way:


Json example from 4chan.

    {"posts": [{"no":1403714,"sticky":0,"closed":0,"now":"09\/06\/12(Thu)14:20","name":"Anonymous","email":"","sub":"","com":"One of the best anime's in my opinion!","filename":"yoshimori and tokine wallpaper","ext":".jpg","w":1024,"h":693,"tn_w":250,"tn_h":169,"tim":1346955606165,"time":1346955606,"md5":"Rw+TXj1fkCTDKmj2DP2SfQ==","fsize":257664,"resto":0,"trip":""},{"no":1403717,"now":"09\/06\/12(Thu)14:25","name":"Lol","email":"","sub":"","com":"You don't know anime","time":1346955928,"resto":1403714,"trip":""},{"no":1403728,"now":"09\/06\/12(Thu)14:41","name":"Anonymous","email":"","sub":"","com":"<span class=\"quote\"><a href=\"1403714#p1403717\" class=\"quotelink\">&gt;&gt;1403717<\/a><\/span><br>Lol I do. Plus it's an opinion :P","time":1346956912,"resto":1403714,"trip":""},{"no":1403786,"now":"09\/06\/12(Thu)16:43","name":"Anonymous","email":"","sub":"","com":"I see you didn't watch Boku no Pico.","time":1346964202,"resto":1403714,"trip":""}]}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
