-- 1. Select all users and their age
SELECT username, YEAR(CURDATE()) - YEAR(birthdate) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(birthdate, '%m%d')) AS age
FROM `users`;

-- 2. Select all posts without likes
SELECT *
FROM `posts`
LEFT JOIN `likes` ON posts.id = likes.post_id
WHERE likes.post_id IS NULL;

-- 3. Count number of likes for each post
SELECT posts.id AS post_id, COUNT(likes.post_id) AS like_count
FROM posts
LEFT JOIN likes ON posts.id = likes.post_id
GROUP BY posts.id;

