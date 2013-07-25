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