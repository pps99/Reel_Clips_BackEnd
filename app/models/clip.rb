class Clip < ApplicationRecord
  belongs_to :show_reel
  validates :name, :video_standard, :video_definition, :start_timecode, :end_timecode, presence: true
  validates :video_standard, inclusion: { in: %w(PAL NTSC) }
  validates :video_definition, inclusion: { in: %w(SD HD) }
  validate :validate_video_standard_and_definition

  def duration_in_frames
    frame_rate = video_standard == 'PAL' ? 25 : 30
    start_tc = Timecode.new(start_timecode, frame_rate)
    end_tc = Timecode.new(end_timecode, frame_rate)
    end_tc.to_frame_count - start_tc.to_frame_count
  end

  private

  def validate_video_standard_and_definition
      if video_standard != show_reel.video_standard || video_definition != show_reel.video_definition
        errors.add(:base, "Sorry, You Cannot Add This Clip")
      end
  end
end
