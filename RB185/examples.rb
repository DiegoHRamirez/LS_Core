
# Writing sinatra applicaitons
require 'sinatra'

#### Routes ####

# RUBY METHODS provided by SINATRA
# Use a method name that represents the HTTP request method
# takes a string argument that represents the path requested
# uses a block to determine the response to send back

=begin
Within the main application file, when the method name,
and the string argument of a route match the HTTP method and path in the request-line
of an HTTP request, the code in the block is executed.

As with any other blocks, the return value is the last line
executed (unless there is a redirection or halt method called).
which Sinatra sends back to web server. (then the web server sends it back to the client)

Being a rack based development framework, the way an http request comes in from the web server (e.g puma, webrick)
to Sinatra and is sent back is standardized according to the rules defined by Rack. Rack converts an HTTP text request
sent from a web server to Sinatra into a Ruby hash called `env` that contains the request-line, headers, and body.

Sinatra can work with the ruby object, but it must implement a method with the name `call` that can take an argument
which will be the `env` hash. This method should return a 3 element array that contains the 3 components
of an HTTP response: a status code, a hash with the HTTP headers if there are any, and an object that must
respond to an #each method call which represents the body.
=end

get "/courses" do
  # executed when the server receives an http request that is a GET request and whose path is `/courses`
  # code sent back to the web server and then the client
end

## Route Parameters ##

# Routes can have parameters to reduce the duplication from defining routes
# that map to identical http request methods and nearly identical paths

get "/courses/:course_id" do
# Will match any route with a GET request that starts with "/courses" followed by one segment
# The segment can have additional query parameters
# The value passed to the application through the URL in this way appears in
# the parrams hash available in routes
end


#### Rendering templates ####
require 'tilt/erubis'
# makes an application more dynamic
=begin
Templates/ view templates are files that contain text that is converted to HTML
and sent to the client in a response.
There are many templating languages
ERB - Embedded Ruby
=end

# Make erb files in a `views` directory
# Any code can be placed in an ERB file using
<% code goes here %>
# to Ensure the value prints
<%=  %>
# can use an instance variable to define dynamic values. These variables can be used in a template
<%= @dynamic_value_that_will_print %>
# Inside a route, the `erb` call that takes 2 arguments (one optional) will render a template
erb :erb_filename_in_views, :layout :layout_file_name
# the first argument is the name of an erb file that is the view template to be rendered
# the second argument is the layout that will wrap around the template. This argumnet is optional
# If no layout is specified, by default ERB will look for an erb file with the name `layout` and use it as the layout

# content_for #
# allows you to capture content from a template and display it in another template or a layout

# capture the content with the content_for block in the view template
content_for :name do
  HTML CODE
end

# where you want to display it use yield_for (e.g layout)
<%= yield_for :name %>


## Layouts ###
=begin
A way to reduce duplication of HTML code.
You can put shared HTML code in a layout, so the templates
only hold HTML code specific to those templates
=end

# layout.erb # -in views directory#
# uses the yield keyword to indicate where the template content will be placed
<%= yield %>
# if HTML ESCAPING, must use
<%== %>
# to tell sinatra to disable auto-escaping


#### Filters ####

# before filter #
before do
  # sinatra executes the code in a before block before executing the code in the block of a matching route
  # a good place to set up globally needed data

  # In a database-backed application its a good place to instantiate an instance
  # of the class that interacts directly with the database, essentially setting up
  # a connection to the database
end

# after filter #
after do
  # sinatra executes the code in an after filter after running the code in a matching route.
  # runs after every event

  # good use case would be closing the connection to the database
end


#### View Helpers ####
# methods that are made available in VIEW TEMPLATES by Sinatra (can help filter data or perform functionality)
# TEMPLATES call helpers when rendering the page
# using helpers allows you to reuse code more easily and make its intention clearer

helpers do #
  def add_id_to_elements
    # called from templates when rendering the page
  end
  # helpers can also be accessed within routes
  # if the methods do NOT need to be used in a view template
  # then they should not go in the helpers block to make its intention clearer
end

## configure blocks ##
configure do
   # can make code more readable
   # will let you add environment based options which you then put into their own respective blocks.
   # e.g configure (:development)
end

#### State ####
# data that persist over time
# using http it's possible to create a system where state persists across request/response cycles

### Sessions ###
# to set up sinatra to use sessions use a configure block#
configure do
   enable :sessions
   # sinatra uses `session_secret` to encrypt session information
   # the client must present the session secret when sending persisted information back to the server
   set :session_secret 'secret_key' # in a production app, this key would be stored in an environment variable
end

### Using sessions to persist date example: flash messages ###

# set a message as the value in e key-value pair in the session hash within a route"
get "/example" do
  session[:message] = "flash message" # should be vague to avoid exposing specific app implementation details
end
# delte it on the layout and use the <%= %> to print the message
<%= session.delete(:message) %>

### Toggling state of data ###

# it is always better to explicitly send the value a request (client) intends to
# update the data to on the server since the data on the client and server side may not be congruent.

# if the data is not congruent on both sides, and state is simply toggled by a request that is not explicit
# about its intention, the value of the data may not be what is expected.

# this is possible if the state of the data changes between the time its values are displayed
# and the point when a request to change it is sent.


#### Application Security ####

## Javascript Injection ##
# submitting javascript code in forms

# one approach is to use a built-in method provided by the Rack Library and conveniently placing it in a helper method
helpers do
  def escape(html)
    Rack.Utils.escape_html(html)
  end
end

# However, this means it must be placed everywhere where input is rendered into a page
# a better approach is to automatically escape all html

# Automatically escaping all output #
configure do
  set :erb, :escape_html => true
end
# this will escsape all the code, so to counter this use <%== instead of <%=
<%== yield %>

## Validating parameters passed through the URL ##
# invalid input can be passed to the application through the URL
get "/example/:parameter"
  # validate the parameter through methods or within the route
end
# WRITE SME MORE ON HANDLIG PARAMATERRS / VALIDATING PARAMETERS #





##### USING SQL #####

#### Executing SQL statements from Ruby ####
require 'pg' gem # allows you to connect to a database and send sql queries

# You need a PG connection ob
ject
# You can instantiate a PG connection object using PG#connect(dbname: database_name)

connection_to_database = PG.connect(dbname: "database_name")

# using the connection object, you can send sql queries to the database server using
# PG::Connection#exec(sql_statement) - returns a PG::Result object

result = connection_to_database.exec(sql_query) #=> PG::Result instance

# the PG::Result object is a collection of tuples
# you can use many methods provided by the PG::Result class to obtain data from the query
# and since the PG::Result class mixes in the enumerable module, enumerable methods are also avaialble for use
# You can can call any of those methods on the PG::Result object to obtain meaningful information
# about the data returned from the query
result.ntuples = (integer indicating the number of records returned)
result.each { |tuple| code(tuple) }
result.field_values("column_name") #=> array of values for the specified column name
# The data within the tuples is all strings

### handling parameters safely ###
# never interpolate values into an SQL statement manually
# use PG::Connection#exec_params(sql_statement, [params])

# Within the sql_statement, placeholder values are indicated by a dollar sign
# and an integer indicating the position of the value in the array
connection_to_database.exec_params("SELECT * FROM lists WHERE id = $1 AND name = $2", [1, "two"])
# there must be a value in the array for every placeholder value in the sql statement

# This would throw an ERROR
connection_to_database.exec_params("SELECT * FROM lists WHERE id = $1 AND $2", [1])

