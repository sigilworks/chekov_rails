require 'json'

module EventStreamingService
  extend self

  def with_stream(stream)
    StreamingEventInstance.new(stream)
  end

  private

  class StreamingEventInstance
    def initialize(stream)
      @stream = stream
      self
    end

    def write(event_name = :generic, data = {})
      @stream.write "event_name: #{ event_name }\n"
      data.each do |k,v|
        @stream.write "#{ k }: #{ v }\n"
      end
      self
    end

    def close
      @stream.close
    end
  end

end