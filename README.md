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
  * Build out a single class the employs the `RestClient` and `JSON` methods for obtaining data. 
  * Think about how the classes will interact -- how does a publisher know about its titles? Et al.
  * Use attr_reader, attr_writer, & attr_accessor
  * Create a run file with a single point of entry
  * Maintain single source of truth for all classes

==============================================================

# OBJECTIVES for EXECUTING

  * Use Google Books API to query the Books Library with a predetermined `term`. 
  * Define API parameters at https://developers.google.com/books/docs/v1/using#st_params. 
  * The `RestClient.get` call should utilize `JSON.parse` to return .json-formatted data that includes `book_title`, `book_author`, `book_publisher`, and `published_date`. 
  * The API's `MaxResults` parameter should be set to _at least_ `100` to develop deep enough many-to-many relationships. 

==============================================================

# DELIVERABLES
  * INSTITUTION
    * #initialize an institution is initialized with a name and a kind (e.g., gym, salon, etc.)
    * an institution cannot change its name, but can change its kind
    * Institution.all returns all instances of the institution class
    * #memberships returns an array of all the membership instances that belong_to an institution
    * #members return an array of all the members that are associated with an institution
    * #member names return an array of just the names of said members (First and Last), not the full object
    ====== BONUS ======
    * Institution.find_by_kind takes in a kind (e.g., "gym") as an argument and finds an institution by a given kind
    * #upgrade_membership takes in a membership and a new tier ("free" => "premium") and changes the membership's tier

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
