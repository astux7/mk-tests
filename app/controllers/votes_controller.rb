class VotesController < ApplicationController

  def new
                @post = Post.find params[:post_id]
                @vote = Vote.new
                @vote.upvote = params[:upvote].nil? ? 0 : 1
                @vote.downvote = params[:downvote].nil? ? 0 : 1
                @vote.post_id = @post.id
                @vote.user = current_user
           
                if @vote.save
                        redirect_to posts_path
                else
                        render 'new'
                end

  end
end
