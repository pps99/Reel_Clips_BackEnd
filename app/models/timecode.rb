# app/models/timecode.rb
class Timecode
    attr_reader :hours, :minutes, :seconds, :frames, :frame_rate
  
    def initialize(timecode_string, frame_rate = 25)  # Defaults to PAL
      @hours, @minutes, @seconds, @frames = timecode_string.split(':').map(&:to_i)
      @frame_rate = frame_rate
    end
  
    def to_frame_count
      @hours * @frame_rate * 3600 + @minutes * @frame_rate * 60 + @seconds * @frame_rate + @frames
    end
  
    def self.from_frame_count(frame_count, frame_rate = 25)
      hours = frame_count / (frame_rate * 3600)
      minutes = (frame_count % (frame_rate * 3600)) / (frame_rate * 60)
      seconds = ((frame_count % (frame_rate * 3600)) % (frame_rate * 60)) / frame_rate
      frames = frame_count % frame_rate
      new("#{hours}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}:#{frames}", frame_rate)
    end
  
    def +(other)
      self.class.from_frame_count(self.to_frame_count + other.to_frame_count, @frame_rate)
    end
  
    def -(other)
      self.class.from_frame_count(self.to_frame_count - other.to_frame_count, @frame_rate)
    end
  
    def to_s
      "#{@hours.to_s.rjust(2, '0')}:#{@minutes.to_s.rjust(2, '0')}:#{@seconds.to_s.rjust(2, '0')}:#{@frames.to_s.rjust(2, '0')}"
    end
  end
  