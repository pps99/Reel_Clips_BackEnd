class ShowReel < ApplicationRecord
  has_many :clips, dependent: :destroy
  validates :name, :video_standard, :video_definition, presence: true
  validates :video_standard, inclusion: { in: %w(PAL NTSC) }
  validates :video_definition, inclusion: { in: %w(SD HD) }

  def total_duration
    frame_rate = video_standard == 'PAL' ? 25 : 30
    total_frames = clips.sum { |clip| clip.duration_in_frames }
    Timecode.from_frame_count(total_frames, frame_rate).to_s
  end
end
