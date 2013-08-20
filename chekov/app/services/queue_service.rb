
module QueueService
  extend self

  MODELS_WITH_EVENTS = AppConfig.events.models_audited
  COMMON_EVENT_PREFIXES = AppConfig.events.prefixes

  def method_missing(method, *args, &block)
    # make sure to only parse incoming methods that end in `*_event`
    if method.to_s.ends_with? '_event'
      # split on underscores, and cleave off the final '_event'
      parts = method.to_s.downcase.split('_')[0...-1]
      # parse out the `type`, `action`, and `id` tokens
      type, action = process_tokens(parts)
      id = extract_id(args)
      # pass to redis
      emit("#{ type }:#{ action }", "#{ type } #{ id } #{ action }")
    # ...otherwise, give up and pass the call up the chain.
    else
      super(method, *args, &block)
    end
  end

  # handling respond_to? alongside method_missing
  def respond_to?(method, include_private = false)
    method.to_s.ends_with? '_event' || super
  end

  private

  # eventually, optional use of new object's attributes in `data`
  def emit(msg, data = {})
    # $redis.set(msg, data)
  end

  # iterate over parts for action and object of action
  def process_tokens(parts)
    # defaults/fallbacks
    type = 'system'
    action = 'event'

    parts.each do |token|
      if token.in? MODELS_WITH_EVENTS
        type = token
      elsif token[0..4].in? COMMON_EVENT_PREFIXES
        action = token
      end
    end

    return type, action
  end

  # iterate over any args passed, looking for attributes
  # with an `id` key:
  def extract_id(args)
    args.each { |arg| return arg.fetch('id') if arg.is_a? Hash }
    nil
  end

end