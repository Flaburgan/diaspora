class EventParticipation < ApplicationRecord
  include Diaspora::Federated::Base
  include Diaspora::Fields::Guid
end
