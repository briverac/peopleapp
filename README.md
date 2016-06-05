# peopleapp
This app allow the users to keep the personal information of people. It will notify to all the persons of the system when a new user is registered in the system. Also it will notify when someone left the system (the person is deleted from the system).

It is delivery on Sunday july 5, 2016

##Instalation process

###Preconditions.

You must have mysql (with an user called 'root' and password 'root'), redis-server and ruby 2.2 installed and the gem bundler.

Also if you want to test the mail funtionality, you should have installed the gem mailcatcher and running

###Process

1. Step 1 Clone the repository from git, the link is: https://github.com/briverac/peopleapp

2. Step 2 go to the folder of the app in a console and run:

bundle install

Then create the 2 database required. They are people_app_db and people_app_test (Optional you can run rake db:setup)

Then you must run in the console:

rake db:migrate

Then run in the console:

rake db:seed

Then:

rails s

If you want to use the mailing funtionality, first run in console:

rake resque:work QUEUE=*