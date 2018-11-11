class PostsController < ApplicationController
    def index
    end

    def new
        @post = Post.new
end

    def edit 
    end

    def update
        if @post.update 
            redirect_to @post 
        else
            render 'edit'
        end
    end 

    def destroy
        @post.destroy
        redirect_to root_path
    end 

    def show
    end

    def find_post
        @post = Post.find(params[:id])

        before_action :find_post, only: [:show, :edit, :update, :destroy]
    end

    def create
    @post = Post.new(post_params)

    if @post.save
        redirect_to @post
    else
        render 'new'
    end
end

private

def post_params
    params.require(:post).permit(:title, :context)
end
end