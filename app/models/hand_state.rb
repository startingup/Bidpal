class HandState < ActiveRecord::Base
  attr_accessible :bits, :control, :counts, :email, :fl, :fv, :length, :loser, :points, :together, :totalcontrol, :totalcounts, :totalfl, :totalfv, :totalloser, :totalpots
#resourcify
end
