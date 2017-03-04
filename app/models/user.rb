class User < ActiveRecord::Base

  def full_name
    "#{firstname} #{lastname}"
  end
end
