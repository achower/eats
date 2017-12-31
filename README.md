# EATS
**Link to project:** https://agile-cliffs-11831.herokuapp.com/

![Eats Home Page](https://raw.githubusercontent.com/achower/eats/master/public/images/Home_Page.png)

An interpretation of the [Reservster project](https://github.com/search?utf8=%E2%9C%93&q=reservster&type=) (find other examples here) thats purpose was to explore some of the impressive capabilities of Ruby on Rails, as well as important programming concepts, including:

* Authentication

* Validation

* CRUD

* Authorization

* AJAX

* REST

This project was put together over several months while I was learning the Rails framework through the StartUp Institute. We started with learning CRUD, REST, how routes worked in Rails, then eventually learned about database relationships.

Registered users can create restaurants and "star" restaurants they like. Unregistered users can create reservations at restaurants.

## How It's Made:

**Tech used:** HTML, CSS, JavaScript, Ruby, Rails

**Important Gems:**

* Devise - for User Authentication

* Postgres - for Database (especially since I'm hosting this on Heroku)

* reCAPTCHA - for additional security

Set up the application on Heroku, then set up your reCAPTCHA reCAPTCHA account here:
* https://www.google.com/recaptcha/admin

Then add your reCAPTCHA SITE and SECRET key variables to a file named .env (only works with 'dotenv-rails' gem):
export RECAPTCHA_SITE_KEY  = 'key'
export RECAPTCHA_SECRET_KEY = 'key'

I used Bootstrap to quickly make the app presentable.

## Lessons Learned:

One of the more fun things I had to research was how to implement reCAPTCHA in your rails app. It wasn't too difficult to sign up for, but it certainly became complicated to get it to render and function. It came down to properly setting up the environment variables for the authentication keys with the help of the dotenv gem so you could safely publish it on Heroku.

I struggled the most with understanding/setting up the many to many relationship between "stars", "restaurants", and "users" while maintaining the one to many relationship between "users" and "restaurants" in my model. Not to mention getting the star actions to work with AJAX (which required using the div_for helper, but because it was removed from Rails 5 I needed to install the gem 'record_tag_helper'). With almost certainity, the most important lesson I learned from the experience was assessing when I've spent too much time researching on my own and knowing when to seek help from a more experienced programmer.

