require 'rest-client'
require 'json'
require 'pry'

@books = []

def search_for_term(term)
  response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q={#{term}}"+"&maxResults=40"
  json = JSON.parse(response.body)
  json
end

def display_books(term)
  json = search_for_term(term)

#Changed 'self.all <<' to "books" here
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


Pry.start
