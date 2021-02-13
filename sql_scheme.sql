CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `surname` TEXT NOT NULL,
    `name` TEXT NOT NULL,
    `level` INT NOT NULL,
    `class` INT NOT NULL,
    `uuid` BIGINT NOT NULL,
    `role` INT NOT NULL
);
ALTER TABLE
    `users` ADD PRIMARY KEY `users_id_primary`(`id`);
CREATE TABLE `students`(
    `uuid` INT UNSIGNED NOT NULL,
    `mentor` TEXT NOT NULL
);
ALTER TABLE
    `students` ADD PRIMARY KEY `students_uuid_primary`(`uuid`);
CREATE TABLE `mentors`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `uuid` INT NOT NULL
);
ALTER TABLE
    `mentors` ADD PRIMARY KEY `mentors_id_primary`(`id`);
CREATE TABLE `roles`(
    `id` INT UNSIGNED NOT NULL,
    `title` TEXT NOT NULL,
    `perm` INT NOT NULL
);
ALTER TABLE
    `roles` ADD PRIMARY KEY `roles_id_primary`(`id`);
CREATE TABLE `chat_room`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `mentor` TEXT NOT NULL,
    `student` BIGINT NOT NULL
);
ALTER TABLE
    `chat_room` ADD PRIMARY KEY `chat_room_id_primary`(`id`);
CREATE TABLE `message`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `room` BIGINT NOT NULL,
    `sender` BIGINT NOT NULL,
    `sent_ts` TIMESTAMP NOT NULL,
    `content` TEXT NOT NULL,
    `receiver` BIGINT NOT NULL
);
ALTER TABLE
    `message` ADD PRIMARY KEY `message_id_primary`(`id`);
CREATE TABLE `session`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `room` BIGINT NOT NULL,
    `date` TIMESTAMP NOT NULL,
    `mentor` TEXT NOT NULL,
    `student` TEXT NOT NULL
);
ALTER TABLE
    `session` ADD PRIMARY KEY `session_id_primary`(`id`);
CREATE TABLE `avalaible_rooms`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` INT NOT NULL
);
ALTER TABLE
    `avalaible_rooms` ADD PRIMARY KEY `avalaible_rooms_id_primary`(`id`);
CREATE TABLE `taken_rooms`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` INT NOT NULL,
    `session` INT NOT NULL
);
ALTER TABLE
    `taken_rooms` ADD PRIMARY KEY `taken_rooms_id_primary`(`id`);
CREATE TABLE `rooms`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` INT NOT NULL
);
ALTER TABLE
    `rooms` ADD PRIMARY KEY `rooms_id_primary`(`id`);
CREATE TABLE `daily_sessions`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `session` BIGINT NOT NULL
);
ALTER TABLE
    `daily_sessions` ADD PRIMARY KEY `daily_sessions_id_primary`(`id`);
CREATE TABLE `current_class`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `level` INT NOT NULL,
    `class` INT NOT NULL
);
ALTER TABLE
    `current_class` ADD PRIMARY KEY `current_class_id_primary`(`id`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_uuid_foreign` FOREIGN KEY(`uuid`) REFERENCES `students`(`uuid`);
ALTER TABLE
    `chat_room` ADD CONSTRAINT `chat_room_student_foreign` FOREIGN KEY(`student`) REFERENCES `students`(`uuid`);
ALTER TABLE
    `session` ADD CONSTRAINT `session_student_foreign` FOREIGN KEY(`student`) REFERENCES `students`(`uuid`);
ALTER TABLE
    `users` ADD CONSTRAINT `users_role_foreign` FOREIGN KEY(`role`) REFERENCES `roles`(`id`);
ALTER TABLE
    `message` ADD CONSTRAINT `message_room_foreign` FOREIGN KEY(`room`) REFERENCES `chat_room`(`id`);
ALTER TABLE
    `daily_sessions` ADD CONSTRAINT `daily_sessions_session_foreign` FOREIGN KEY(`session`) REFERENCES `session`(`id`);