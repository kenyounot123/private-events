class CreateAttendeeEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :attendee_events do |t|

      t.timestamps
    end
  end
end
