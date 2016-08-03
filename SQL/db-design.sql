
CREATE TABLE `omt_host` (
  `hid` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE `omt_maps` (
  `mapid` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE `omt_matches` (
  `mid` int(11) NOT NULL,
  `demoid` VARCHAR(64) NOT NULL,
  `date` datetime NOT NULL,
  `duration` time NOT NULL,
  `mapid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `won_team` int(11) DEFAULT NULL,
  `surrender` tinyint(4) NOT NULL DEFAULT '0',
  `tickrate` tinyint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE `omt_match_player` (
  `tpid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `adr_rating` decimal(5,2) NOT NULL,
  `hltv_rating` decimal(4,3) NOT NULL,
  `rws_rating` decimal(4,2) NOT NULL,
  `kill_count` tinyint(4) UNSIGNED NOT NULL,
  `assist_count` tinyint(4) UNSIGNED NOT NULL,
  `death_count` tinyint(4) UNSIGNED NOT NULL,
  `trade_kill_count` tinyint(4) UNSIGNED NOT NULL,
  `trade_death_count` tinyint(4) UNSIGNED NOT NULL,
  `entry_kill_won` tinyint(4) UNSIGNED NOT NULL,
  `entry_kill_lose` tinyint(4) UNSIGNED NOT NULL,
  `hs_count` tinyint(4) UNSIGNED NOT NULL,
  `tk_count` tinyint(4) UNSIGNED NOT NULL,
  `round_count` tinyint(4) UNSIGNED NOT NULL,
  `bomb_planted` tinyint(4) UNSIGNED NOT NULL,
  `bomb_defused` tinyint(4) UNSIGNED NOT NULL,
  `flashbang_count` tinyint(4) UNSIGNED NOT NULL,
  `smoke_count` tinyint(4) UNSIGNED NOT NULL,
  `he_count` tinyint(4) UNSIGNED NOT NULL,
  `molotov_count` tinyint(4) UNSIGNED NOT NULL,
  `incendiary_count` tinyint(4) UNSIGNED NOT NULL,
  `decoy_count` tinyint(4) UNSIGNED NOT NULL,
  `1k_count` tinyint(4) UNSIGNED NOT NULL,
  `2k_count` tinyint(4) UNSIGNED NOT NULL,
  `3k_count` tinyint(4) UNSIGNED NOT NULL,
  `4k_count` tinyint(4) UNSIGNED NOT NULL,
  `5k_count` tinyint(4) UNSIGNED NOT NULL,
  `1v1_won` tinyint(4) UNSIGNED NOT NULL,
  `1v1_loss` tinyint(4) UNSIGNED NOT NULL,
  `1v2_won` tinyint(4) UNSIGNED NOT NULL,
  `1v2_loss` tinyint(4) UNSIGNED NOT NULL,
  `1v3_won` tinyint(4) UNSIGNED NOT NULL,
  `1v3_loss` tinyint(4) UNSIGNED NOT NULL,
  `1v4_won` tinyint(4) UNSIGNED NOT NULL,
  `1v4_loss` tinyint(4) UNSIGNED NOT NULL,
  `1v5_won` tinyint(4) UNSIGNED NOT NULL,
  `1v5_loss` tinyint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE `omt_players` (
  `pid` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `steamid` bigint(20) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `staticname` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE `omt_role` (
  `roleid` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE `omt_rounds` (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `round` tinyint(4) UNSIGNED NOT NULL,
  `t_team` int(11) NOT NULL,
  `ct_team` int(11) NOT NULL,
  `won_team` int(11) NOT NULL,
  `bombplant` varchar(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE `omt_team` (
  `tid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE `omt_weapons` (
  `wid` tinyint(4) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE `omt_weaponsstats` (
  `wsid` int(11) NOT NULL,
  `tpid` int(11) NOT NULL,
  `wid` tinyint(4) UNSIGNED NOT NULL,
  `kills` tinyint(4) UNSIGNED NOT NULL,
  `hs_count` tinyint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

ALTER TABLE `omt_host`
  ADD PRIMARY KEY (`hid`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `omt_maps`
  ADD PRIMARY KEY (`mapid`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `omt_matches`
  ADD PRIMARY KEY (`mid`),
  ADD UNIQUE KEY `demoid` (`demoid`),
  ADD KEY `omt_matches_fk0` (`mapid`),
  ADD KEY `omt_matches_fk1` (`hid`),
  ADD KEY `omt_matches_fk2` (`won_team`);

ALTER TABLE `omt_match_player`
  ADD PRIMARY KEY (`tpid`),
  ADD KEY `omt_match_player_fk0` (`pid`),
  ADD KEY `omt_match_player_fk1` (`mid`),
  ADD KEY `omt_match_player_fk2` (`tid`);

ALTER TABLE `omt_players`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `steamid` (`steamid`),
  ADD KEY `omt_players_fk0` (`role`);

ALTER TABLE `omt_role`
  ADD PRIMARY KEY (`roleid`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `omt_rounds`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `omt_rounds_fk0` (`mid`),
  ADD KEY `omt_rounds_fk1` (`t_team`),
  ADD KEY `omt_rounds_fk2` (`ct_team`),
  ADD KEY `omt_rounds_fk3` (`won_team`);

ALTER TABLE `omt_team`
  ADD PRIMARY KEY (`tid`);

ALTER TABLE `omt_weapons`
  ADD PRIMARY KEY (`wid`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `omt_weaponsstats`
  ADD PRIMARY KEY (`wsid`),
  ADD KEY `omt_weaponsstats_fk0` (`tpid`),
  ADD KEY `omt_weaponsstats_fk1` (`wid`);


ALTER TABLE `omt_host`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `omt_maps`
  MODIFY `mapid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `omt_matches`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `omt_match_player`
  MODIFY `tpid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `omt_players`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `omt_role`
  MODIFY `roleid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `omt_rounds`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `omt_team`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `omt_weapons`
  MODIFY `wid` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `omt_weaponsstats`
  MODIFY `wsid` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `omt_matches`
  ADD CONSTRAINT `omt_matches_fk0` FOREIGN KEY (`mapid`) REFERENCES `omt_maps`(`mapid`),
  ADD CONSTRAINT `omt_matches_fk1` FOREIGN KEY (`hid`) REFERENCES `omt_host`(`hid`),
  ADD CONSTRAINT `omt_matches_fk2` FOREIGN KEY (`won_team`) REFERENCES `omt_team`(`tid`);

ALTER TABLE `omt_players`
  ADD CONSTRAINT `omt_players_fk0` FOREIGN KEY (`role`) REFERENCES `omt_role`(`roleid`);

ALTER TABLE `omt_match_player`
  ADD CONSTRAINT `omt_match_player_fk0` FOREIGN KEY (`pid`) REFERENCES `omt_players`(`pid`),
  ADD CONSTRAINT `omt_match_player_fk1` FOREIGN KEY (`mid`) REFERENCES `omt_matches`(`mid`),
  ADD CONSTRAINT `omt_match_player_fk2` FOREIGN KEY (`tid`) REFERENCES `omt_team`(`tid`);

ALTER TABLE `omt_weaponsstats`
  ADD CONSTRAINT `omt_weaponsstats_fk0` FOREIGN KEY (`tpid`) REFERENCES `omt_match_player`(`tpid`),
  ADD CONSTRAINT `omt_weaponsstats_fk1` FOREIGN KEY (`wid`) REFERENCES `omt_weapons`(`wid`);

ALTER TABLE `omt_rounds`
  ADD CONSTRAINT `omt_rounds_fk0` FOREIGN KEY (`mid`) REFERENCES `omt_matches`(`mid`),
  ADD CONSTRAINT `omt_rounds_fk1` FOREIGN KEY (`t_team`) REFERENCES `omt_team`(`tid`),
  ADD CONSTRAINT `omt_rounds_fk2` FOREIGN KEY (`ct_team`) REFERENCES `omt_team`(`tid`),
  ADD CONSTRAINT `omt_rounds_fk3` FOREIGN KEY (`won_team`) REFERENCES `omt_team`(`tid`);