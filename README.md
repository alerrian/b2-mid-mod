# README

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.1.7.

RSpec and Shoulda-Matchers have been installed and set up.


Overview
We are creating an application to track movies. We have  **studios, which have movies**, and movies have several actors, and actors can be in several movies.
Read each story carefully.

# Story 4
As a user,
When I visit a movie show page,
I see a form for an actors name
and when I fill in the form with an existing actor's name
I am redirected back to that movie's show page
And I see the actor's name listed
(This should not break story 3, You do not have to test for a sad path)

# Story 5
As a user,
When I visit an actor's show page
I see a unique list of all of the actors this particular actor has worked with.
