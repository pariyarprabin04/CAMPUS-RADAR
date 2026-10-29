-- Campus Opportunity Radar: simple MySQL database (50 people)
-- Run:  mysql -u root -p < campus_radar.sql
CREATE DATABASE IF NOT EXISTS campus_radar CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE campus_radar;

DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS people;

CREATE TABLE people (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name  VARCHAR(50) NOT NULL,
  email      VARCHAR(120) NOT NULL UNIQUE,
  major      VARCHAR(80) NOT NULL,
  study_year TINYINT UNSIGNED NULL,
  role       ENUM('student','staff','admin') NOT NULL DEFAULT 'student',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE accounts (
  person_id     INT UNSIGNED PRIMARY KEY,
  password_hash CHAR(64) NOT NULL,
  failed_logins TINYINT UNSIGNED NOT NULL DEFAULT 0,
  last_login    DATETIME NULL,
  FOREIGN KEY (person_id) REFERENCES people(id) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO people (id, first_name, last_name, email, major, study_year, role) VALUES
(1, 'Hyunwoo', 'Park', 'hyunwoo.park1@campus.demo', 'Mechanical Engineering', NULL, 'admin'),
(2, 'Minseo', 'Kim', 'minseo.kim2@campus.demo', 'Electrical Engineering', NULL, 'staff'),
(3, 'Hana', 'Lee', 'hana.lee3@campus.demo', 'Mathematics', NULL, 'staff'),
(4, 'Jaehyun', 'Kim', 'jaehyun.kim4@campus.demo', 'Economics', NULL, 'staff'),
(5, 'Siwoo', 'Kim', 'siwoo.kim5@campus.demo', 'Electrical Engineering', NULL, 'staff'),
(6, 'Jiyoung', 'Cho', 'jiyoung.cho6@campus.demo', 'Design', 1, 'student'),
(7, 'Jiwoo', 'Jang', 'jiwoo.jang7@campus.demo', 'Computer Science', 4, 'student'),
(8, 'Jaehyun', 'Lee', 'jaehyun.lee8@campus.demo', 'Chemistry', 2, 'student'),
(9, 'Seoyeon', 'Lim', 'seoyeon.lim9@campus.demo', 'Computer Science', 4, 'student'),
(10, 'Chaewon', 'Kim', 'chaewon.kim10@campus.demo', 'Biology', 2, 'student'),
(11, 'Jiyoung', 'Park', 'jiyoung.park11@campus.demo', 'Chemistry', 1, 'student'),
(12, 'Soyeon', 'Jang', 'soyeon.jang12@campus.demo', 'Electrical Engineering', 2, 'student'),
(13, 'Jaehyun', 'Lim', 'jaehyun.lim13@campus.demo', 'Mathematics', 2, 'student'),
(14, 'Haeun', 'Jang', 'haeun.jang14@campus.demo', 'Chemistry', 1, 'student'),
(15, 'Siwoo', 'Yoon', 'siwoo.yoon15@campus.demo', 'Mathematics', 4, 'student'),
(16, 'Eunwoo', 'Lim', 'eunwoo.lim16@campus.demo', 'Mathematics', 4, 'student'),
(17, 'Soyeon', 'Choi', 'soyeon.choi17@campus.demo', 'Design', 2, 'student'),
(18, 'Jiwoo', 'Lim', 'jiwoo.lim18@campus.demo', 'Economics', 3, 'student'),
(19, 'Dahye', 'Kang', 'dahye.kang19@campus.demo', 'Biology', 4, 'student'),
(20, 'Yerin', 'Lee', 'yerin.lee20@campus.demo', 'Economics', 1, 'student'),
(21, 'Bomi', 'Kang', 'bomi.kang21@campus.demo', 'Psychology', 2, 'student'),
(22, 'Jiyoung', 'Kim', 'jiyoung.kim22@campus.demo', 'Economics', 1, 'student'),
(23, 'Jaehyun', 'Kang', 'jaehyun.kang23@campus.demo', 'Mathematics', 3, 'student'),
(24, 'Yerin', 'Yoon', 'yerin.yoon24@campus.demo', 'Electrical Engineering', 4, 'student'),
(25, 'Jiwoo', 'Jung', 'jiwoo.jung25@campus.demo', 'Electrical Engineering', 4, 'student'),
(26, 'Seoyeon', 'Jung', 'seoyeon.jung26@campus.demo', 'Biology', 4, 'student'),
(27, 'Sua', 'Cho', 'sua.cho27@campus.demo', 'Computer Science', 3, 'student'),
(28, 'Eunwoo', 'Kang', 'eunwoo.kang28@campus.demo', 'Chemistry', 2, 'student'),
(29, 'Haeun', 'Yoon', 'haeun.yoon29@campus.demo', 'Design', 1, 'student'),
(30, 'Bomi', 'Jung', 'bomi.jung30@campus.demo', 'Design', 2, 'student'),
(31, 'Taemin', 'Cho', 'taemin.cho31@campus.demo', 'Electrical Engineering', 4, 'student'),
(32, 'Yuna', 'Yoon', 'yuna.yoon32@campus.demo', 'Economics', 4, 'student'),
(33, 'Junho', 'Park', 'junho.park33@campus.demo', 'Economics', 4, 'student'),
(34, 'Junho', 'Cho', 'junho.cho34@campus.demo', 'Mechanical Engineering', 3, 'student'),
(35, 'Chaewon', 'Park', 'chaewon.park35@campus.demo', 'Business', 1, 'student'),
(36, 'Doyun', 'Choi', 'doyun.choi36@campus.demo', 'Computer Science', 2, 'student'),
(37, 'Dahye', 'Lim', 'dahye.lim37@campus.demo', 'Biology', 2, 'student'),
(38, 'Soyeon', 'Kim', 'soyeon.kim38@campus.demo', 'Mechanical Engineering', 2, 'student'),
(39, 'Hana', 'Kang', 'hana.kang39@campus.demo', 'Business', 3, 'student'),
(40, 'Sua', 'Jang', 'sua.jang40@campus.demo', 'Psychology', 1, 'student'),
(41, 'Bomi', 'Jang', 'bomi.jang41@campus.demo', 'Mechanical Engineering', 4, 'student'),
(42, 'Minseo', 'Cho', 'minseo.cho42@campus.demo', 'Design', 1, 'student'),
(43, 'Jiwoo', 'Choi', 'jiwoo.choi43@campus.demo', 'Business', 4, 'student'),
(44, 'Haeun', 'Kang', 'haeun.kang44@campus.demo', 'Electrical Engineering', 1, 'student'),
(45, 'Minjun', 'Lim', 'minjun.lim45@campus.demo', 'Economics', 2, 'student'),
(46, 'Yerin', 'Kim', 'yerin.kim46@campus.demo', 'Design', 1, 'student'),
(47, 'Yerin', 'Cho', 'yerin.cho47@campus.demo', 'Biology', 2, 'student'),
(48, 'Nayeon', 'Lim', 'nayeon.lim48@campus.demo', 'Psychology', 3, 'student'),
(49, 'Haeun', 'Lee', 'haeun.lee49@campus.demo', 'Psychology', 4, 'student'),
(50, 'Dahye', 'Yoon', 'dahye.yoon50@campus.demo', 'Electrical Engineering', 3, 'student');

-- Demo passwords only. Every account uses the password: radar2026
-- In a real app, hash with bcrypt/argon2 in your backend, never plain SHA-256.
INSERT INTO accounts (person_id, password_hash)
SELECT id, SHA2('radar2026', 256) FROM people;

-- Check: SELECT COUNT(*) FROM people;  -- should return 50
-- Login query (run server-side with prepared statements):
-- SELECT p.id, p.first_name, p.role FROM people p JOIN accounts a ON a.person_id=p.id
--  WHERE p.email = ? AND a.password_hash = SHA2(?, 256);

-- ===== Social media intake (opportunities come from group posts) =====
USE campus_radar;
DROP TABLE IF EXISTS opportunities;
DROP TABLE IF EXISTS social_posts;
DROP TABLE IF EXISTS sources;

CREATE TABLE sources (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  platform ENUM('Telegram','Discord','Instagram','Facebook','KakaoTalk','Band','Other') NOT NULL,
  group_name VARCHAR(120) NOT NULL,
  intake ENUM('bot','forwarded','pasted') NOT NULL,
  admin_permission TINYINT(1) NOT NULL DEFAULT 0,
  UNIQUE KEY (platform, group_name)
) ENGINE=InnoDB;

CREATE TABLE social_posts (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  source_id INT UNSIGNED NOT NULL,
  post_text TEXT NOT NULL,          -- text only, no member names
  post_url VARCHAR(300) NULL,       -- link back to the original post
  posted_on DATE NOT NULL,
  state ENUM('new','approved','rejected') NOT NULL DEFAULT 'new',
  FOREIGN KEY (source_id) REFERENCES sources(id)
) ENGINE=InnoDB;

CREATE TABLE opportunities (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  post_id INT UNSIGNED NULL,        -- the group post it came from
  title VARCHAR(150) NOT NULL,
  org VARCHAR(100) NOT NULL,
  category ENUM('Research','Workshop','Competition','Scholarship','Campus event','Internship') NOT NULL,
  description VARCHAR(300) NULL,
  deadline DATE NOT NULL,
  eligibility VARCHAR(200) NULL,
  keywords VARCHAR(150) NULL,
  status ENUM('draft','published') NOT NULL DEFAULT 'draft',
  reviewed_by INT UNSIGNED NULL,    -- developer who published it
  FOREIGN KEY (post_id) REFERENCES social_posts(id),
  FOREIGN KEY (reviewed_by) REFERENCES people(id)
) ENGINE=InnoDB;
-- Flow: post arrives (state='new') -> developer reviews -> opportunity row created -> post state='approved'.
