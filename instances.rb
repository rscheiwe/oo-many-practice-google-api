philosophy = Result.new("philosophy")
cats = Result.new("cats")

philosophy = philosophy.display_books("philosophy")
cats = cats.display_books("cats")

load './book.rb'
load './author.rb'

arr_philosophy = Book.new(philosophy)
arr_cats = Book.new(cats)
