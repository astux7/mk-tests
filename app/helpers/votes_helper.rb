module VotesHelper
  def up_rating(post)
    Vote.where('post_id = ? AND upvote = 1', post.id).count
      
   # return 'Unrated' if vote ==

   # empty = 5 - rating
   # ('★' * rating) + ('☆' * empty)
  end
   def down_rating(post)
    Vote.where('post_id = ? AND downvote = 1', post.id).count
      
   # return 'Unrated' if vote ==

   # empty = 5 - rating
   # ('★' * rating) + ('☆' * empty)
  end
end
