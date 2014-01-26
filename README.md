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

>bin/rails g model Post title:string content:text
>bin/rake db:migrate
>bin/rake db:migrate RAILS_EVN=test


>rails generate divise:install
>rails g devise user
>bin/rake db:migrate

>bin/rake db:migrate RAILS_ENV=test

>bin/rails g bootstrap:install static

>rails g bootstrap:layout application --force

>rails g bootstrap:themed posts

>bin/rails g migration AddUserIdToPosts user:belongs_to
>bin/rake db:migrate
>bin/rake db:migrate RAILS_ENV=test 

>bin/rails g controller votes

#bootstrap for css js
#app/assets dir sit css and js get loaded by abc
#add Gem in Gemfile and do
>bin/rails g bootstrap:install static

#generate application layout - rename old
>bin/rails g bootstrap:layout application
#generate models like reviews or restaurant
>bin/rails g bootstrap:themed [RESOURCE_NAME]