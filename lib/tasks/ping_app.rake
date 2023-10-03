desc "Makes a request to the app and prints the response body and http status code returned."
task :ping_app do
  require "net/http"
  uri = URI('https://katy-hiking-trails.fly.dev/')
  response = Net::HTTP.get_response(uri)
  # Uncomment the below lines to list all of the methods on
  # the response object.
  # puts response.methods - Object.methods
  puts "response.body = " + response.body.to_s()
  puts "response.message = " + response.message.to_s()
  puts "response.code_type = " + response.code_type.to_s()
end
