
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE TABLE IF NOT EXISTS `accounts` (
  `Username` mediumtext NOT NULL,
  `Password` mediumtext NOT NULL,
  `Email` mediumtext NOT NULL,
  `salt` mediumtext NOT NULL,
  `Reebs` bigint(255) NOT NULL,
  `online` int(11) NOT NULL,
  `lastOnline` mediumtext NOT NULL,
  `lastOnlineMinutes` mediumtext NOT NULL,
  `lastOnlineHours` mediumtext NOT NULL,
  `status` mediumtext NOT NULL,
  `blurb` mediumtext NOT NULL,
  `profileviews` int(11) NOT NULL,
  `ShirtPath` mediumtext NOT NULL,
  `PantsPath` mediumtext NOT NULL,
  `EyesPath` mediumtext NOT NULL,
  `ShoesPath` mediumtext NOT NULL,
  `HairPath` mediumtext NOT NULL,
  `MouthPath` mediumtext NOT NULL,
  `totalposts` int(11) NOT NULL,
  `moderator` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `administrator` int(11) NOT NULL,
  `Signature` mediumtext NOT NULL,
  `banned` int(11) NOT NULL DEFAULT '0' COMMENT '0=no; 1=warning; 2=1 day; 3=3 days; 4=7 days; 5=deleted',
  `bannedUntilDay` int(11) NOT NULL,
  `bannedUntilMonth` int(11) NOT NULL,
  `bannedUntilYear` int(11) NOT NULL,
  `bannedReason` mediumtext NOT NULL,
  `bannedFor` mediumtext NOT NULL,
  `ip` mediumtext NOT NULL,
  `floodcheck` int(11) NOT NULL,
  `Accessories` mediumtext NOT NULL,
  `Background` mediumtext NOT NULL,
  `artist` int(11) NOT NULL,
  `manager` int(11) NOT NULL,
  `Bucks` int(11) NOT NULL DEFAULT '20',
  `powerArtist` int(11) NOT NULL,
  `powerCM` int(11) NOT NULL,
  `powerDev` int(11) NOT NULL,
  `powerForumMod` int(11) NOT NULL,
  `powerHeadMod` int(11) NOT NULL,
  `powerImageMod` int(11) NOT NULL,
  `Name` mediumtext NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Verified` int(11) NOT NULL DEFAULT '1',
  `color` int(11) NOT NULL,
  `powerAdmin` int(11) NOT NULL,
  `Membership` int(11) NOT NULL,
  `Expire` int(255) NOT NULL,
  `Reputation` int(11) NOT NULL DEFAULT '20',
  `lastBucks` int(11) NOT NULL,
  `lastReebs` int(11) NOT NULL,
  `bannedUntil` int(11) NOT NULL,
  `hide` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `streamer` int(11) NOT NULL,
  `limiteds` int(11) NOT NULL,
  `veteran` int(11) NOT NULL,
  `statusupdate` text NOT NULL,
  `bugreporter` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE IF NOT EXISTS `ads` (
  `running` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `userid` int(11) NOT NULL,
  `reason` text NOT NULL,
  `comment` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bannedbyid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bans_IP`
--

CREATE TABLE IF NOT EXISTS `bans_IP` (
  `IP` mediumtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bannerid` int(11) NOT NULL,
  `reason` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `buysell`
--

CREATE TABLE IF NOT EXISTS `buysell` (
  `buysell` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE IF NOT EXISTS `competitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  `startedbyid` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `started` mediumtext NOT NULL,
  `ending` mediumtext NOT NULL,
  `reward` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forumboards`
--

CREATE TABLE IF NOT EXISTS `forumboards` (
  `name` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `totalposts` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `forumboards`
--

INSERT INTO `forumboards` (`name`, `description`, `totalposts`, `id`, `group`) VALUES
('AvatarLife Chat', 'A general discussion for AvatarCentral. Post anything you like, as long as it is about AvatarCentral.', 1504, 1, 1),
('Off Topic', 'Anything other than AvatarCentral discussions can go here.', 55, 3, 2),
('Suggestions', 'Got a suggestion that will help improve AvatarCentral? Post it here!', 132, 2, 1),
('Forum Games', 'Forums don''t always have to be serious discussions. Make up games and play them here.', 36, 4, 2),
('Role Playing', 'Enjoy roleplaying? This is a forum for you.', 12, 6, 1),
('Gamer Hangout', 'For the hardcore gamers of AvatarCentral.', 16, 8, 1),
('Technical Problems', 'Were we update you on bugs and problems', 2, 10, 0),
('Help and Support', 'Have a problem? Let our moderators know here.', 4, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `forumgroups`
--

CREATE TABLE IF NOT EXISTS `forumgroups` (
  `name` mediumtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `forumgroups`
--

INSERT INTO `forumgroups` (`name`, `id`) VALUES
('Test', 1),
('Fun Boards.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `forumreplies`
--

CREATE TABLE IF NOT EXISTS `forumreplies` (
  `inid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorid` int(11) NOT NULL,
  `body` mediumtext NOT NULL,
  `siggy` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `forumreplies`
--

INSERT INTO `forumreplies` (`inid`, `id`, `authorid`, `body`, `siggy`) VALUES
(5, 1, 6, 'Howdy.', ''),
(6, 2, 6, 'me aswell.', ''),
(9, 17, 8, 'I'' good', '-Sounds'),
(4, 4, 9, 'I have you on xboxone wildes.', 'God ? '),
(6, 5, 3, 'Same here Shan. ', 'This is my siggy. There are many like it, but this one is mine.'),
(7, 6, 3, 'You may send an application, and the specific job you want. Listed in the jobs section. My Skype is LambentLightz.', 'This is my siggy. There are many like it, but this one is mine.'),
(9, 7, 1, 'Good haha', 'Oneil ~ Founder'),
(8, 8, 1, 'Hai ', 'Oneil ~ Founder'),
(8, 9, 1, 'Im the owner btw xD', 'Oneil ~ Founder'),
(12, 10, 19, 'Nice, Looks great!', ''),
(9, 11, 19, 'Good, How about you? ', ''),
(4, 12, 19, 'I''m always very active! <img src="/assets/Emoticons/emote_smile.png" alt=":)" title=":)" />', ''),
(8, 13, 19, 'Hello!', ''),
(13, 14, 8, 'Ain''t that cool', '-Sounds'),
(15, 15, 8, 'Only one left', '-Sounds'),
(8, 16, 8, 'Hey there', '-Sounds'),
(12, 18, 8, 'Thanks man!', '-Sounds'),
(6, 19, 8, 'Well that usernae tho', '-Sounds'),
(5, 20, 8, 'Hello', '-Sounds'),
(3, 21, 8, ':O', '-Sounds'),
(3, 22, 2, ':P', '-God Was here-'),
(3, 23, 8, 'shhh', '-Sounds'),
(3, 24, 2, 'Skype me back System :o', '-God Was here-'),
(6, 25, 22, 'Ehhhh avatar hangout>this', ''),
(6, 26, 8, 'Avatar-hangout only > because it has more members, but it lacks staff and catalog is dead', '-Sounds'),
(16, 27, 20, 'http://avatarlife.pe.hu/Store/Item.php?id=61', ''),
(15, 28, 24, 'Maybe you can publish my dominos? Maybe? ', ''),
(19, 29, 8, 'You sure?', '-Sounds'),
(18, 30, 8, 'Well I got a few people to join.', '-Sounds'),
(17, 31, 8, 'Messa AvatarLife.', '-Sounds'),
(6, 32, 9, 'True.', ''),
(21, 33, 1, 'Hai ~ From ze owner ', 'Oneil ~ Founder'),
(22, 34, 3, 'Legit site! ', '~Exodite'),
(22, 35, 9, 'Just post ok done', ''),
(22, 36, 28, 'iiBlackHat waz here', ''),
(22, 37, 8, ':o', '-Sounds'),
(22, 38, 31, 'Me win xD', '');

-- --------------------------------------------------------

--
-- Table structure for table `forumthreads`
--

CREATE TABLE IF NOT EXISTS `forumthreads` (
  `inid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posterid` int(11) NOT NULL,
  `sticky` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `subject` mediumtext NOT NULL,
  `body` mediumtext NOT NULL,
  `replies` int(11) NOT NULL,
  `lastposter` mediumtext NOT NULL,
  `order` int(11) NOT NULL,
  `siggy` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `forumthreads`
--

INSERT INTO `forumthreads` (`inid`, `id`, `posterid`, `sticky`, `locked`, `subject`, `body`, `replies`, `lastposter`, `order`, `siggy`) VALUES
(1, 1, 1, 1, 1, 'The Release of Avatar Life [20.05.15]', 'We are getting ready to setup the site and we will release it in a zap!', 0, 'AvatarLife', 1, ''),
(10, 2, 3, 0, 1, 'Sword Pack Test', 'Currently the Sword Pack Test, located in rates/limiteds. Is currently working but the picture assets is loading. To not worry our staff is continuing to work on it.', 0, 'Pikajew', 2, ''),
(1, 3, 6, 0, 0, '2nd Post EVER', 'From Admin :]', 4, '2', 38, ''),
(1, 16, 20, 0, 0, 'My New item', 'http://avatarlife.pe.hu/Store/Item.php?id=62', 1, '20', 42, ''),
(1, 5, 9, 0, 0, 'Howdy Guys, If you need me PM me.', 'Ok', 2, '8', 34, ''),
(1, 6, 10, 0, 0, 'I see potential in this website.', 'Good concept and executed well.', 6, '9', 51, ''),
(1, 10, 1, 1, 1, 'Something you may encounter!', 'You may encounter a error that says "Not enough memory", if this does happen just refresh its a basic error we will fix. In fact were 80% sure it wont happen again.', 0, 'AvatarLife', 16, ''),
(1, 9, 2, 0, 0, 'Howdy, Folks', 'How you doing today?', 3, '8', 31, ''),
(1, 8, 15, 0, 0, 'Hello', 'I am new to this website and i think it would be awsome to introduce with you guys', 4, '8', 30, ''),
(1, 11, 1, 1, 1, 'Avatar Life is here!', 'Hey ya''ll Avatar Life is here, be sure to join us. Make clothes play games [Currently in-dev] and make tons of money.\r\nMeet friends and trade rare items only at Avatar Life.\r\n\r\nWe are a trusted site and if you need more info please email us@ info@avatarlife.pe.hu\r\n', 0, 'AvatarLife', 17, ''),
(1, 12, 8, 0, 0, 'New limited published!', 'http://avatarlife.pe.hu/Store/Item.php?id=37', 2, '8', 32, ''),
(3, 13, 19, 0, 0, 'Hello!', 'Hello, Everybody! I''m Darp!\r\nI''m new here.', 1, '8', 28, ''),
(1, 15, 2, 0, 0, 'NEW LIMITED! By- Systems ', 'http://avatarlife.pe.hu/Store/Item.php?id=49\r\n\r\n\r\n\r\n\r\n\r\nGoodJob Systems', 2, '24', 45, '-God Was here-'),
(1, 17, 24, 0, 0, 'How to?', 'When is there going to be the next artist/ Image moderator pick? Because I love making items on here and I''d really like to be a artist and image mod. Thanks.', 1, '8', 50, ''),
(1, 18, 24, 0, 0, 'We need more active forums', 'Am I right? :P', 1, '8', 48, ''),
(1, 19, 24, 0, 0, 'I am a top poster', 'Til mornin', 1, '8', 47, ''),
(2, 20, 8, 0, 0, 'If you have any suggestions.', 'Just PM me WHEN I''M ON, and I''ll forward them to the owner, or you can just post them here.', 0, 'System', 49, '-Sounds'),
(1, 21, 3, 0, 0, 'Site', 'Hello.', 1, '1', 53, '~Exodite'),
(1, 22, 1, 1, 0, 'Post here for a chance to win 100k!', 'Just post ', 5, '31', 59, 'Oneil ~ Founder');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `withid` int(11) NOT NULL,
  `request` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `uid`, `withid`, `request`) VALUES
(21, 1, 9, 1),
(20, 9, 1, 1),
(19, 9, 5, 1),
(18, 6, 9, 1),
(17, 9, 6, 1),
(16, 1, 5, 1),
(15, 5, 1, 1),
(13, 1, 4, 1),
(12, 1, 2, 1),
(10, 1, 3, 1),
(11, 3, 1, 1),
(22, 9, 11, 1),
(23, 11, 9, 1),
(24, 11, 3, 1),
(25, 3, 11, 1),
(26, 3, 13, 0),
(46, 16, 2, 1),
(45, 2, 16, 1),
(29, 16, 6, 1),
(30, 2, 1, 1),
(31, 4, 1, 1),
(32, 5, 9, 1),
(33, 6, 16, 1),
(34, 2, 8, 1),
(35, 2, 9, 1),
(36, 2, 3, 1),
(37, 9, 2, 1),
(38, 3, 2, 1),
(39, 2, 4, 0),
(40, 2, 11, 1),
(41, 11, 2, 1),
(42, 2, 13, 1),
(43, 13, 2, 1),
(44, 1, 11, 0),
(47, 8, 2, 1),
(48, 2, 20, 1),
(49, 20, 2, 1),
(50, 19, 8, 1),
(51, 20, 21, 0),
(52, 8, 19, 1),
(53, 24, 2, 0),
(54, 1, 8, 1),
(55, 0, 21, 0),
(56, 8, 1, 1),
(57, 20, 9, 1),
(58, 0, 9, 1),
(59, 9, 20, 1),
(60, 9, 0, 1),
(61, 9, 3, 1),
(62, 3, 9, 1),
(63, 3, 9, 1),
(64, 3, 6, 0),
(65, 3, 4, 0),
(66, 3, 8, 1),
(67, 3, 17, 0),
(68, 8, 3, 1),
(69, 8, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `groupevents`
--

CREATE TABLE IF NOT EXISTS `groupevents` (
  `groupid` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `desc` mediumtext NOT NULL,
  `day` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groupmembers`
--

CREATE TABLE IF NOT EXISTS `groupmembers` (
  `memberid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `groupmembers`
--

INSERT INTO `groupmembers` (`memberid`, `groupid`, `id`, `rank`) VALUES
(2, 4, 7, 1),
(3, 4, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `groupranks`
--

CREATE TABLE IF NOT EXISTS `groupranks` (
  `rankname` mediumtext NOT NULL,
  `rankvalue` int(11) NOT NULL COMMENT 'the higher than value the higher the rank',
  `groupid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canDeleteWallPosts` int(11) NOT NULL,
  `canCreateEvents` int(11) NOT NULL,
  `canChangeDescription` int(11) NOT NULL,
  `canExileMembersLowerThan` int(11) NOT NULL,
  `canChangeRanksLowerThan` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `ownerid` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `logopath` mediumtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`ownerid`, `name`, `description`, `logopath`, `id`) VALUES
(1, 'Avatar Life!', 'We rule!', '1cce895f5b0e518950c169e5acb7455aef609bfb', 4),
(1, 'Avatar Life Supporters', 'We rule!', '1684840d7bfe6d169c60cc3fe78e79bebca86492', 5);

-- --------------------------------------------------------

--
-- Table structure for table `groupwall`
--

CREATE TABLE IF NOT EXISTS `groupwall` (
  `groupid` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `groupwall`
--

INSERT INTO `groupwall` (`groupid`, `memberid`, `id`, `comment`) VALUES
(4, 3, 1, 'Indeed we do.');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `ownerid` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `itemid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` mediumtext NOT NULL,
  `type` mediumtext NOT NULL,
  `limited` int(11) NOT NULL,
  `buysell` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=272 ;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ownerid`, `name`, `itemid`, `id`, `path`, `type`, `limited`, `buysell`) VALUES
(1, 'Gas Mask', 16, 62, 'Accessory/99307715571227637e1dec62d0ace4dbcebaac20', 'Accessory', 0, 0),
(1, 'Epic Face', 14, 59, 'Hat/28a04265053b5c64542f4fe2d981dc9c262f3d9d', 'Hat', 0, 0),
(2, 'Epic Face', 14, 58, 'Hat/28a04265053b5c64542f4fe2d981dc9c262f3d9d', 'Hat', 0, 0),
(9, 'Grrr', 13, 144, 'Accessory/a304baff8c4301ab1185bfc4978c8edebe443a3b', 'Accessory', 0, 0),
(1, 'Grrr', 13, 57, 'Accessory/a304baff8c4301ab1185bfc4978c8edebe443a3b', 'Accessory', 0, 0),
(4, 'Dominus Viridian', 7, 53, 'Hat/0c03f8d1b665c25f4b4309e6a680d6a276087e0c', 'Hat', 0, 0),
(1, 'Teal Sparkle Time Fedora', 8, 52, 'Hat/3308bd2e9cc19202c62718fa1a53f7dd046b86ca', 'Hat', 0, 0),
(2, 'Domino Crown', 1, 39, 'Hat/cdab215d6da2a06ec08d7b8a55cabbe0b2371bf0', 'Hat', 0, 0),
(1, 'Domino Crown', 1, 40, 'Hat/cdab215d6da2a06ec08d7b8a55cabbe0b2371bf0', 'Hat', 0, 0),
(6, 'Classic Fedora', 2, 41, 'Hat/78c363ad26cc6e7591c1731e89347ba3e6efda73', 'Hat', 1, 0),
(2, 'Crimson Dominus', 3, 42, 'Hat/b228d2392a543424de32b49da7c23a854091a1e6', 'Hat', 0, 0),
(1, 'Crimson Dominus', 3, 43, 'Hat/b228d2392a543424de32b49da7c23a854091a1e6', 'Hat', 0, 0),
(1, 'Flash Crown', 4, 44, 'Hat/058a71c9872df6485e142cc8a8abc713dd9266ad', 'Hat', 1, 0),
(2, 'Azurewrath of Frost', 5, 45, 'Hat/07e997e5f21f07cd6f7c3750f81d8d33b87c397c', 'Hat', 0, 0),
(2, 'Dominus Ignis', 6, 46, 'Hat/975c538f01f648df326960a118548fac5daa94cb', 'Hat', 0, 0),
(2, 'Dominus Viridian', 7, 47, 'Hat/0c03f8d1b665c25f4b4309e6a680d6a276087e0c', 'Hat', 0, 0),
(2, 'Teal Sparkle Time Fedora', 8, 48, 'Hat/3308bd2e9cc19202c62718fa1a53f7dd046b86ca', 'Hat', 0, 0),
(4, 'Domino Crown', 1, 51, 'Hat/cdab215d6da2a06ec08d7b8a55cabbe0b2371bf0', 'Hat', 0, 0),
(4, 'Teal Sparkle Time Fedora', 8, 50, 'Hat/3308bd2e9cc19202c62718fa1a53f7dd046b86ca', 'Hat', 0, 0),
(5, 'Crimson Dominus', 3, 61, 'Hat/b228d2392a543424de32b49da7c23a854091a1e6', 'Hat', 0, 0),
(1, '`3', 16, 38, 'Hat/742d33f2378834d548aff26a5f3767c08677701b', 'Hat', 0, 0),
(5, 'Azurewrath of Frost', 5, 63, 'Hat/07e997e5f21f07cd6f7c3750f81d8d33b87c397c', 'Hat', 0, 0),
(2, 'Classic Fedora', 2, 64, 'Hat/78c363ad26cc6e7591c1731e89347ba3e6efda73', 'Hat', 1, 0),
(6, 'Crimson Dominus', 3, 65, 'Hat/b228d2392a543424de32b49da7c23a854091a1e6', 'Hat', 0, 0),
(6, 'Dominus Viridian', 7, 66, 'Hat/0c03f8d1b665c25f4b4309e6a680d6a276087e0c', 'Hat', 0, 0),
(6, 'Dominus Ignis', 6, 67, 'Hat/975c538f01f648df326960a118548fac5daa94cb', 'Hat', 0, 0),
(6, 'Gas Mask', 16, 68, 'Accessory/99307715571227637e1dec62d0ace4dbcebaac20', 'Accessory', 0, 0),
(6, 'Epic Face', 14, 69, 'Hat/28a04265053b5c64542f4fe2d981dc9c262f3d9d', 'Hat', 0, 0),
(6, 'Grrr', 13, 70, 'Accessory/a304baff8c4301ab1185bfc4978c8edebe443a3b', 'Accessory', 0, 0),
(8, 'Chicken suit', 46, 152, 'Hat/71ab1264fad947f977ad9288b62bee9befa7adc7', 'Hat', 0, 0),
(6, 'Teal Sparkle Time Fedora', 8, 72, 'Hat/3308bd2e9cc19202c62718fa1a53f7dd046b86ca', 'Hat', 0, 0),
(6, 'Domino Crown', 1, 73, 'Hat/cdab215d6da2a06ec08d7b8a55cabbe0b2371bf0', 'Hat', 0, 0),
(6, 'Azurewrath of Frost', 5, 74, 'Hat/07e997e5f21f07cd6f7c3750f81d8d33b87c397c', 'Hat', 0, 0),
(6, 'Flash Crown', 4, 75, 'Hat/058a71c9872df6485e142cc8a8abc713dd9266ad', 'Hat', 1, 0),
(6, 'Classic Fedora', 2, 76, 'Hat/78c363ad26cc6e7591c1731e89347ba3e6efda73', 'Hat', 1, 0),
(1, 'Ze pants', 22, 84, 'Pants/9a872d2c5938ea3f4512c45f976f58722935a967', 'Pants', 0, 0),
(1, 'Combat Top', 20, 81, 'Shirt/4ad42ec5cd41001a6211eafb93ce929b85b47020', 'Shirt', 0, 0),
(2, 'Combat Top', 20, 94, 'Shirt/4ad42ec5cd41001a6211eafb93ce929b85b47020', 'Shirt', 0, 0),
(2, 'Gas Mask', 16, 93, 'Accessory/99307715571227637e1dec62d0ace4dbcebaac20', 'Accessory', 0, 0),
(2, 'Ze pants', 22, 95, 'Pants/9a872d2c5938ea3f4512c45f976f58722935a967', 'Pants', 0, 0),
(1, 'Galaxy', 31, 100, 'Background/ba502b75bf851c4ff3832f44fb7fe4a7f1928711', 'Background', 0, 0),
(2, 'Galaxy', 31, 98, 'Background/ba502b75bf851c4ff3832f44fb7fe4a7f1928711', 'Background', 0, 0),
(2, 'Purple Ice crown', 33, 101, 'Hat/8d5fea80f4a6591e9fcc220ff43fb482e7557d95', 'Hat', 0, 0),
(3, 'Dominus Ignis', 6, 102, 'Hat/975c538f01f648df326960a118548fac5daa94cb', 'Hat', 0, 0),
(1, 'Pinish Domino', 34, 103, 'Hat/456101b02768e3dc252ca86c60a283b4b51711b9', 'Hat', 0, 0),
(2, 'Hooded SpaceLord', 35, 104, 'Hat/1cadeaab42c8e5742ee7fbbcae01b7b2ce36adee', 'Hat', 1, 0),
(9, 'Dominus Ignis', 6, 105, 'Hat/975c538f01f648df326960a118548fac5daa94cb', 'Hat', 0, 0),
(9, 'Galaxy', 31, 106, 'Background/ba502b75bf851c4ff3832f44fb7fe4a7f1928711', 'Background', 0, 0),
(9, 'Azurewrath of Frost', 5, 107, 'Hat/07e997e5f21f07cd6f7c3750f81d8d33b87c397c', 'Hat', 0, 0),
(9, 'Classic Fedora', 2, 108, 'Hat/78c363ad26cc6e7591c1731e89347ba3e6efda73', 'Hat', 1, 0),
(9, 'Combat Top', 20, 109, 'Shirt/4ad42ec5cd41001a6211eafb93ce929b85b47020', 'Shirt', 0, 0),
(9, 'Ze pants', 22, 110, 'Pants/9a872d2c5938ea3f4512c45f976f58722935a967', 'Pants', 0, 0),
(4, 'Combat Top', 20, 118, 'Shirt/4ad42ec5cd41001a6211eafb93ce929b85b47020', 'Shirt', 0, 0),
(1, 'Hooded SpaceLord', 35, 117, 'Hat/1cadeaab42c8e5742ee7fbbcae01b7b2ce36adee', 'Hat', 0, 0),
(9, '', 8, 113, 'Hat/3308bd2e9cc19202c62718fa1a53f7dd046b86ca', 'Hat', 0, 0),
(9, 'Gas Mask', 16, 114, 'Accessory/99307715571227637e1dec62d0ace4dbcebaac20', 'Accessory', 0, 0),
(10, 'Hooded SpaceLord', 35, 115, 'Hat/1cadeaab42c8e5742ee7fbbcae01b7b2ce36adee', 'Hat', 0, 0),
(10, 'Grrr', 13, 116, 'Accessory/a304baff8c4301ab1185bfc4978c8edebe443a3b', 'Accessory', 0, 0),
(4, 'Ze pants', 22, 119, 'Pants/9a872d2c5938ea3f4512c45f976f58722935a967', 'Pants', 0, 0),
(4, 'Grrr', 13, 120, 'Accessory/a304baff8c4301ab1185bfc4978c8edebe443a3b', 'Accessory', 0, 0),
(1, 'Classic Fedora', 2, 121, 'Hat/78c363ad26cc6e7591c1731e89347ba3e6efda73', 'Hat', 0, 0),
(9, 'Epic Face', 14, 122, 'Hat/28a04265053b5c64542f4fe2d981dc9c262f3d9d', 'Hat', 0, 0),
(9, 'Dominus Viridian', 7, 123, 'Hat/0c03f8d1b665c25f4b4309e6a680d6a276087e0c', 'Hat', 0, 0),
(9, 'Domino Crown', 1, 124, 'Hat/cdab215d6da2a06ec08d7b8a55cabbe0b2371bf0', 'Hat', 0, 0),
(2, 'Red Icecrown', 39, 142, 'Hat/85a380bc274fedcead15b16df580a2195dbd7338', 'Hat', 1, 0),
(11, 'Purple Ice crown', 33, 126, 'Hat/8d5fea80f4a6591e9fcc220ff43fb482e7557d95', 'Hat', 0, 0),
(11, 'Combat Top', 20, 127, 'Shirt/4ad42ec5cd41001a6211eafb93ce929b85b47020', 'Shirt', 0, 0),
(11, 'Ze pants', 22, 128, 'Pants/9a872d2c5938ea3f4512c45f976f58722935a967', 'Pants', 0, 0),
(11, 'Azurewrath of Frost', 5, 129, 'Hat/07e997e5f21f07cd6f7c3750f81d8d33b87c397c', 'Hat', 0, 0),
(15, 'Purple Ice crown', 33, 130, 'Hat/8d5fea80f4a6591e9fcc220ff43fb482e7557d95', 'Hat', 0, 0),
(20, 'Dominus Ignis', 6, 132, 'Hat/975c538f01f648df326960a118548fac5daa94cb', 'Hat', 0, 0),
(8, 'Combat Top', 20, 133, 'Shirt/4ad42ec5cd41001a6211eafb93ce929b85b47020', 'Shirt', 0, 0),
(8, 'Ze pants', 22, 134, 'Pants/9a872d2c5938ea3f4512c45f976f58722935a967', 'Pants', 0, 0),
(8, 'Black hair', 45, 151, 'Hat/5613fd87d27fd0e314f9e47a09a9352704e5748b', 'Hat', 0, 0),
(8, 'Dusekkar', 37, 136, 'Hat/468f8919f835983bd5da9e680ed911ba7c37aa16', 'Hat', 1, 0),
(1, 'Dusekkar', 37, 137, 'Hat/468f8919f835983bd5da9e680ed911ba7c37aa16', 'Hat', 0, 0),
(9, 'Dusekkar', 37, 138, 'Hat/468f8919f835983bd5da9e680ed911ba7c37aa16', 'Hat', 1, 0),
(9, 'Pinish Domino', 34, 139, 'Hat/456101b02768e3dc252ca86c60a283b4b51711b9', 'Hat', 1, 0),
(2, 'Green Icecrown', 40, 145, 'Hat/2ebd834c1dbaa4efeb610dd4b6c63910093daeca', 'Hat', 1, 0),
(19, 'Red Icecrown', 39, 149, 'Hat/85a380bc274fedcead15b16df580a2195dbd7338', 'Hat', 0, 0),
(25, 'Red Domino Crown3', 44, 150, 'Hat/4b742aed264b0349b14c4dc3d2e09dfcd5e4a51e', 'Hat', 1, 0),
(8, 'Obey shirt', 47, 153, 'Shirt/28dbaea4ff5d7d1eead379ac952341deec17ad00', 'Shirt', 0, 0),
(2, 'Chicken suit', 46, 154, 'Hat/71ab1264fad947f977ad9288b62bee9befa7adc7', 'Hat', 0, 0),
(2, 'Obey shirt', 47, 155, 'Shirt/28dbaea4ff5d7d1eead379ac952341deec17ad00', 'Shirt', 0, 0),
(2, 'Purple Domino Crown', 48, 156, 'Hat/43227dca233ad96587f8cbd61cc12fe5264047ed', 'Hat', 0, 0),
(2, 'Black hair', 45, 157, 'Hat/5613fd87d27fd0e314f9e47a09a9352704e5748b', 'Hat', 0, 0),
(8, 'Undead Dominus', 49, 158, 'Hat/9f19b0d08d0e7bb8bb29250e8ce38548168a26da', 'Hat', 1, 0),
(2, 'Undead Dominus', 49, 159, 'Hat/9f19b0d08d0e7bb8bb29250e8ce38548168a26da', 'Hat', 1, 0),
(8, 'Bubblegum', 50, 160, 'Accessory/45df5a71d1443e4c132991cabca08b95c584fefa', 'Accessory', 0, 0),
(2, 'Bubblegum', 50, 161, 'Accessory/45df5a71d1443e4c132991cabca08b95c584fefa', 'Accessory', 0, 0),
(8, 'DIY Doge', 51, 162, 'Hat/9803c307394eb5e7bb7de6d5f6ab35b44d84ad7d', 'Hat', 0, 0),
(2, 'DIY Doge', 51, 163, 'Hat/9803c307394eb5e7bb7de6d5f6ab35b44d84ad7d', 'Hat', 0, 0),
(2, 'Teal Icecrown', 52, 164, 'Hat/0cea2e048fe862d9647d82a5582056b5a2e76be7', 'Hat', 1, 0),
(20, 'Brofist', 56, 168, 'Shirt/120053830f2a5d7e6f42ccac09276bb07d75d528', 'Shirt', 0, 0),
(2, 'Brofist', 56, 169, 'Shirt/120053830f2a5d7e6f42ccac09276bb07d75d528', 'Shirt', 0, 0),
(20, 'Azurewrath of Frost', 5, 170, 'Hat/07e997e5f21f07cd6f7c3750f81d8d33b87c397c', 'Hat', 0, 0),
(20, 'Galaxy', 31, 174, 'Background/ba502b75bf851c4ff3832f44fb7fe4a7f1928711', 'Background', 0, 0),
(8, 'Teal Icecrown', 52, 175, 'Hat/0cea2e048fe862d9647d82a5582056b5a2e76be7', 'Hat', 1, 0),
(8, 'Green Icecrown', 40, 176, 'Hat/2ebd834c1dbaa4efeb610dd4b6c63910093daeca', 'Hat', 1, 0),
(8, 'Red Icecrown', 39, 177, 'Hat/85a380bc274fedcead15b16df580a2195dbd7338', 'Hat', 1, 0),
(9, 'Bubblegum', 50, 178, 'Accessory/45df5a71d1443e4c132991cabca08b95c584fefa', 'Accessory', 0, 0),
(9, 'Chicken suit', 46, 179, 'Hat/71ab1264fad947f977ad9288b62bee9befa7adc7', 'Hat', 0, 0),
(9, 'Obey shirt', 47, 180, 'Shirt/28dbaea4ff5d7d1eead379ac952341deec17ad00', 'Shirt', 0, 0),
(9, 'Black hair', 45, 181, 'Hat/5613fd87d27fd0e314f9e47a09a9352704e5748b', 'Hat', 0, 0),
(9, '', 56, 182, 'Shirt/120053830f2a5d7e6f42ccac09276bb07d75d528', 'Shirt', 0, 0),
(21, 'Undead Dominus', 49, 183, 'Hat/9f19b0d08d0e7bb8bb29250e8ce38548168a26da', 'Hat', 0, 0),
(21, 'Teal Icecrown', 52, 184, 'Hat/0cea2e048fe862d9647d82a5582056b5a2e76be7', 'Hat', 0, 0),
(9, 'Flash Crown', 4, 185, 'Hat/058a71c9872df6485e142cc8a8abc713dd9266ad', 'Hat', 1, 0),
(9, 'Crimson Dominus', 3, 186, 'Hat/b228d2392a543424de32b49da7c23a854091a1e6', 'Hat', 0, 0),
(9, 'Purple Domino Crown', 48, 187, 'Hat/43227dca233ad96587f8cbd61cc12fe5264047ed', 'Hat', 0, 0),
(22, 'Undead Dominus', 49, 188, 'Hat/9f19b0d08d0e7bb8bb29250e8ce38548168a26da', 'Hat', 1, 0),
(19, 'Sweat pants', 59, 189, 'Pants/e7634b775e8cea0b87398b0ea477ef8ae1c65f65', 'Pants', 0, 0),
(2, 'Sweat pants', 59, 190, 'Pants/e7634b775e8cea0b87398b0ea477ef8ae1c65f65', 'Pants', 0, 0),
(19, 'Obey shirt', 47, 191, 'Shirt/28dbaea4ff5d7d1eead379ac952341deec17ad00', 'Shirt', 0, 0),
(2, 'Hooded Firelord', 60, 192, 'Hat/abcea0a62ab5e5b9ec697b5e1932207b10014fe7', 'Hat', 0, 0),
(20, 'Hooded Firelord', 60, 193, 'Hat/abcea0a62ab5e5b9ec697b5e1932207b10014fe7', 'Hat', 0, 0),
(20, 'Sweat pants', 59, 194, 'Pants/e7634b775e8cea0b87398b0ea477ef8ae1c65f65', 'Pants', 0, 0),
(20, 'Green Icecrown', 40, 195, 'Hat/2ebd834c1dbaa4efeb610dd4b6c63910093daeca', 'Hat', 0, 0),
(20, 'Red Icecrown', 39, 196, 'Hat/85a380bc274fedcead15b16df580a2195dbd7338', 'Hat', 0, 0),
(17, 'Flash Crown', 4, 253, 'Hat/058a71c9872df6485e142cc8a8abc713dd9266ad', 'Hat', 0, 0),
(2, 'Underwater', 64, 202, 'Background/9a638d15891454e298e92eb289b97ce83832f9d1', 'Background', 0, 0),
(20, 'Epic Face', 14, 200, 'Hat/28a04265053b5c64542f4fe2d981dc9c262f3d9d', 'Hat', 0, 0),
(20, 'Underwater', 64, 201, 'Background/9a638d15891454e298e92eb289b97ce83832f9d1', 'Background', 0, 0),
(20, 'Bubblegum', 50, 203, 'Accessory/45df5a71d1443e4c132991cabca08b95c584fefa', 'Accessory', 0, 0),
(1, 'Brofist', 56, 224, 'Shirt/120053830f2a5d7e6f42ccac09276bb07d75d528', 'Shirt', 0, 0),
(25, 'Teal Icecrown', 52, 207, 'Hat/0cea2e048fe862d9647d82a5582056b5a2e76be7', 'Hat', 1, 0),
(25, 'Red Icecrown', 39, 208, 'Hat/85a380bc274fedcead15b16df580a2195dbd7338', 'Hat', 1, 0),
(24, 'Hooded SpaceLord', 35, 209, 'Hat/1cadeaab42c8e5742ee7fbbcae01b7b2ce36adee', 'Hat', 1, 0),
(2, 'Hooded SpaceLord', 35, 210, 'Hat/1cadeaab42c8e5742ee7fbbcae01b7b2ce36adee', 'Hat', 1, 0),
(2, 'Red tango', 69, 212, 'Accessory/0f1c0609b8034c454087d89f02863785fb2f1240', 'Accessory', 1, 0),
(31, 'Green Pants', 81, 260, 'Pants/ae0f0c6c10650a44472d5fc4f27228a1bc5c8a87', 'Pants', 0, 0),
(25, 'Red Tango', 69, 214, 'Accessory/0f1c0609b8034c454087d89f02863785fb2f1240', 'Accessory', 0, 0),
(1, 'DIY Doge', 51, 223, 'Hat/9803c307394eb5e7bb7de6d5f6ab35b44d84ad7d', 'Hat', 0, 0),
(24, 'Red Tango', 69, 216, 'Accessory/0f1c0609b8034c454087d89f02863785fb2f1240', 'Accessory', 1, 0),
(2, 'Red Domino Crown3', 44, 218, 'Hat/4b742aed264b0349b14c4dc3d2e09dfcd5e4a51e', 'Hat', 1, 0),
(1, 'Bubblegum', 50, 222, 'Accessory/45df5a71d1443e4c132991cabca08b95c584fefa', 'Accessory', 0, 0),
(8, 'Red Tango', 69, 220, 'Accessory/0f1c0609b8034c454087d89f02863785fb2f1240', 'Accessory', 0, 0),
(8, 'Sweat pants', 59, 221, 'Pants/e7634b775e8cea0b87398b0ea477ef8ae1c65f65', 'Pants', 0, 0),
(1, 'Sweat pants', 59, 225, 'Pants/e7634b775e8cea0b87398b0ea477ef8ae1c65f65', 'Pants', 0, 0),
(1, 'Obey shirt', 47, 226, 'Shirt/28dbaea4ff5d7d1eead379ac952341deec17ad00', 'Shirt', 0, 0),
(1, 'Black hair', 45, 227, 'Hat/5613fd87d27fd0e314f9e47a09a9352704e5748b', 'Hat', 0, 0),
(1, 'Red Domino Crown3', 44, 228, 'Hat/4b742aed264b0349b14c4dc3d2e09dfcd5e4a51e', 'Hat', 0, 0),
(9, 'Sweat pants', 59, 229, 'Pants/e7634b775e8cea0b87398b0ea477ef8ae1c65f65', 'Pants', 0, 0),
(17, 'Pinish Domino', 34, 254, 'Hat/456101b02768e3dc252ca86c60a283b4b51711b9', 'Hat', 0, 0),
(9, 'Underwater', 64, 231, 'Background/9a638d15891454e298e92eb289b97ce83832f9d1', 'Background', 0, 0),
(9, 'Hooded Firelord', 60, 233, 'Hat/abcea0a62ab5e5b9ec697b5e1932207b10014fe7', 'Hat', 0, 0),
(9, 'Hooded SpaceLord', 35, 234, 'Hat/1cadeaab42c8e5742ee7fbbcae01b7b2ce36adee', 'Hat', 1, 0),
(9, 'DIY Doge', 51, 235, 'Hat/9803c307394eb5e7bb7de6d5f6ab35b44d84ad7d', 'Hat', 0, 0),
(20, 'Evil Skeptic', 74, 236, 'Face/8eb0a95ee2e1945398cfe5839eb3d892006576fe', 'Face', 0, 0),
(27, 'Nigel', 85, 257, 'Hat/aefeb31b704d8a1896325b93970272700c39209e', 'Hat', 0, 0),
(20, 'Hooded SpaceLord', 35, 239, 'Hat/1cadeaab42c8e5742ee7fbbcae01b7b2ce36adee', 'Hat', 0, 0),
(9, 'Epic Green Face', 77, 245, 'Hat/bbccf02c6d5eaa81ad63b611bddf984918b58a5f', 'Hat', 0, 0),
(20, 'Epic Green Face', 77, 241, 'Hat/bbccf02c6d5eaa81ad63b611bddf984918b58a5f', 'Hat', 0, 0),
(28, 'Black Shoes', 80, 259, 'Shoe/064e83c10b3f15e55962b258e35e7d63e94964c3', 'Shoe', 0, 0),
(9, 'Evil Skeptic', 74, 243, 'Face/8eb0a95ee2e1945398cfe5839eb3d892006576fe', 'Face', 0, 0),
(20, 'Grrr', 13, 246, 'Accessory/a304baff8c4301ab1185bfc4978c8edebe443a3b', 'Accessory', 0, 0),
(28, 'Purple Domino Crown', 48, 258, 'Hat/43227dca233ad96587f8cbd61cc12fe5264047ed', 'Hat', 0, 0),
(20, 'Black Shoes', 80, 248, 'Shoe/064e83c10b3f15e55962b258e35e7d63e94964c3', 'Shoe', 0, 0),
(20, 'Green Pants', 81, 249, 'Pants/ae0f0c6c10650a44472d5fc4f27228a1bc5c8a87', 'Pants', 0, 0),
(9, 'Black Shoes', 80, 250, 'Shoe/064e83c10b3f15e55962b258e35e7d63e94964c3', 'Shoe', 0, 0),
(31, 'Black Shoes', 80, 261, 'Shoe/064e83c10b3f15e55962b258e35e7d63e94964c3', 'Shoe', 0, 0),
(31, 'Evil Skeptic', 74, 262, 'Face/8eb0a95ee2e1945398cfe5839eb3d892006576fe', 'Face', 0, 0),
(31, 'Bubblegum', 50, 263, 'Accessory/45df5a71d1443e4c132991cabca08b95c584fefa', 'Accessory', 0, 0),
(31, 'Purple Ice crown', 33, 264, 'Hat/8d5fea80f4a6591e9fcc220ff43fb482e7557d95', 'Hat', 0, 0),
(8, 'Black Shoes', 80, 265, 'Shoe/064e83c10b3f15e55962b258e35e7d63e94964c3', 'Shoe', 0, 0),
(4, 'Bubblegum', 50, 271, 'Accessory/45df5a71d1443e4c132991cabca08b95c584fefa', 'Accessory', 0, 0),
(1, 'Avatar Life!', 88, 269, 'Background/a1fa9b824d5d840e7c79811f40cf3bd3472948b0', 'Background', 0, 0),
(4, 'Black hair', 45, 270, 'Hat/5613fd87d27fd0e314f9e47a09a9352704e5748b', 'Hat', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `itemComments`
--

CREATE TABLE IF NOT EXISTS `itemComments` (
  `itemid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` mediumtext NOT NULL,
  `authorid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `itemComments`
--

INSERT INTO `itemComments` (`itemid`, `id`, `comment`, `authorid`) VALUES
(12, 1, 'Failed lmao', 1),
(33, 2, 'Loving it!', 1),
(37, 3, 'Sold out!', 8),
(49, 4, '10/10', 2),
(56, 5, 'Like if you like it\r\n', 20),
(51, 6, 'Could you please give me credit for making the paper bag? Thanks!', 19),
(59, 7, 'Nice I like them.', 2),
(70, 8, 'Were almost out of gas call the arabs. (Boats and hoes, Boats and Hoes) gotta have beats to get boats and hoes.', 24),
(75, 9, '¬_¬', 20),
(85, 10, 'kek', 26);

-- --------------------------------------------------------

--
-- Table structure for table `Job`
--

CREATE TABLE IF NOT EXISTS `Job` (
  `type` mediumtext NOT NULL,
  `userid` int(9) NOT NULL,
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `jobid` int(4) NOT NULL,
  `Forum Moderator` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `type` mediumtext NOT NULL,
  `fromid` int(11) NOT NULL,
  `info` mediumtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `lottery`
--

CREATE TABLE IF NOT EXISTS `lottery` (
  `enterid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bucks` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `fromid` int(11) NOT NULL,
  `toid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` mediumtext NOT NULL,
  `body` mediumtext NOT NULL,
  `attachedBucks` int(11) NOT NULL,
  `GBL` int(11) NOT NULL,
  `read` int(11) NOT NULL,
  `removed` int(11) NOT NULL,
  `archive` int(11) NOT NULL,
  `attachedReebs` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`fromid`, `toid`, `id`, `subject`, `body`, `attachedBucks`, `GBL`, `read`, `removed`, `archive`, `attachedReebs`) VALUES
(1, 16, 1, 'Your friend request was accepted.', 'AvatarLife has accepted your friend request!', 0, 0, 1, 1, 0, 0),
(16, 1, 2, 'RE: Your friend request was accepted.', '\r\n\r\n\r\nAlrighttyyy\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 0, 0, 0),
(1, 1, 3, 'Your friend request was accepted.', 'God has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(1, 1, 4, 'Your friend request was accepted.', 'Admin has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(1, 9, 5, 'Your friend request was accepted.', 'thissite has accepted your friend request!', 0, 0, 0, 0, 1, 0),
(1, 16, 6, 'Your friend request was accepted.', 'Moderator has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(1, 1, 7, 'Trade Accepted', ' Moderator has accepted your trade request.', 0, 0, 1, 0, 0, 0),
(1, 1, 8, 'Trade Accepted', ' Moderator has accepted your trade request.', 0, 0, 1, 0, 0, 0),
(8, 1, 9, 'Are you hiring artist?', 'Mhm, I have a whole sets of hats made by me, and i''m sounds on avatar-life.tk.', 0, 0, 1, 0, 0, 0),
(1, 8, 10, 'RE: Are you hiring artist?', 'We are', 0, 0, 1, 0, 0, 0),
(1, 2, 11, 'Your friend request was accepted.', 'Mudkipz has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(3, 1, 12, 'Application | Reg. Moderator', 'User: Exodite\r\nOccupation of Applicant: Regular Application\r\nContact: Skype or my Email\r\n\r\nI''d like to apply to the position of a regular moderator; here is some background information of myself.\r\n\r\nGFX Designer - Sometimes I get bored and experiment but I also take request and also willing to dedicate some of my GFX to Avatar Life, no fees intended.\r\n\r\nROBLOXian - Addiction; a fun game that I enjoy playing which is also user-friendly and fun.\r\n\r\nTrustworthy Companion - I can be trusted set on tasks and on my jobs throughout Avatar Life and also in my life.\r\n\r\nI like to be trustworthy, I want to worm my way into the moderation team to make sure Avatar life is safer than ever and secure from trolling, hacking and exploiting through the client and within the site.\r\n\r\nI don''t want Avatar Life to be ruined and taken down by those selfish people so that is  why I''m stepping in and that is also why I sent you this application.\r\n\r\nPlease do respond as soon as possible.\r\n\r\nThank you.\r\n\r\nSigned, Exodite.', 0, 0, 1, 0, 0, 0),
(1, 2, 13, 'Your friend request was accepted.', 'Exodite has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(1, 3, 14, 'RE: Application | Reg. Moderator', 'Requirements:\r\n-Must be older than 13\r\n-Able to use skype\r\n-Must be active\r\n\r\n\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 1, 0, 0),
(1, 2, 15, 'Your friend request was accepted.', 'Crimmy has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(1, 2, 16, 'Your friend request was accepted.', 'Jesus has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(9, 2, 17, 'Love your hats!', 'Love your items you are uploading to the shop! Please continue!\r\n\r\nCommunity Moderator Mudkipz/Pikajew', 0, 0, 1, 0, 0, 0),
(2, 9, 18, 'RE: Love your hats!', '\r\n\r\nThank you\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 0, 1, 0),
(1, 2, 19, 'Your friend request was accepted.', 'Nicholas has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(1, 2, 20, 'Your friend request was accepted.', 'System has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(8, 19, 21, 'Important', 'You can only  Upload shirts and pants, you hats are great, but i''ll have to talk to the owner so he can put you artist.', 0, 0, 1, 0, 0, 0),
(1, 2, 22, 'Your friend request was accepted.', 'Northeastwales has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(20, 2, 23, 'Hello', 'Can you make me mod on chatbox so i can talk please?', 0, 0, 1, 0, 0, 0),
(2, 20, 24, 'RE: Hello', '\r\nI cannot admin you only AvatarLife can\r\n\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 0, 0, 0),
(2, 20, 25, 'RE: Hello', '\r\nI cannot admin you only AvatarLife can\r\n\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 0, 0, 0),
(20, 2, 26, 'RE: RE: Hello', '\r\n\r\n\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password\r\n\r\nOh ok', 0, 0, 1, 0, 0, 0),
(19, 8, 27, 'RE: Important', 'Ok, Thanks.\r\nAnd also, Could you give me credit on making the paper bag on the DIY Doge? I would very much appreciate that. \r\n\r\n\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 0, 0, 0),
(20, 2, 28, 'Dude', 'Can you make evil skeptic as limited?\r\n', 0, 0, 1, 0, 0, 0),
(20, 21, 29, 'Buy my item', 'http://avatarlife.pe.hu/Store/Item.php?id=64', 0, 0, 0, 0, 0, 0),
(2, 20, 30, 'RE: Dude', '\r\nTell me the face size\r\n\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 0, 0, 0),
(20, 21, 31, 'This background is underwater', 'http://avatarlife.pe.hu/Store/Item.php?id=64', 0, 0, 0, 0, 0, 0),
(20, 2, 32, 'RE: RE: Dude', '\r\n\r\n\r\n\r\nhttp://i.imgur.com/oqsM2vS.png\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 0, 0, 0),
(8, 19, 33, 'RE: RE: Important', '\r\nAlright\r\n\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 0, 0, 0, 0),
(1, 19, 34, 'Your friend request was accepted.', 'System has accepted your friend request!', 0, 0, 0, 0, 0, 0),
(1, 25, 35, 'Trade Accepted', ' God has accepted your trade request.', 0, 0, 0, 0, 0, 0),
(1, 1, 36, 'Your friend request was accepted.', 'System has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(1, 20, 37, 'Your friend request was accepted.', 'Mudkipz has accepted your friend request!', 0, 0, 1, 0, 0, 0),
(1, 0, 38, 'Your friend request was accepted.', 'Mudkipz has accepted your friend request!', 0, 0, 0, 0, 0, 0),
(20, 1, 39, 'RE: Your friend request was accepted.', '\r\nHi owner i want to say i sent the email to info@avatarlife.com\r\n\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 0, 0, 0),
(3, 1, 40, 'RE: RE: Application | Reg. Moderator', 'Ag3: 13\r\nProof: July 9th 2001\r\nGot Skype: d3v.Ant0ni0\r\nActive online 24/7.\r\n\r\n\r\n\r\n------------------------------------------------------------\r\nPlease remember that you should never send your password to ANYONE. No staff member will ask for your password.\r\n\r\n\r\n', 0, 0, 1, 0, 0, 0),
(1, 9, 41, 'Your friend request was accepted.', 'Exodite has accepted your friend request!', 0, 0, 0, 0, 1, 0),
(1, 9, 42, 'Your friend request was accepted.', 'Exodite has accepted your friend request!', 0, 0, 0, 0, 1, 0),
(1, 3, 43, 'Your friend request was accepted.', 'System has accepted your friend request!', 0, 0, 0, 0, 0, 0),
(1, 3, 44, 'Your friend request was accepted.', 'System has accepted your friend request!', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `profits`
--

CREATE TABLE IF NOT EXISTS `profits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `profitAmount` int(11) NOT NULL,
  `from` int(11) NOT NULL COMMENT '1=shop;2=pm;3=lottery;',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchases_mainstore`
--

CREATE TABLE IF NOT EXISTS `purchases_mainstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatorid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchases_userstore`
--

CREATE TABLE IF NOT EXISTS `purchases_userstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `creatorid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `refers`
--

CREATE TABLE IF NOT EXISTS `refers` (
  `senderid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `done` int(11) NOT NULL,
  `code` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `reporter` text NOT NULL,
  `reportee` text NOT NULL,
  `reason` text NOT NULL,
  `comment` text NOT NULL,
  `toid` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reportID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`reportID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Report_User`
--

CREATE TABLE IF NOT EXISTS `Report_User` (
  `Report_User` int(11) NOT NULL,
  `id` text NOT NULL,
  `reason` text NOT NULL,
  `comment` text NOT NULL,
  `userid` text NOT NULL,
  `reporterid` text NOT NULL,
  PRIMARY KEY (`Report_User`),
  UNIQUE KEY `Report_User_2` (`Report_User`),
  UNIQUE KEY `Report_User_3` (`Report_User`),
  KEY `Report_User` (`Report_User`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_mainstore`
--

CREATE TABLE IF NOT EXISTS `sales_mainstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatorid` int(11) NOT NULL,
  `buyerid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `buysell` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_userstore`
--

CREATE TABLE IF NOT EXISTS `sales_userstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatorid` int(11) NOT NULL,
  `buyerid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `buysell` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE IF NOT EXISTS `seller` (
  `id` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `buysell` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `Name` mediumtext NOT NULL,
  `Description` mediumtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatorid` int(11) NOT NULL,
  `path` mediumtext NOT NULL COMMENT 'i.e.- username/skin.png',
  `numbersold` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `islimited` int(11) NOT NULL COMMENT '0=no, 1-inf=amnt',
  `onsell` int(11) NOT NULL DEFAULT '1',
  `type` mediumtext NOT NULL,
  `MouthPath` mediumtext NOT NULL,
  `remaining` int(11) NOT NULL,
  `rare` int(11) NOT NULL,
  `allowcomment` int(11) NOT NULL DEFAULT '1',
  `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ismain` int(11) NOT NULL COMMENT '0=no;yes=true;',
  `accepted` int(11) NOT NULL,
  `reebprice` int(11) NOT NULL,
  `buysell` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=89 ;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`Name`, `Description`, `id`, `creatorid`, `path`, `numbersold`, `price`, `islimited`, `onsell`, `type`, `MouthPath`, `remaining`, `rare`, `allowcomment`, `Created`, `ismain`, `accepted`, `reebprice`, `buysell`) VALUES
('Domino Crown', ' ', 1, 2, 'Hat/cdab215d6da2a06ec08d7b8a55cabbe0b2371bf0', 4, 50, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 18:19:47', 0, 1, 0, 0),
('Classic Fedora', 'First official item!', 2, 1, 'Hat/78c363ad26cc6e7591c1731e89347ba3e6efda73', 4, 100, 1, 1, 'Hat', '', 16, 0, 1, '2015-05-19 18:21:28', 1, 1, 0, 0),
('Crimson Dominus', ' ', 3, 2, 'Hat/b228d2392a543424de32b49da7c23a854091a1e6', 4, 20, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 18:21:35', 0, 1, 0, 0),
('Flash Crown', 'This is now here!', 4, 1, 'Hat/058a71c9872df6485e142cc8a8abc713dd9266ad', 3, 1000, 1, 1, 'Hat', '', 17, 0, 1, '2015-05-19 18:23:26', 1, 1, 0, 0),
('Azurewrath of Frost', ' ', 5, 2, 'Hat/07e997e5f21f07cd6f7c3750f81d8d33b87c397c', 5, 10, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 18:23:52', 0, 1, 0, 0),
('Dominus Ignis', ' ', 6, 2, 'Hat/975c538f01f648df326960a118548fac5daa94cb', 4, 30, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 18:25:34', 0, 1, 0, 0),
('Dominus Viridian', ' ', 7, 2, 'Hat/0c03f8d1b665c25f4b4309e6a680d6a276087e0c', 3, 20, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 18:26:43', 0, 1, 0, 0),
('Teal SparkleTime Fedora', '', 8, 2, 'Hat/3308bd2e9cc19202c62718fa1a53f7dd046b86ca', 4, 15, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 18:27:51', 0, 1, 0, 0),
('Grrr', ' Gr', 13, 1, 'Accessory/a304baff8c4301ab1185bfc4978c8edebe443a3b', 5, 12, 0, 1, 'Accessory', '', 0, 0, 1, '2015-05-19 18:33:59', 1, 1, 0, 0),
('Epic Face', ' ', 14, 2, 'Hat/28a04265053b5c64542f4fe2d981dc9c262f3d9d', 4, 4, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 18:35:56', 1, 1, 0, 0),
('Chicken suit', ' Telamons famous chicken suit', 46, 8, 'Hat/71ab1264fad947f977ad9288b62bee9befa7adc7', 2, 7, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 22:24:31', 1, 1, 0, 0),
('Gas Mask', 'Oooo ', 16, 1, 'Accessory/99307715571227637e1dec62d0ace4dbcebaac20', 3, 50, 0, 1, 'Accessory', '', 0, 0, 1, '2015-05-19 18:43:47', 1, 1, 0, 0),
('Hooded SpaceLord', ' ', 35, 2, 'Hat/1cadeaab42c8e5742ee7fbbcae01b7b2ce36adee', 6, 14, 1, 1, 'Hat', '', 3, 0, 1, '2015-05-19 19:49:08', 1, 1, 0, 0),
('Combat Top', 'War!', 20, 1, 'Shirt/4ad42ec5cd41001a6211eafb93ce929b85b47020', 5, 5, 0, 1, 'Shirt', '', 0, 0, 1, '2015-05-19 18:52:45', 1, 1, 0, 0),
('Ze pants', 'War! ', 22, 1, 'Pants/9a872d2c5938ea3f4512c45f976f58722935a967', 5, 5, 0, 1, 'Pants', '', 0, 0, 1, '2015-05-19 18:54:14', 1, 1, 0, 0),
('Galaxy', ' ', 31, 2, 'Background/ba502b75bf851c4ff3832f44fb7fe4a7f1928711', 3, 2, 0, 1, 'Background', '', 0, 0, 1, '2015-05-19 19:29:09', 1, 1, 0, 0),
('Purple Ice crown', ' ', 33, 2, 'Hat/8d5fea80f4a6591e9fcc220ff43fb482e7557d95', 3, 10, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 19:31:06', 1, 1, 0, 0),
('Pinish Domino', 'Ooo', 34, 1, 'Hat/456101b02768e3dc252ca86c60a283b4b51711b9', 2, 1000, 1, 1, 'Hat', '', 3, 0, 1, '2015-05-19 19:43:01', 1, 1, 0, 0),
('Dusekkar', 'Awesomeness lives in this hat -System', 37, 8, 'Hat/468f8919f835983bd5da9e680ed911ba7c37aa16', 2, 15, 1, 1, 'Hat', '', 0, 0, 1, '2015-05-19 21:57:00', 1, 1, 0, 0),
('Red Icecrown', ' ;D', 39, 2, 'Hat/85a380bc274fedcead15b16df580a2195dbd7338', 4, 7, 1, 1, 'Hat', '', 0, 0, 1, '2015-05-19 22:14:17', 1, 1, 0, 0),
('Green Icecrown', ' Icey', 40, 2, 'Hat/2ebd834c1dbaa4efeb610dd4b6c63910093daeca', 2, 3, 1, 1, 'Hat', '', 0, 0, 1, '2015-05-19 22:16:56', 1, 1, 0, 0),
('Black hair', 'Just hair', 45, 8, 'Hat/5613fd87d27fd0e314f9e47a09a9352704e5748b', 4, 5, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 22:22:47', 1, 1, 0, 0),
('Red Domino Crown3', ' ', 44, 2, 'Hat/4b742aed264b0349b14c4dc3d2e09dfcd5e4a51e', 2, 30, 1, 1, 'Hat', '', 1, 0, 1, '2015-05-19 22:21:34', 1, 1, 0, 0),
('Obey shirt', 'You know incase you need some cool', 47, 8, 'Shirt/28dbaea4ff5d7d1eead379ac952341deec17ad00', 4, 3, 0, 1, 'Shirt', '', 0, 0, 1, '2015-05-19 22:26:45', 1, 1, 0, 0),
('Purple Domino Crown', ' PDC', 48, 2, 'Hat/43227dca233ad96587f8cbd61cc12fe5264047ed', 2, 19, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 22:28:48', 1, 1, 0, 0),
('Undead Dominus', 'The deadliest dominus around', 49, 8, 'Hat/9f19b0d08d0e7bb8bb29250e8ce38548168a26da', 3, 25, 1, 1, 'Hat', '', 0, 0, 1, '2015-05-19 22:30:48', 1, 1, 0, 0),
('Bubblegum', 'Just chewin on my gum no trouble here', 50, 8, 'Accessory/45df5a71d1443e4c132991cabca08b95c584fefa', 6, 2, 0, 1, 'Accessory', '', 0, 0, 1, '2015-05-19 22:40:34', 1, 1, 0, 0),
('DIY Doge', 'Just a dog drawn on a paper bag ', 51, 8, 'Hat/9803c307394eb5e7bb7de6d5f6ab35b44d84ad7d', 3, 5, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-19 22:50:45', 1, 1, 0, 0),
('Teal Icecrown', ' ', 52, 2, 'Hat/0cea2e048fe862d9647d82a5582056b5a2e76be7', 3, 4, 1, 1, 'Hat', '', 0, 0, 1, '2015-05-19 22:56:54', 1, 1, 0, 0),
('Brofist', 'BROFIST', 56, 20, 'Shirt/120053830f2a5d7e6f42ccac09276bb07d75d528', 3, 12, 0, 1, 'Shirt', '', 0, 0, 1, '2015-05-19 23:21:11', 0, 1, 5, 0),
('Avatar Life!', ' Ooo ya!', 88, 1, 'Background/a1fa9b824d5d840e7c79811f40cf3bd3472948b0', 0, 1, 0, 1, 'Background', '', 0, 0, 1, '2015-05-20 17:31:54', 1, 1, 0, 0),
('Sweat pants', 'Stay cozy in these cozy pants!', 59, 19, 'Pants/e7634b775e8cea0b87398b0ea477ef8ae1c65f65', 5, 1, 0, 1, 'Pants', '', 0, 0, 1, '2015-05-20 01:06:41', 0, 1, 0, 0),
('Hooded Firelord', ' ', 60, 2, 'Hat/abcea0a62ab5e5b9ec697b5e1932207b10014fe7', 2, 1, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-20 01:13:00', 1, 1, 0, 0),
('Nigel', ' smash', 85, 27, 'Hat/aefeb31b704d8a1896325b93970272700c39209e', 0, 2, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-20 16:05:36', 0, 1, 0, 0),
('Green Pants', ' ', 81, 20, 'Pants/ae0f0c6c10650a44472d5fc4f27228a1bc5c8a87', 1, 1, 0, 1, 'Pants', '', 0, 0, 1, '2015-05-20 14:28:56', 0, 1, 0, 0),
('Underwater', ' ', 64, 20, 'Background/9a638d15891454e298e92eb289b97ce83832f9d1', 2, 2, 0, 1, 'Background', '', 0, 0, 1, '2015-05-20 02:11:56', 0, 1, 0, 0),
('Red Tango', 'WORKS BUT CANT PUT ON CLOTHES BUT HATS YES', 69, 2, 'Accessory/0f1c0609b8034c454087d89f02863785fb2f1240', 3, 3, 1, 1, 'Accessory', '', 0, 0, 1, '2015-05-20 03:07:46', 1, 1, 0, 0),
('Black Shoes', ' ', 80, 20, 'Shoe/064e83c10b3f15e55962b258e35e7d63e94964c3', 4, 2, 0, 1, 'Shoe', '', 0, 0, 1, '2015-05-20 14:26:54', 0, 1, 0, 0),
('Evil Skeptic', ' Dont delete its a face', 74, 20, 'Face/8eb0a95ee2e1945398cfe5839eb3d892006576fe', 2, 6, 0, 1, 'Face', '', 0, 0, 1, '2015-05-20 12:01:21', 0, 1, 0, 0),
('Epic Green Face', ' ', 77, 20, 'Hat/bbccf02c6d5eaa81ad63b611bddf984918b58a5f', 1, 4, 0, 1, 'Hat', '', 0, 0, 1, '2015-05-20 12:35:25', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shout`
--

CREATE TABLE IF NOT EXISTS `shout` (
  `shout` mediumtext NOT NULL,
  `by` text NOT NULL,
  `color` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shout`
--

INSERT INTO `shout` (`shout`, `by`, `color`) VALUES
('Chance to win 100k+ Post here: http://avatarlife.pe.hu/Forum/Thread.php?id=22', '', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `shout_hist`
--

CREATE TABLE IF NOT EXISTS `shout_hist` (
  `shouter` text NOT NULL,
  `shout` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statusupdate`
--

CREATE TABLE IF NOT EXISTS `statusupdate` (
  `statusupdate` int(11) NOT NULL,
  `authorid` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tc`
--

CREATE TABLE IF NOT EXISTS `tc` (
  `reebtobuck` int(11) NOT NULL,
  `bucktoreeb` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tc`
--

INSERT INTO `tc` (`reebtobuck`, `bucktoreeb`, `date`, `id`) VALUES
(15, 7, '2015-05-19 22:03:50', 1),
(16, 17, '2015-05-19 22:04:47', 2),
(9, 11, '2015-05-20 16:20:10', 3);

-- --------------------------------------------------------

--
-- Table structure for table `trade`
--

CREATE TABLE IF NOT EXISTS `trade` (
  `fromid` int(11) NOT NULL,
  `toid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myitemid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `trade`
--

INSERT INTO `trade` (`fromid`, `toid`, `itemid`, `id`, `myitemid`) VALUES
(9, 2, 159, 5, 108),
(9, 22, 188, 4, 108);

-- --------------------------------------------------------

--
-- Table structure for table `verify`
--

CREATE TABLE IF NOT EXISTS `verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `token` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
