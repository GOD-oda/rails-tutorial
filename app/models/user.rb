class User < ApplicationRecord
  def hello
    self.name += "でござる"
  end

  def age_up
    self.age += 1
  end
end
