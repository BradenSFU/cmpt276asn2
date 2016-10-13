class Trainer < ApplicationRecord
  has_many :tokimons, :dependent => :destroy
end
