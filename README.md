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
  * MEMBER
    * #initialize a member is initialized with a first_name and last_name
    * a member cannot change their name
    * Member.all returns all instances of the member class
    * #member_name converts a member's first and last name to member_name (e.g., "John Smith => "jsmith")
    * #memberships returns an array of all the memberships associated with an instance of member
    * #buy_membership creates a new membership instance taking in an institution and a tier (e.g., 
free", "premium")
    ====== BONUS ======
    * Member.find_by_name takes in member_name (e.g., "jsmith", not "John Smith") as an argument and finds a member's full name by a member_name
    * #find_institution finds an institution by kind (e.g., "gym", "salon") -- utilizing the Institution.find_by_kind class method

==============================================================
  * MEMBERSHIP
    * #initialize  a membership is initialized with a tier ("free", "premium", etc.), a member and an institution
    * an membership has corresponding methods for all three attributes
    * Membership.all returns all instances of the membership class

==============================================================
