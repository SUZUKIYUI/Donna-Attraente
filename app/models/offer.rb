class Offer < ApplicationRecord
  enum offer_status: {
    negotiation: 0,
    established: 1,
    failure: 2
  }
end
