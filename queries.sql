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

-- 4. Order users by number of media uploaded
SELECT users.id AS user_id, users.username, COUNT(medias.id) AS media_count
FROM users
LEFT JOIN medias ON users.id = medias.user_id
GROUP BY users.id
ORDER BY media_count DESC;

-- 5. Order users by the total number of likes their posts have received
SELECT users.id AS user_id, users.username, COUNT(likes.post_id) AS total_likes_received
FROM users
LEFT JOIN posts ON users.id = posts.user_id
LEFT JOIN likes ON posts.id = likes.post_id
GROUP BY users.id
ORDER BY total_likes_received DESC;

-- 6. Select all posts of users between 20yo and 30yo 
SELECT posts.*, YEAR(CURDATE()) - YEAR(users.birthdate) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(users.birthdate, '%m%d')) AS user_age
FROM posts
JOIN users ON posts.user_id = users.id
WHERE (YEAR(CURDATE()) - YEAR(users.birthdate) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(users.birthdate, '%m%d')) BETWEEN 20 AND 30);

-- 7. Select number of posts and media for each user
SELECT users.id AS user_id, users.username, COUNT(DISTINCT posts.id) AS post_count, COUNT(DISTINCT medias.id) AS media_count
FROM users
LEFT JOIN posts ON users.id = posts.user_id
LEFT JOIN medias ON users.id = medias.user_id
GROUP BY users.id;