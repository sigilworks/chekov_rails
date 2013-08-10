# from http://stackoverflow.com/questions/7548531/how-do-i-reload-a-div-with-a-rails-partial
# in controller:

def ajax_load_events
  respond_to do |format|
    format.js
  end
end

# in ajax_load_events.js.erb
# escape_javascript available through alias `j()`
$("#load_events").html('<%= escape_javascript(render :partial => "your_partial", :locals => { :events => @events}) %>');

# Update: in routes.rb
# get "/ajax_load_events" => "your_controller#ajax_load_events"

# in <controller_action_name>.js

$.get("/ajax_load_events/"), {}, null, "script" );


# reading YAML files...can have ERB in it too.
YAML.load(ERB.new(File.new("#{Rails.root}/config/chekov.yml").read).result)['top_level_key'].symbolize_keys
# don't need #symbolize_keys, if you prepend keys with a colon in the .yml file! 
# or append .with_indifferent_access and you can access with either string or symbol keys

--- 
- !ruby/object:Person 
  name: John Doe
  sname: jdoe
  email: jdoe@gmail.com
- !ruby/object:Person 
  name: Jane Doe
  sname: jdoe
  email: jane@hotmail.com

require "yaml"
# Will return an array of Person objects.
data = YAML::load(File.open("data.yml"))
# Will print out the first object in the array's name. #=> John Doe
puts data.first.name



# launching Redis server:
To have launchd start redis at login:
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
Then to load redis now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
Or, if you don't want/need launchctl, you can just run:
    redis-server /usr/local/etc/redis.conf