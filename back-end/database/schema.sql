use DataStuffNotReal; -- Change to Database Name

CREATE TABLE users (
  user_id Int AUTO_INCREMENT,
  first_name Varchar(16),
  last_name Varchar(16),
  pass Varchar(255) NOT NULL,
  phone_num Varchar(16)NOT NULL,
  email Varchar(32),
  weight Int,
  birthday Int NOT NULL,
  points Int,
  PRIMARY KEY (user_id)
);

CREATE TABLE friend (
  creator_id Int,
  reciever_id Int,
  has_accepted Boolean DEFAULT False,
  is_close_friend Boolean DEFAULT False,
  PRIMARY KEY (creator_id, reciever_id),
  FOREIGN KEY (creator_id) REFERENCES users(user_id),
  FOREIGN KEY (reciever_id) REFERENCES users(user_id)
);

CREATE TABLE challenge (
  challenge_id Int AUTO_INCREMENT,
  time_created DATETIME DEFAULT CURRENT_TIMESTAMP,
  type Varchar(8),
  creator_id Int,
  name Varchar(32),
  PRIMARY KEY (challenge_id),
  FOREIGN KEY (creator_id) REFERENCES users(user_id)
);

CREATE TABLE challenge_participants (
  participant_id Int,
  challenge_id Int,
  time_joined DATETIME DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
  has_accepted Boolean DEFAULT False,
  PRIMARY KEY (participant_id, challenge_id),
  FOREIGN KEY (participant_id) REFERENCES users(user_id),
  FOREIGN KEY (challenge_id) REFERENCES challenge(challenge_id)
);

CREATE TABLE exercise (
  exercise_id Int AUTO_INCREMENT,
  name Varchar(32),
  point_rate Int DEFAULT 1,
  work_load Int DEFAULT 1,
  PRIMARY KEY (id)
);

CREATE TABLE challenge_exercise (
  challenge_id Int,
  exercise_id Int,
  creator_id Int,
  PRIMARY KEY (challenge_id, exercise_id),
  FOREIGN KEY (challenge_id) REFERENCES challenge(challenge_id),
  FOREIGN KEY (exercise_id) REFERENCES exercise(exercise_id),
  FOREIGN KEY (creator_id) REFERENCES users(user_id)
);