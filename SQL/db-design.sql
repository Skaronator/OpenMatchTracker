CREATE TABLE `omt_matches` (
	`mid` INT NOT NULL,
	`date` DATETIME NOT NULL,
	`duration` TIME NOT NULL,
	`mapid` INT NOT NULL,
	`hid` INT NOT NULL,
	`team_won` tinyint NOT NULL,
	`tickrate` tinyint NOT NULL,
	PRIMARY KEY (`mid`)
);

CREATE TABLE `omt_maps` (
	`mapid` INT NOT NULL,
	`name` varchar(20) NOT NULL UNIQUE,
	`logo` varchar(30) NOT NULL,
	PRIMARY KEY (`mapid`)
);

CREATE TABLE `omt_players` (
	`pid` INT NOT NULL,
	`name` varchar(128) NOT NULL,
	`steamid` INT NOT NULL UNIQUE,
	`role` INT,
	`staticname` tinyint NOT NULL DEFAULT '0',
	PRIMARY KEY (`pid`)
);

CREATE TABLE `omt_match_player` (
	`tpid` INT NOT NULL,
	`pid` INT NOT NULL DEFAULT '0',
	`mid` INT NOT NULL,
	`first_side` tinyint NOT NULL,
	`adr_rating` DECIMAL(5,2) NOT NULL,
	`hltv_rating` DECIMAL(4,3) NOT NULL,
	`rws_rating` DECIMAL(4,2) NOT NULL,
	`kill_count` tinyint NOT NULL,
	`assist_count` tinyint NOT NULL,
	`death_count` tinyint NOT NULL,
	`trade_kill_count` tinyint NOT NULL,
	`trade_death_count` tinyint NOT NULL,
	`hs_count` tinyint NOT NULL,
	`tk_count` tinyint NOT NULL,
	`round_count` tinyint NOT NULL,
	`bomb_planted` tinyint NOT NULL,
	`bomb_defused` tinyint NOT NULL,
	`flashbang_count` tinyint,
	`smoke_count` tinyint,
	`he_count` tinyint,
	`molotov_count` tinyint,
	`decoy_count` tinyint,
	`incendiary_count` tinyint,
	`1k_count` tinyint,
	`2k_count` tinyint,
	`3k_count` tinyint,
	`4k_count` tinyint,
	`5k_count` tinyint,
	`1v1_won` tinyint,
	`1v1_loss` tinyint,
	`1v2_won` tinyint,
	`1v2_loss` tinyint,
	`1v3_won` tinyint,
	`1v3_loss` tinyint,
	`1v4_won` tinyint,
	`1v4_loss` tinyint,
	`1v5_won` tinyint,
	`1v5_loss` tinyint,
	PRIMARY KEY (`tpid`)
);

CREATE TABLE `omt_weapons` (
	`wid` tinyint NOT NULL,
	`name` varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY (`wid`)
);

CREATE TABLE `omt_host` (
	`hid` INT NOT NULL,
	`name` varchar(20) NOT NULL UNIQUE,
	`logo` varchar(30) NOT NULL,
	PRIMARY KEY (`hid`)
);

CREATE TABLE `omt_side` (
	`sid` tinyint NOT NULL,
	`shortname` varchar(5) NOT NULL UNIQUE,
	`name` varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY (`sid`)
);

CREATE TABLE `omt_weaponsstats` (
	`statsid` INT NOT NULL,
	`pid` INT NOT NULL,
	`mid` INT NOT NULL,
	`wid` INT NOT NULL,
	`kills` INT NOT NULL,
	PRIMARY KEY (`statsid`)
);

CREATE TABLE `omt_role` (
	`rid` INT NOT NULL,
	`name` varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY (`rid`)
);

CREATE TABLE `omt_rounds` (
	`mrid` INT NOT NULL,
	`mid` INT NOT NULL,
	`round` tinyint NOT NULL,
	`won` tinyint NOT NULL,
	PRIMARY KEY (`mrid`)
);

ALTER TABLE `omt_matches` ADD CONSTRAINT `omt_matches_fk0` FOREIGN KEY (`mapid`) REFERENCES `omt_maps`(`mapid`);

ALTER TABLE `omt_matches` ADD CONSTRAINT `omt_matches_fk1` FOREIGN KEY (`hid`) REFERENCES `omt_host`(`hid`);

ALTER TABLE `omt_matches` ADD CONSTRAINT `omt_matches_fk2` FOREIGN KEY (`team_won`) REFERENCES `omt_side`(`sid`);

ALTER TABLE `omt_players` ADD CONSTRAINT `omt_players_fk0` FOREIGN KEY (`role`) REFERENCES `omt_role`(`rid`);

ALTER TABLE `omt_match_player` ADD CONSTRAINT `omt_match_player_fk0` FOREIGN KEY (`pid`) REFERENCES `omt_players`(`pid`);

ALTER TABLE `omt_match_player` ADD CONSTRAINT `omt_match_player_fk1` FOREIGN KEY (`mid`) REFERENCES `omt_matches`(`mid`);

ALTER TABLE `omt_match_player` ADD CONSTRAINT `omt_match_player_fk2` FOREIGN KEY (`first_side`) REFERENCES `omt_side`(`sid`);

ALTER TABLE `omt_weaponsstats` ADD CONSTRAINT `omt_weaponsstats_fk0` FOREIGN KEY (`pid`) REFERENCES `omt_players`(`pid`);

ALTER TABLE `omt_weaponsstats` ADD CONSTRAINT `omt_weaponsstats_fk1` FOREIGN KEY (`mid`) REFERENCES `omt_matches`(`mid`);

ALTER TABLE `omt_weaponsstats` ADD CONSTRAINT `omt_weaponsstats_fk2` FOREIGN KEY (`wid`) REFERENCES `omt_weapons`(`wid`);

ALTER TABLE `omt_rounds` ADD CONSTRAINT `omt_rounds_fk0` FOREIGN KEY (`mid`) REFERENCES `omt_matches`(`mid`);

ALTER TABLE `omt_rounds` ADD CONSTRAINT `omt_rounds_fk1` FOREIGN KEY (`won`) REFERENCES `omt_side`(`sid`);
