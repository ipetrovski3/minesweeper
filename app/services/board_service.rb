class BoardService
  attr_reader :board_params, :height, :width, :bombs

  def initialize(board_params)
    @height = board_params[:height].to_i
    @width = board_params[:width].to_i
    @bombs = board_params[:bombs].to_i
  end

  def self.call(*args)
    new(*args).create_board
  end

  def create_board
    generate_pattern
  end

  private

  def generate_pattern
    pattern = Array.new(height) { Array.new(width, 'o') }
    populate_pattern(pattern)
  end

  def populate_pattern(pattern)
    added_bombs = 0
    while added_bombs < bombs
      x = rand(height)
      y = rand(width)
      next if pattern[x][y] == 'x'

      pattern[x][y] = 'x'
      added_bombs += 1
    end
    pattern
  end
end
