ENV["RACK_ENV"] = 'test'

require "minitest/autorun"
require "rack/test"
require "fileutils"

require_relative "../cms"

class CmsTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def session
    last_request.env["rack.session"]
  end

  def create_document(name, content ="")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def admin_session
    { "rack.session" => { signed_in: true } }
  end


  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/", {}, admin_session

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"

  end

  def test_viewing_document
    create_document "history.txt", "Ruby 0.95 Released"

    get "/history.txt", {}, admin_session

    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Ruby 0.95 Released"
  end

  def test_document_not_found
    get "/notafile.ext" #attempt to access a nonexistent file

    assert_equal 302, last_response.status #assert that the user was redirected

    assert_equal "notafile.ext does not exist.", session[:message]
  end

  def test_editing_document
    create_document "changes.txt"
    get "/changes.txt/edit", {},  admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<button type="submit")
  end

   def test_restricted_document_editing
    create_document "example.txt"

    get "/example.txt/edit"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]

    post "/example.txt"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_updating_document
    post "/changes.txt", {content: "new content"}, admin_session

    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_view_new_document_form
    get "/new", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_restricted_document_creation
    create_document "example.txt"

    get "/new"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_view_new_document_form_signed_out
    post "/new", {filename: "example"}, admin_session
    assert_equal 302, last_response.status
    assert_equal "example.md has been created", session[:message]

    post "/new", filename: "example.txt"
    assert_equal 302, last_response.status
    assert_equal "example.txt has been created", session[:message]
  end

  def create_document_without_filename
    post "/new", {filename: ''}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body "Please enter a valid name"
  end

  def test_deleting_document
    create_document("doc.txt")

    post "/delete/doc.txt", {}, admin_session

    assert_equal 302, last_response.status
    assert_equal "doc.txt was deleted!", session[:message]

    get "/"
    refute_includes last_response.body, %q(href="/doc.txt")
  end

  def test_create_new_document_signed_out
    post "/create", {filename: "test.txt"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end
  def test_signin_form
    get "/users/signin"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_signin
    post "/users/signin", username: "admin", password: "secret"
    assert_equal 302, last_response.status
    assert_equal "Welcome!", session[:message]
    assert_equal "admin", session[:username]

    get last_response["Location"]
    assert_includes last_response.body, "Signed in as admin"
  end

  def test_signin_with_bad_credentials
    post "/users/signin", username: "guest", password: "shhhh"
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_signout
    get "/", {}, {"rack.session" => { signed_in: true, username: "admin"} }
    assert_includes last_response.body, "Signed in as admin"

    post "/users/signout"
    assert_equal "You have been signed out", session[:message]

    get last_response["Location"]
    assert_nil session[:username]
    assert_includes last_response.body, "Sign In"
  end

  def test_signup_form
    get "/users/signup"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_account_and_sign_in
    post "/users/signup", username: "testing", password: "testing"

    assert_equal 302, last_response.status
    assert_equal "You have successfully created an account. Sign in to continue.", session[:message]

    get last_response["location"]

    # post "/users/signin", username: "testing", password: "testing"
    # assert_equal 302, last_response.status
    # assert_equal "Invalid credentials!", session[:message]
  end


  def teardown
    FileUtils.rm_rf(data_path)
  end
end
