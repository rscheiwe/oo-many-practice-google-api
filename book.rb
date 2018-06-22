class Book

  attr_accessor :arr

  @@all = []

  def initialize(arr)
    @arr = arr

    @@all << self
  end

  def self.all
    @@all.flatten
  end

#Book.all[0].arr.books.flatten
#Book.all[0].arr.books.flatten[0][:title

#EACH entry
#Book.all.map {|book| book.arr.flatten.length}

#===============
#THIS WORKS
#Book.all.map {|book_list| book_list.arr.flatten.map {|book| book[:title]}}

# philosophy = Result.new("philosophy")
# philosophy = philosophy.display_books("philosophy")
# new_phil = Book.new(philosophy)
# cats = Result.new("cats")
# cats = cats.display_books("cats")
# new_cats = Book.new(cats)
# Book.all will be length == 2
# ===THEN===
# Book.all.map {|book_list| book_list.arr.flatten.map{|book| book[:title]}}.flatten

end
