class Video < ApplicationRecord
  def self.all
    ::ZypeApi::Client.new.get_all
  end

  def self.get(id)
    ::ZypeApi::Client.new.get(id)
  end
end
