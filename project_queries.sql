
#Source C:\Users\thecz\Desktop\sql course\project_queries.sql 


#selecting the database
Use ig_clone;

# Five oldest Users
Select * 
from users
Order by created_at
Limit 5
 ;


# Days when users are more likely to Register


Select Dayname(created_at) as Day, 
Count(*) as 'New users'
From users 
Group By Day
Order By 'New users'
Limit 2;

# users with no photos/inactive users

Select Username, Image_url
from users 
left Join 
Photos
On Users.id = Photos.User_id
Where Photos.id is NULL;


Select 
Username,
photos.id,
photos.Image_url,
Count(*) as total
from photos
Inner Join Likes 
on photos.id = likes.photo_id
Inner join 
users
on photos.User_id = Users.Id
Group by Photos.Id
order by total Desc 
limit 1; 


#average times photo posted


SELECT tag_name, 
Count(*) AS total 
FROM   photo_tags 
 JOIN tags 
  ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 


# users who liked all the photos
Select Username,
Count(*) as 'number_likes'
from users
Join likes
on Users.Id = Likes.user_id
Group by Users.username
having number_likes = (select count(*) from Photos)
;  