class Author < ActiveRecord::Base

  has_many :publishers
  has_many :books, through: :publishers

  def self.seed_authors

  end
#some books have multiple authors, so this flattens all authors together
#and it could screw with the count in some way.
  def self.all_authors
    books = Book.all.map {|book_list| book_list.arr }.flatten
    #binding.pry
    authors = books.map {|book| book[:author]}.flatten
    authors = authors.reject!{|author| author == nil}

    @@all << authors
  end

  def self.find_author(name)
    # self.all.select {|author| author == name}

    self.all.flatten.select.with_index do |author, idx|
      if author == name
        "#{idx}: #{name}"
      end
    end
  end

  def self.all
    @@all
  end



end
