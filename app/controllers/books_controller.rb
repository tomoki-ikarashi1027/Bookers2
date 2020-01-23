class BooksController < ApplicationController
      before_action :authenticate_user!
    def index
    	@books = Book.all
    	@book = Book.new
    end
    def show
    end
    def new
        @book = Book.new
    end
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
         if@book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book)
        else
            render :index
        end
    end
    def edit
    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to book_path
    end
    private
    def book_params
        params.require(:book).permit(:title,:body)
    end
end
