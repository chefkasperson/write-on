
Writing Jam concept

This would be a site where people could signup to write short stories based on a randomly given theme with a random amount of time to complete.

models 

Users(writers)
has many stories
has many Jams, through stories
username *unique
name *string
email *unique
password *encrypted
admin? *boolean



Stories
Belongs to a user
belongs to a jam
can be created/saved/edited/submitted while jam is active
will be displayed and rated after jam.
name *string
author *user_id
Jam *jam_id
rating *integer
submitted? *boolean


Jams (writing competition)
each jam has many stories
has many users, through stories
name *unique
stories *story_ids
writers *user_ids

