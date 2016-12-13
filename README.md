# camstagram
                                   CAMSTAGRAM
                            Final Project for CIS 196:
                                 RoR Development
                                 By: Cameron Cabo
                                  PennKey: ccabo

Heroku: camstagram.herokuapp.com

Overview:
  -  My recreation of the Instagram web app with basic featurures
  
Features:
  -  User can post posts, follow users, like posts, comment on posts, etc.
     -  User also has a bio and name which are displayed on their show page and users page
  -  A user is followed by many users
  -  Index page shows posts created by the user and anyone the user follows sorted by soonest created
     -  Only a set number of posts show
     -  Post lists a count of how many likes it has
        -  Writes "likes" if 0 or greater than 1, "like" if equal to 1
     -  Link to add a comment, like post, perform these functions and redirect to the post show page
     -  Only shows up to three comments for a post, along with the posts caption
     -  Clicking on a post's image redirects the user to the post's show page
     -  If no user is signed in, there is welcome text and the user can see 10 posts, but cannot
        comment or like them
  -  User show page displays user's posts' images in a 3 column grid
     -  Links to follow user/unfollow user depending on if the current user is logged in and
        if they follow the user or not
     -  Links to view who lists of who follows the user and who the user follows
  -  Image storage on AWS S3 via the paperclip gem
  -  Password protection via BCrypt
  -  Validations to assume user name is unique, contains no uppercase letters, and contains no whitespace

Styling:
  -  Bootstrap for rails and css
