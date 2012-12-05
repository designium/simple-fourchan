require "simple-fourchan/version"
require "open-uri"
require "json"
require "ostruct"

module Fourchan

  FOURCHAN_BOARDS = ["a", "b", "c", "d", "e", "f", "g", "gif", "h", "hr", "k", "m", "o", "p", "r", "s", "t", "u", "v", "vg", "w", "wg", "i", "ic", "r9k", "cm", "hm", "y", "3", "adv", "an", "cgl", "ck", "co", "diy", "fa", "fit", "hc", "int", "jp", "lit", "mlp", "mu", "n", "po", "pol", "sci", "soc", "sp", "tg", "toy", "trv", "tv", "vp", "wsg", "x", "rs", "status", "q"]

  class Post
    def initialize( board, thread)
      @board = board
      thread = thread.to_i
      @posts = []
      begin
        temp = JSON.parse(open("http://api.4chan.org/#{@board}/res/#{thread}.json").read)["posts"]
          temp.each do |post|
            tim = post["tim"]
            ext = post["ext"]
            post.merge!({"image" => "http://images.4chan.org/#{@board}/src/#{tim}.#{ext}"}) unless tim.nil?
            post.merge!({"thumb" => "http://thumbs.4chan.org/#{@board}/thumb/#{tim}s.#{ext}"}) unless tim.nil?
            post.merge!({"link" => "http://boards.4chan.org/#{@board}/res/#{thread}"})
            @posts << OpenStruct.new(post)
          end
        @posts
      rescue Exception => e
        puts "The thread number #{thread} cannot be fetch. Please try later."
      end
    end

    def all
      @posts
    end
  # end of post class
  end

  class Board
    def initialize( board )
      @board = board
    end

    def exist?
      FOURCHAN_BOARDS.include?(@board)
    end

    # page fetches all threads from that page
    def page(page = 0)
      @threads = []

      begin
          temp = JSON.parse(open("http://api.4chan.org/#{@board}/#{page}.json").read)["threads"]
            temp.each do |post_thread|
              post_thread_number = post_thread["posts"][0]["no"]
              tim = post_thread["posts"][0]["tim"]
              post_thread_thumb = "http://thumbs.4chan.org/#{@board}/thumb/#{tim}s.jpg"
              thread_url = "http://boards.4chan.org/#{@board}/res/#{post_thread_number}"
              hash = {"thread" => post_thread_number, "board" => @board, "thumb" => post_thread_thumb, "url" => thread_url}
              @threads << OpenStruct.new(hash) unless post_thread_number.nil?
            end
      rescue Exception => e
        puts "The board #{@board} page number #{page} cannot be fetched. Please try again."
      end
      @threads
    end

    # threads return all thread numbers and thumbs from a specific board
    def threads
      threads = []
      (0..15).each do |i|
        threads << self.page(i)
      end
      threads.flatten!
    end
  # end of board class
  end

# End of module
end
