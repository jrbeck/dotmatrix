require './font_reader.rb'
require './sample_font.rb'
require 'pp'

class EmojiWriter
  DEFAULT_POSITIVE_SPACE = '.'.freeze
  DEFAULT_NEGATIVE_SPACE = ' '.freeze

  def initialize(positive_space, negative_space)
    @positive_space = positive_space || DEFAULT_POSITIVE_SPACE
    @negative_space = negative_space || DEFAULT_NEGATIVE_SPACE
    font_reader = FontReader.new('8x8.png')
    @font = font_reader.to_hash
    @left_padding = 1
    # @font = SampleFont::FONT
  end

  def meh
    eh = @font.map do |k, v|
      k
    end
    pp eh
  end

  def render(string)
    string.chars.each do |char|
      puts render_character(char)
    end
  end

  def render_to_file(path)
    File.open(path, 'w') do |f|
      string.chars.each do |char|
        f.write(render_character(char, @font).join)
      end
    end
  end

  private
    def to_binary_string(number)
      binary_string = number.to_s(2)
      if binary_string.length < 64
        binary_string = ('0' * (64 - binary_string.length)) + binary_string
      end
      binary_string
    end

    def render_character(character)
      raster_lines = []
      chunks = to_binary_string(@font[character] || @font[' ']).scan(/.{8}/)
      chunks.each do |chunk|
        raster_line = @negative_space * @left_padding
        chunk.chars.each do |char|
          raster_line += char == '1' ? @positive_space : @negative_space
        end
        raster_lines << (raster_line.rstrip + "\n")
      end
      raster_lines
    end
end

if ARGV[0].nil?
  p 'Usage: dot_matrix text positive_space negative_space'
  EmojiWriter.new(nil, nil).meh
else
  x = EmojiWriter.new(ARGV[1] || nil, ARGV[2] || nil)
  x.render(' ' + ARGV[0])
end
