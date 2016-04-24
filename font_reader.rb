require 'chunky_png'

# good resource for fonts
# http://nerdlypleasures.blogspot.com/2015/04/ibm-character-fonts.html

class FontReader
  KEYS = ["NUL", "SOH", "STX", "ETX", "EOT", "ENQ", "ACK", "BEL", "BS", "TAB", "LF", "VT", "FF", "CR", "SO",
    "SI", "DLE", "DC1", "DC2", "DC3", "DC4", "NAK", "SYN", "ETB", "CAN", "EM", "SUB", "ESC", "FS",
    "GS", "RS", "US", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".",
    "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S",
    "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f",
    "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y",
    "z", "{", "|", "}", "~", "DEL"]

  NUM_CHAR_LINES = 8
  CHARS_PER_LINE = 32

  CHAR_WIDTH = 8
  CHAR_HEIGHT = 8

  def initialize(path)
    @font_png = ChunkyPNG::Image.from_file(path)
  end

  def to_hash
    {}.tap do |hash|
      source_to_char_array.each_with_index do |char, index|
        hash[KEYS[index]] = char
      end
    end
  end

  private
    def char_at(x, y)
      x *= CHAR_WIDTH
      y *= CHAR_HEIGHT
      bitmap = []
      CHAR_HEIGHT.times do |j|
        line = []
        CHAR_WIDTH.times do |i|
          line << (@font_png[x + i, y + j] > 255 ? '1' : '0')
        end
        bitmap << line.join
      end
      binary_string_to_integer(bitmap.join)
    end

    def source_to_char_array
      [].tap do |chars|
        NUM_CHAR_LINES.times do |y|
          CHARS_PER_LINE.times do |x|
            chars << char_at(x, y)
          end
        end
      end
    end

    def binary_string_to_integer(string)
      string.to_i(2)
    end
end
