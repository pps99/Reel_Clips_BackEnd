class CreateShowReels < ActiveRecord::Migration[6.1]
  def change
    create_table :show_reels do |t|
      t.string :name
      t.string :video_standard
      t.string :video_definition
      t.string :total_duration

      t.timestamps
    end
  end
end
