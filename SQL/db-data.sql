INSERT INTO `omt_host` (`hid`, `name`, `img`) VALUES
(1, 'Valve', NULL),
(2, 'ESEA', NULL),
(3, 'FACEIT', NULL);


INSERT INTO `omt_role`(`roleid`, `name`) VALUES
(1, 'Main Roster'),
(2, 'Stand-in');


-- -DEBUG IGNORE FOR NOW- --

INSERT INTO `omt_players` (`pid`, `name`, `steamid`, `role`, `staticname`) VALUES
(NULL, 'Skaronator', 76561198042281363, 1, 1),
(NULL, 'noah', 76561198125206920, 2, 1),
(NULL, 'skonko_ronko', 76561198121558523, 1, 1),
(NULL, 'WidDoW94', 76561197994389872, 1, 1),
(NULL, 'Gr33n', 76561198018045787, 1, 1),
(NULL, 'jnL', 76561198139423605, 2, 1),
(NULL, 'Strikel', 76561198001415562, 2, 1);