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


content_tag :li, :class => 'vehicle_list' do
  link_to("#{vehicle.title.upcase} Sale", show_all_styles_path(vehicle.id, vehicle.url_title))
end


#  -------------------------------------------------------------------------------------------  */


# launching Redis server:
To have launchd start redis at login:
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
Then to load redis now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
Or, if you dont want/need launchctl, you can just run:
    redis-server /usr/local/etc/redis.conf


#  -------------------------------------------------------------------------------------------  */
def method_missing(method, *args, &block)
  if method.to_s =~ /user_(.*)/
    user.send($1, *args, &block)
  else
    super
  end
end

def respond_to?(method, include_private = false)
  method.to_s.start_with?('user_') || super
end

#  -------------------------------------------------------------------------------------------  */
  # another way of doing the Enumables constantization...
  Hash[pluck :name, :id].each { |name, id|
    instance_eval("def #{ name }; @@_#{ name } ||= #{ id }; end")
  end

#  -------------------------------------------------------------------------------------------  #

class Equalizer < Module


  def initialize(*args)
    @key = "tj"
    puts "Equalizer initialized."
    puts "@key = #{ @key }"
    puts "*args = #{ args }"
  end
end


class GuineaPig
  include Equalizer.new(:test_me)


  def initialize
    puts "GuineaPig initialized."
  end
end


#  -------------------------------------------------------------------------------------------  */


  with_options :presence => true, :on => :save do |assoc|
    assoc.validates :application
    assoc.validates :reporter
    assoc.validates :description
  end

# -------------------------------------------------------------------------------------------- */
# nested hashing technique

nested = Hash.new(&(r = Proc.new{|h,k| h[k] = Hash.new(&r) }))
=> {}
nested[:a][:b] = 42
=> 42
nested
=> {:a=>{:b=>42}}

h = Hash.new {|h,k| h[k] = Hash.new(&h.default_proc)}
h["foo"]["bar"]["baz"] = 42
h["foo"] #=> {"bar"=>{"baz"=>42}}


# -------------------------------------------------------------------------------------------- #

Comment
      .where(Comment.arel_table[:updated_at].gteq last_visit)
      .each do |comment|
        entry = CommentActivityEntry.new(comment)
        @recents[entry.timestamp] = entry
      end

# -------------------------------------------------------------------------------------------- #

Customer = Struct.new :first_name, :last_name, :title, :address

# Subclasses of SimpleDelegator delegate
# everything they don't respond to to whatever
# you pass into the constructor
class CustomerDecoratator < SimpleDelegator
  def name
    "#{title}. #{first_name} #{last_name}"
  end

  def reversed_name
    "#{last_name}, #{first_name}".upcase
  end

  def to_hash
    {
      name: reversed_name,
      address: address
    }
  end
end

# Create a simple customer struct
fred = Customer.new({
  first_name: 'Freddie',
  last_name: 'Mercury',
  title: 'Mr',
  address: 'London'
})

# Decorate it with our decorator
fred = CustomerDecoratator.new(fred)
fred.name #=> "Mr. Freddie Mercury"
fred.to_hash #=> { name: "MERCURY, FREDDIE", address: "London" }

# Decorators can be stacked arbitrarily
class CustomerLocaleDecorator < SimpleDelegator
  def initialize(obj, locale)
    super(obj)
    @locale = locale
  end

  def to_s
    "#{field_names[:name]}: #{name}, #{field_names[:address]}: #{address}"
  end

  def field_names
    {
      ja: { name: '名前', address: '住所' },
      en: { name: 'name', address: 'address' }
    }[@locale]
  end
end

fred = CustomerLocaleDecorator.new(fred, :ja)
fred.to_s #=> "名前: Mr. Freddie Mercury, 住所: London"

#  -------------------------------------------------------------------------------------------  #
