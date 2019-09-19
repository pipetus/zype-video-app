class Video < ApplicationRecord
  def self.all
    ::ZypeApi::Client.new.get_all[:response]
  end
end
