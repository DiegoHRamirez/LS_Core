# cms.rb
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "redcarpet"
require 'yaml'
require 'bcrypt'

configure do
  enable :sessions
  set :session_secret, 'super secret'
end

helpers do
  def format_file(name)
    name.include?('.') ? name : name << '.md'
  end

  def signed_in?
    session[:signed_in]
  end

  def session_state
    signed_in? ? "signout" : "signin"
  end

  def user_action
    signed_in? ? "Sign Out" : "Sign In"
  end

  def valid?(user, pass)
    authorized_users = load_user_credentials

    authorized_users.any? do |username, password|
      bcrypt_password = BCrypt::Password.new(password)
      return true if bcrypt_password == pass && username.to_s == user
    end

    user == "admin" && pass = "secret"
  end

  def admin?
    session[:signed_in] && session[:username] == "admin"
  end

  def copy_exists?(file)
    pattern = File.join(data_path, "*")

    @files = Dir.glob(pattern).map do |path|
      File.basename(path)
    end

    @files.include?(file)
  end

  def restricted_access
    return if session[:signed_in]

    session[:message] = "You must be signed in to do that."
    redirect "/"
  end

  def valid_username_and_password?(username, password)
    return false if username.chop == ' ' || password.chop == ' '
    (5..20).include?(username.size) && (5..20).include?(password.size)
  end

  def create_account(username, password)
     bcrypt_password = BCrypt::Password.create(password)
     credentials = load_user_credentials

     credentials[username] = bcrypt_password.to_s
     updated_credentials = credentials.map { |user, pass| [user.to_sym, pass]}.to_h

     path = File.join(data_path, "users.yml")
     File.open(path, 'w') do |file|
       file.write(Psych.dump_stream(updated_credentials))
     end
  end

  def user_exists?(username)
    credentials = load_user_credentials
    credentials.keys.any?(username.to_sym)
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data",__FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".md"
    erb render_markdown(content)
  else
    headers["Content-Type"] = "text/plain"
    content
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../data/users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

def create_document(name, content ="")
  File.open(File.join(data_path, name), "w") do |file|
    file.write(content)
  end
end

get "/" do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end

  @files.reject! { |file| file == "users.yml"unless admin? }
  erb :index
end

# add a new file page
get "/new" do
  restricted_access
  erb :new
end

get "/:filename" do
  file_path = File.join(data_path, params[:filename])
  @filename = params[:filename]


  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# visit the edit page for a document
get "/:filename/edit" do
  restricted_access
  file_path = File.join(data_path, params[:filename])

  @file_name = params[:filename]
  @content = File.read(file_path)

  erb :edit
end

# submit the new document form
post "/new" do
  restricted_access
  name = params[:filename].strip

  if name.empty?
    session[:message] = "Please enter a valid name"
    status 422
    erb :new
  else
    format_file(name)
    create_document(name, '')
    session[:message] = "#{name} has been created"
    redirect "/"
  end
end

# create a copy of an existing file
post "/duplicate/:filename" do
  restricted_access

  file_path = File.join(data_path, params[:filename])
  filename, extension = params[:filename].split('.')
  filename << "_copy" << '.' << extension

  if copy_exists?(filename)
    session[:message] = "Copy of #{params[:filename]} already exists"
  else
    content = File.read(file_path)
    create_document(filename, content)
    session[:message] = "A copy of #{params[:filename]} has been created"
  end

  redirect "/"
end

# delete a document
post "/delete/:filename" do
  restricted_access
  filename = params[:filename]
  File.delete(File.join(data_path, filename))

  session[:message] = "#{filename} was deleted!"
  redirect "/"
end

# submit changes to a document
post "/:filename" do
  restricted_access
  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

get "/users/signin" do
  erb :signin
end

# Sign up form
get "/users/signup" do
  erb :signup
end

# create a new account
post "/users/signup" do
  user = params[:username].strip
  pass = params[:password].strip

  if user_exists?(user)
    session[:message] = "User already exists."
    erb :signup
  elsif valid_username_and_password?(user, pass)
    create_account(user, pass)
    session[:message] = "You have successfully created an account. Sign in to continue."
    redirect "/users/signin"
  else
    session[:message] = "Username and Password must be between 5 and 20 characters with no trailing spaces"
    erb :signup
  end
end

post "/users/signout" do
  session.delete(:signed_in)
  session.delete(:username)
  session[:message] = "You have been signed out"
  redirect "/"
end

# sign in
post "/users/signin" do
  username = params[:username]
  password = params[:password]

  if valid?(username, password)
    session[:message] = "Welcome!"
    session[:username] = username
    session[:signed_in] = true
    redirect "/"
  else
    session[:message] = "Invalid credentials!"
    status 422
    erb :signin
  end
end
