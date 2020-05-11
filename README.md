# README

There is a blog app with the following entities:

* User, has only login.
* Post, belongs to User, has title, body, author IP (saved separately for each User).
* Rating, belongs to Post, can only be in range from 1 to 5.
* The aim is create JSON API with the following actions:

* Create a post. Accepts title and body, user login and IP. If user doesn't exist, it should be created. Returns either the post's attributes with status 200, or validation error with status 422.
* Rate a post. Accepts the post id and the value, returns new average rating.
* Get top N posts, returns an array of titles and bodies.
* Get the list of IPs that were used by multiple authors. Returns an array of hashes with author ip as the key and array of appropriate logins.

The database should be seeded with 200_000 posts, 100 authors, 50 different IPs. seeds.rb should use the same code the controllers use.