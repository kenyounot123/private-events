class AddAssociationsToAttendeeEvent < ActiveRecord::Migration[7.1]
  def change
    add_reference :attendee_events, :attendee, foreign_key: { to_table: :users }, index: true, null: false
    add_reference :attendee_events, :attended_event, foreign_key: { to_table: :events }, index: true, null: false
  end
end
