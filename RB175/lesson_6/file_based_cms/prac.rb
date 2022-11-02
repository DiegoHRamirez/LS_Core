# creating new documents
=begin
requirements:
link to add a new document on the index page
when the user cicks the new document link, they should be taken to a
page with a text input labeled "add a new document" and a submit button labeled "create"

When a user enters a doc name and clicks 'create' they should be redirected to the index page.
The name they entered inn the form should now appear in the file lists.
They should see a msg that says "FILENAME" was created"

If a user attempts to create a new doc without a name, the form should be re-displayed and a message should say " name is required"


- Add a link to the index page, new anchor element with href attribute, that links to  "/new"
-create a route the app file for GET "/new"
  - within the route, use the 'erb' to send the browser an erb file 'ne
- create a new view template 'new.erb'
  - w/ in the view temp have a form element with no text area.
  - the form element method is post, and it goes to the route POST '/new'
  - create an input element with the name "filename"
-create a route in the app file for POST "/new"
  - add the file submitted through the form
    - retrieve the name subimtted through the params[:filename]
    - create a new file
    - set an message in the session, session[:message] =...
    - redirect the user to the index page
=end

# Deleting Documents
=begin
requirements:
1. When a user views the index page they should see a delte button next to each doc
2. when a user clicks a delete button, the application should delete the appropriate document
and display a message: filename was deleted.

add a new anchor element to the index view template with an href attribute,
 -the element sends the user to the route 'GET /delete/filename'

add a new route to the cms app file
 -route : get "/delete/filename'
  -delete the file from the data directory
   -look up ruby doc on delete a file, (File class or Dir class)

test it, at each point
=end

# Signing in and out
=begin
-When a signed-out user views the index page of the site, they should see a 'sign in' button
-When a user clicks the 'sign in' button they should be taken to a new page with a
sign in form. The form should contain a text input labeled "Username" and a password input
labeled "Password" The form should also contain a submit button labeled "sign in"
- when a user enters the username 'admin' and oasswird 'secret' into the sign in form
and clicks the 'sign in' button, they should be signed in and redirected to the index page
A message should display that says welcome!
- When a user enters any other username and password into the sign in form and
clicks the sign in button, the sign in form shuld be redisplayed and an error message "invalid credentials"
should be show. The username they entered into the form should appear in the username input.
-When a signed in user views the index page, they should see a message at the bottom of the
page that says "signed in as #username'" followed by a button labeled signed out
-When a signed-in user clicks this "Sign Out" button, they should be signed out of the
application and redirected to the index page of the site.
They should see a message that says "You have been signed out."

- add a sign in buttom, form element to the index page at the bottom, that says sign in
- the form element will have an action attr that redirects to '/users/signin'
-create a route in the app file for 'get 'users/signin'
  - the route loads a template to the browser 'signin.erb'
  - in the template, there will be one form element with two input elements within in
  - the form element will also have a button of attr 'submit' w/ name 'sign in'
  - when clicked, form makes post req to route '/users/signin'
-create route in app for post 'users/signin'
 - acces the strings submitted through params[:username] and password
 - if the values match admin and password, sign in and redirect o the index
  -once signed in, at the bottom of the page, the user should see a msg that says
    'signed in' as $USERNAME, followed by a button labeled sign out.
 - if the values do not match, load the same view template and set
  a sesion[message] = "Invalid Credentials"

- if a signed in user clicks the sign out button, they should be signed out of the pplication
and redireced to the index page of the site. They should see a msg that says
 'you have been signed out'.

 - once user is signed in, they should see a sign out buttom,
 - also user should see a message that says, signed in as...

 add a helped method to determine if the user is signed in out signed out..
=end

# Accessing the session while testing
=begin
requirements:
- update all existing test to use the helpers methods that set a essions value
- for all the tests.

- so instead of loading a page using get and then checking to see if a given
msg is displayed on it, session[:message] can be used to access the session
value directly..
=end

# restricting actions to only signed in users
=begin
requirements:
-when a signed out user attempts to perform the following actions, thye should be
redirected back to the index and shown a message that says "You must be signed
in to do that"
  any of these actions (all these paths) (routes:)
  - visit tht edit page for a document -- get /:filename/edit
  - submit changes to a document -- post /:filename
  - visit the new document page -- get /new
  - submit the new document form --  post /new
  - delete a document -- post /delete/:filename

have a helper method: restricted_access
- check to see if the user is signed in
- redirects back to the index page if no
 - also set a messsage in the session[:message]
- if so, then the method returns nothing,,
=end

# storing user accounts in an external file
=begin
requirements:
- an administrator should be able to modify the
list of users who may sign into the application
by editing a configuration file using their text
editor.

the users who have access to sign into the application
are stored in a configuration file.
This configuration file is int he index.

Modify the method that allows a user to sign in.
The valid? method, checks the username nad password
passed in to see if the array fo hashes that
contiains username and passwords contains the given
arguments. If so returns true otherwise false

the configuration file should only show for the admin..
otherwise, the users cannot access the
configuarion file...

- modify the index,,, if the user is not an admin,
then all the files except the configuration are shown
-can use reject for this.

-the config file, can be a text, yaml file
- the fils is created on each instance..
- and the modifications are stoed in a hash...
=end
require 'yaml'

a = YAML.load_file('./data/users.yml')
path = './data/users.yml'


a[:user] = "pass"

a = a.map { |k, v| [k,v] }.to_h


# File.open(path, 'w') do |file|
#   file.write(a)
# end
# stream = Psych.parse_stream(File.read(path))

# File.open(path, 'w') do |file|
#   file.write(stream.to_yaml)
# end


# stream = Psych.parse_stream(File.read(path))


# File.open(path, 'w') do |file|
#   file.write(stream.to_yaml)
# end
File.open(path, 'w') do |file|
  file.write(Psych.dump_stream(a))
end

c = YAML.load_file(path)

require 'bcrypt'

d = c.any? do |user, pass|
  bcrypt = BCrypt::Password.new(pass)
  bcrypt == 'diegosecret'
end
p d