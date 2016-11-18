INSERT INTO `omt_host` (`hid`, `name`, `img`) VALUES
(NULL, 'Valve', NULL),
(NULL, 'ESEA', NULL),
(NULL, 'FACEIT', NULL);


INSERT INTO `omt_role`(`roleid`, `name`, `sort_order`) VALUES
(1, 'Main Roster', 0),
(2, 'Stand-in', 1);


-- -DEBUG IGNORE FOR NOW- --

INSERT INTO `omt_players` (`pid`, `name`, `steamid`, `role`, `staticname`) VALUES
(NULL, 'Skaronator', 76561198042281363, 1, 1),
(NULL, 'skonko_ronko', 76561198121558523, 1, 1),
(NULL, 'WidDoW94', 76561197994389872, 1, 1),
(NULL, 'Gr33n', 76561198018045787, 1, 1),
(NULL, 'Navy', 76561197976446736, 1, 1),
(NULL, 'Strikel', 76561198001415562, 2, 1);

-- (NULL, 'jnL', 76561198139423605, 2, 1),