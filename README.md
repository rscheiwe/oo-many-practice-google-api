# oo-many-practice-google-api

(after @aalexander3/oo-many-many-practice/)

# Here's our domain:
  * Author
  * Publisher
  * Title(s)

# How is this modeled?
  * A title(s) belongs_to an author
  * A title(s) belongs_to a publisher
  * An author has_many title(s)
  * A publisher has_many title(s)
  * An author has_many many publishers through title(s)
  * An publisher has_many authors through title(s)

==============================================================

# REQUIRE

```ruby
require 'rest-client'
require 'json'
require 'pry'
```

==============================================================

# OBJECTIVES
  * Draw this domain on a whiteboard or http://awwapp.com/
  * Build out the three classes and files from scratch (keep in mind the relationships)
  * Build out a single class the employs the `RestClient` and `JSON` methods for obtaining and parsing data via the Google Books API. 
  * Think about how the classes will interact -- how does a publisher know about its titles? Et al.
  * Use attr_reader, attr_writer, & attr_accessor
  * Create a run file with a single point of entry
  * Maintain _single source of truth_ for all classes

==============================================================

# OBJECTIVES for EXECUTING

  * Use the Google Books API to query the Books Library with a predetermined `term`. 
  * To define API parameters, see https://developers.google.com/books/docs/v1/using#st_params. Any combination of parameters may be used. 
  * The `RestClient.get` call should utilize `JSON.parse` to return .json-formatted data that includes `book_title`, `book_author`, `book_publisher`, and `published_date`. 
  * The API's `MaxResults` parameter should be set to _at least_ `100` to develop deep enough many-to-many relationships. 

==============================================================

# DELIVERABLES
  * DATA
    * #intialize a `RestClient` call is initialized with proper `term`
    * #class_calls interates over the resulting data hash and makes the appropriate calls on the `Publisher`, `Author`, and `Title` classes
    
==============================================================

  * PUBLISHER
    * #initialize a publisher is initialized with a name and year
    * a publisher cannot change its name, but can change its year
    * Publisher.all returns all instances of the publisher class
    * #publishers returns an array of all the publisher instances that belong_to an publisher
    * #authors return an array of all the authors that are associated with a publisher
    * #years returns an array of all the years and titles that are associated with a publisher
    * #author_names return an array of just the names of said members (First and Last), not the full object
    ====== BONUS ======
    * Publisher.find_by_year takes in a year (e.g., INTEGER) as an argument and finds a publisher by a given year
    * #input_pages takes in a title and a page number and adds the page-number count as an optional value to the title

==============================================================
  * AUTHOR
    * #initialize an author is initialized with a first_name and last_name
    * an author cannot change their name
    * Author.all returns all instances of the author class
    * #author_name converts an author's first and last name to indexable author_name (e.g., "John Smith => "jsmith")
    * #titles returns an array of all the titles associated with an instance of author
    * #new_title creates a new title instance taking in a publisher and a year
    ====== BONUS ======
    * Author.find_by_name takes in author_name (e.g., "jsmith", not "John Smith") as an argument and returns an author's full name and titles by a member_name
    * #find_publisher finds a publisher by year  -- utilizing the Publisher.find_by_year class method

==============================================================
  * TITLE
    * #initialize  a title is initialized with a printType (e.g., "BOOK", "eBOOK"), an author, and a publisher
    * a title has corresponding methods for all three attributes
    * Title.all returns all instances of the title class

==============================================================
