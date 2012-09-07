require "simple-fourchan/version"
require "open-uri"
require "json"
require "ostruct"

module Fourchan
  class Post
    def initialize( board, thread)
      @board = board
      @thread = thread.to_i
      @posts = []
      temp = JSON.parse(open("http://api.4chan.org/#{@board}/res/#{@thread}.json").read)["posts"]
        temp.each do |post|
          tim = post["tim"]
          post.merge!({"image" => "http://images.4chan.org/#{@board}/src/#{tim}.jpg"}) unless tim.nil?
          post.merge!({"thumb" => "http://thumbs.4chan.org/#{@board}/thumb/#{tim}s.jpg"}) unless tim.nil?
          post.merge!({"link" => "http://boards.4chan.org/#{@board}/res/#{@thread}"})
          @posts << OpenStruct.new(post)
        end
      @posts
    end

    def all
      @posts
    end

  end
end
