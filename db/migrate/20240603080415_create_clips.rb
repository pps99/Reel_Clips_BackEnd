class CreateClips < ActiveRecord::Migration[6.1]
  def change
    create_table :clips do |t|
      t.string :name
      t.text :description
      t.string :video_standard
      t.string :video_definition
      t.string :start_timecode
      t.string :end_timecode
      t.references :show_reel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
