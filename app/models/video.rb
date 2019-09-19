class Video 
  attr_reader :id, :title, :description, :nice_duration, :thumbnails

  def self.all
    ::ZypeApi::Client.new.get_all.map do |attributes|
      self.new(attributes)
    end
  end

  def self.get(id)
    attributes = ::ZypeApi::Client.new.get(id)
    self.new(attributes)
  end

  def initialize(options = {})
    @title = options[:title]
    @description = options[:description]
    @id = options[:_id]
    seconds, minutes, hours = if !options[:duration].nil?
                                [options[:duration] % 60, 
                                (options[:duration] / 60) % 60,
                                options[:duration] / (60 * 60)]
                              else
                                [0, 0, 0]
                              end
    @nice_duration = if hours > 0
                       format("%02d:%02d:%02d", hours, minutes, seconds)
                     else
                       format("%02d:%02d", minutes, seconds)
                     end
    @thumbnails = options[:thumbnails] || []
  end
end
