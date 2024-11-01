-- 1. Select all users and their age
SELECT username, 
       YEAR(CURDATE()) - YEAR(birthdate) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(birthdate, '%m%d')) AS age
FROM `users`;

-- 2. Select all posts without likes
SELECT *
FROM `posts`
LEFT JOIN `likes` ON posts.id = likes.post_id
WHERE likes.post_id IS NULL;