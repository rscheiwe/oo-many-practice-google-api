require 'rest-client'
require 'json'
require 'pry'


class Result

  attr_accessor :term

  @@all = []

  def initialize(term)
    @term = term
    @books = []

    @@all << self
  end

  def search_for_term(term)
    response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q={#{term}}"+"&maxResults=40"
    json = JSON.parse(response.body)
    json
  end

  def display_books(term)
    json = search_for_term(term)
    #binding.pry
    @books << json["items"].map do |book|
      {
        title: book["volumeInfo"]["title"],
        author: book["volumeInfo"]["authors"],
        publisher: book["volumeInfo"]["publisher"],
        publishedDate: book["volumeInfo"]["publishedDate"],
        pages: book["volumeInfo"]["pageCount"],
        type: book["volumeInfo"]["printType"]
      }
    end
  end

  def books
    @books.flatten
  end

  def self.all
    @@all
  end

end

#philosophy.books.flatten.may { |book| book[:title] }

Pry.start
