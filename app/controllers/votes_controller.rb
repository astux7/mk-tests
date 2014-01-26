class VotesController < ApplicationController
#  before_action :chech_user_voted, only: [:new]
 #to sign in before these actions
  before_action :authenticate_user!, only: [:new]

  def new
    @post = Post.find params[:post_id]
    @vote = Vote.new
    @vote.upvote = params[:upvote].nil? ? 0 : 1
    @vote.downvote = params[:downvote].nil? ? 0 : 1
    @vote.post_id = @post.id
    @vote.user = current_user

    if @vote.save
            render status: 200, json: "OK"
    else
             render status: 500, json: "ERROR"
    end

  end

 # private

 #  def chech_user_voted
 #    return false
 #    # @post = Post.find_by(id: params[:id], user: current_user)
 #    @vote = current_user.vote.where('post_id = ? AND (upvote = 0 AND downvote = 1) AND (upvote = 1 AND downvote = 0 ) ',params[:post_id])
 #    if @vote.empty?
 #       # raise @vote.inspect
 #       false
 #    else
 #        flash[:notice]="You already voted!"
 #        @vote = []
 #        false
 #    end
 #  end
end
