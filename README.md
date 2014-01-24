<h1> WEEK 9 TEST </h4>
<p>Task is to create a social news site like Reddit, HackerNews.</p>

<ol>
<li>Users can sign up/in</li>
<li>Users can post stories</li>
<li>Users can upvote stories</li>
<li>Stories with most votes go to the top</li>
<li>implement with tests </li>
</ol>

<h4>Extension tasks</h4>
<ol>
<li>Add some validations</li>
<li>Users can attach images to their post</li>
<li>Users can downwote stories</li>
<li>User can only vote on a story once</li>
<li>Users can edit and delete stories they created</li>
<li>Implement a 'hotness' - which combines points and newness. E.g. a post that gets 10 points in 10 min is 'hotter' than a post that gets 15 points in an hour.</li>
</ol>

<h4> the commands were using in this project</h4>

>rails new reddit -d postgresql -T

>bin/rake rails:update:bin

>bin/rake db:create
>bin/rake db:migrate

>bundle
>bin/rails generate rspec:install

>bin/rake routes

>bin/rails g controller posts

