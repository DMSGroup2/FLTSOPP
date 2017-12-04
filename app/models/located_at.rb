class LocatedAt < ApplicationRecord
  belongs_to :officer
  belongs_to :violation
end
