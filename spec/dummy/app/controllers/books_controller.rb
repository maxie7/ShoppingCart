class BooksController < ApplicationController

  def show
    @books = Book.all
  end

  def index
    @book = Book.find(params[:id])
  end
end
