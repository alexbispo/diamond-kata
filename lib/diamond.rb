# frozen_string_literal: true

class Diamond
  START = "A"

  def build(input)
    return "#{START}\n" if input == START

    letters = (START..input).to_a
    line_size = calc_line_size(letters)

    start_position = calc_start_position(line_size)
    start_line = build_line(line_size)
    start_line[start_position] = START

    diamond_top_lines = build_diamond_top_lines(start_line,
                                                start_position,
                                                line_size,
                                                input)

    diamond_lines = diamond_top_lines + build_diamond_bottom_lines(diamond_top_lines)

    build_diamond(diamond_lines)
  end

  private

  def calc_line_size(letters)
    last_letter_position = letters.count - 1
    letters.count + last_letter_position
  end

  def build_line(line_size)
    "_" * line_size
  end

  def build_diamond_bottom_lines(dimond_top_lines)
    dimond_top_lines[0...-1].reverse
  end

  def build_diamond(diamond_lines)
    diamond_lines.join("\n") << "\n"
  end

  def build_diamond_top_lines(start_line, start_position, line_size, input)
    diamond_top_lines = [start_line]

    (START.next..input).to_enum.with_index(1).each do |letter, i|
      line = build_line(line_size)
      line[start_position + i] = letter
      line[start_position - i] = letter
      diamond_top_lines << line
    end
    diamond_top_lines
  end

  def calc_start_position(line_size)
    line_size / 2
  end
end
