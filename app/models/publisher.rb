class Publisher < ActiveRecord::Base

  belongs_to :author
  belongs_to :publisher

  def self.seed_publishers

  end

end
