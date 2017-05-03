class Event < ActiveRecord::Base
  acts_as_paranoid

  before_destroy do
    self.update_attribute(:deleted_at, Time.current)
  end

end