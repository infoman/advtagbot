class User < ApplicationRecord
  validates_uniqueness_of :tg_id, message: "Already registered"
end
