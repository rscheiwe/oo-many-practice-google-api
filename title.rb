require 'pry'

class Title

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

#some books have multiple authors, so this flattens all authors together
#and it could screw with the count in some way.
  def self.all_titles
    books = Book.all.map {|book_list| book_list.arr }.flatten
    #binding.pry
    titles = books.map {|book| book[:title]}.flatten
    titles = titles.reject!{|title| title == nil}

    @@all << titles
  end

  def self.find_author(name)
    # self.all.select {|author| author == name}

    self.all.flatten.select.with_index do |title, idx|
      if title == name
        "#{idx}: #{name}"
      end
    end
  end

  def self.all
    @@all
  end



end
