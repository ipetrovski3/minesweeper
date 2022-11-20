class BoardsController < ApplicationController
  def index
    @boards = Board.paginate(page: params[:page], per_page: 10)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_attributes)

    if @board.save
      redirect_to board_path(@board)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:name, :email, :height, :width, :bombs)
  end

  def board_attributes
    board_params.merge(pattern: pattern)
  end

  def pattern
    BoardService.call(board_params)
  end
end
