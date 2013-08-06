
module QueueService
  extend self

  def method_missing(name, *args, &block)
    # make sure to only parse incoming methods that end in `*_event`
    if name.to_s.ends_with? '_event'
      # defaults/fallbacks
      type = 'system'
      action = 'event'
      id = nil

      parts = name.to_s.downcase.split '_'
      # split off the '_event'
      parts.pop
      # TODO: clean this up and 'ruby-ify' it!
      # iterate over parts for action and object of action
      parts.each do |token|
        if token.in? [ 'task', 'comment', 'user' ]
          type = token
        elsif token[0..4].in? [ 'creat', 'updat', 'delet' ]
          action = token
        end
      end
      # iterate over any args passed, looking for attributes
      # with an `id` key:
      args.each do |arg|
        if arg.is_a? Hash
          id = arg.fetch('id')
        end
      end

      emit("#{ type }:#{ action }", "#{ type } #{ id } #{ action }")

    # ...otherwise, give up and pass the call up the chain.
    else
      super(name, *args, &block)
    end
  end

  private

  # eventually, optional use of new object's attributes in `data`
  def emit(msg, data = {})
    $redis.set(msg, data)
  end

end