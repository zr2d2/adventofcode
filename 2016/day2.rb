KEY = {[0,0] => 1, [0,1] => 2, [0,2] => 3, [1,0] => 4, [1,1] => 5, [1,2] => 6, [2,0] => 7, [2,1] => 8, [2,2] => 9}

class Button
  attr_reader :row, :column

  def initialize(directions, row, column)
    @directions = directions
    @row = row
    @column = column
  end

  def find_key
    moves  = @directions.chars
    row    = @row
    column = @column

    #puts "at #{row}, #{column}"

    moves.each do |move|
      case move
      when 'U'
        #puts "move up from [#{row}.#{column}]"
        row -= 1
        #puts "to [#{row}.#{column}]"
      when 'D'
        row += 1
      when 'L'
        column -= 1
      when 'R'
        column += 1
      end

      column = 0 if column < 0
      column = 2 if column > 2

      row = 0 if row < 0
      row = 2 if row > 2

    end

    @row = row
    @column = column
  end

  def key
    position = [@row, @column]

    return KEY[position]
  end

end

file = File.open 'day2.txt','r'

row    = 1
column = 1

file.each_line do |line|
  #puts "starting at #{row}, #{column}"
  q = Button.new line, row, column

  q.find_key

  puts "button is #{q.key}"

  row = q.row
  column = q.column
end

file.close