class EventParticipationSignature < ApplicationRecord
  include Diaspora::Signature

  self.primary_key = :event_participation_id
  belongs_to :event_participation
end
