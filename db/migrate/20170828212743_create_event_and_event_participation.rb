class CreateEventAndEventParticipation < ActiveRecord::Migration[5.1]
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Metrics/LineLength, Layout/ExtraSpacing
  def change
    create_table :events do |t|
      t.integer   :author_id,  null: false
      t.string    :guid,       null: false
      t.string    :summary,    null: false
      t.datetime  :start,      null: false
      t.datetime  :end
      t.boolean   :all_day
      t.string    :timezone
      t.text      :description
      t.string    :location_id
    end

    create_table :event_participations do |t|
      t.string    :author,                  null: false
      t.string    :guid,                    null: false
      t.integer   :event_id,                null: false
      t.string    :status,                  null: false
    end

    create_table :event_participation_signatures do |t|
      t.integer   :event_participation_id,  null: false
      t.text      :author_signature,        null: false
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Metrics/LineLength, Layout/ExtraSpacing
end
