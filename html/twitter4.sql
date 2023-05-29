-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 03:16 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(140) COLLATE utf16_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `post_id`, `time`) VALUES
(44, 'great work', 25, 574, '2021-05-01 02:21:10'),
(45, 'sasa', 2, 712, '2021-05-01 05:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `follower_id`, `following_id`, `time`) VALUES
(15, 40, 2, '2021-04-19 18:30:06'),
(16, 33, 2, '2021-04-19 18:30:56'),
(41, 37, 2, '2021-04-20 20:19:49'),
(43, 5, 2, '2021-04-20 20:20:32'),
(44, 27, 2, '2021-04-20 20:21:18'),
(45, 34, 2, '2021-04-20 20:22:07'),
(90, 41, 2, '2021-04-25 18:20:22'),
(94, 25, 27, '2021-04-27 07:07:27'),
(98, 42, 2, '2021-04-29 06:30:41'),
(99, 43, 2, '2021-04-29 06:32:50'),
(100, 44, 2, '2021-04-29 18:17:25'),
(101, 2, 25, '2021-04-30 02:16:24'),
(102, 25, 2, '2021-04-30 22:56:21'),
(120, 54, 2, '2021-05-01 06:57:13'),
(121, 55, 2, '2021-05-12 16:18:45'),
(126, 56, 2, '2021-05-12 16:35:31'),
(128, 57, 2, '2021-05-12 18:23:30'),
(129, 58, 2, '2021-05-13 14:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(192, 2, 362),
(209, 25, 573),
(211, 2, 573),
(214, 2, 574),
(224, 25, 635),
(225, 25, 712),
(227, 2, 711);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notify_for` int(11) NOT NULL,
  `notify_from` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('follow','like','retweet','qoute','comment','reply','mention') COLLATE utf16_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `count` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notify_for`, `notify_from`, `target`, `type`, `time`, `count`, `status`) VALUES
(30, 2, 25, 635, 'like', '2021-04-29 05:50:12', 1, 0),
(32, 2, 42, 0, 'follow', '2021-04-29 06:30:41', 1, 0),
(34, 2, 25, 711, 'qoute', '2021-04-29 18:29:24', 1, 0),
(35, 25, 2, 712, 'qoute', '2021-04-29 18:29:55', 1, 0),
(36, 2, 25, 712, 'like', '2021-04-29 18:31:11', 1, 0),
(37, 2, 25, 712, 'retweet', '2021-04-29 18:31:19', 1, 0),
(38, 25, 2, 0, 'follow', '2021-04-30 02:16:24', 1, 0),
(39, 2, 25, 0, 'follow', '2021-04-30 22:56:20', 1, 0),
(53, 2, 25, 574, 'comment', '2021-05-01 02:21:10', 1, 0),
(54, 25, 2, 574, 'reply', '2021-05-01 02:21:51', 1, 0),
(55, 2, 42, 725, 'mention', '2021-05-01 02:25:37', 1, 0),
(58, 25, 2, 711, 'like', '2021-05-01 04:32:36', 1, 0),
(67, 2, 54, 0, 'follow', '2021-05-01 06:57:13', 1, 0),
(68, 2, 55, 0, 'follow', '2021-05-12 16:18:46', 1, 0),
(73, 2, 56, 0, 'follow', '2021-05-12 16:35:31', 1, 0),
(75, 2, 57, 0, 'follow', '2021-05-12 18:23:30', 1, 0),
(76, 2, 58, 0, 'follow', '2021-05-13 14:52:58', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_on`) VALUES
(362, 2, '2021-02-06 08:31:07'),
(573, 2, '2021-04-02 03:03:39'),
(574, 2, '2021-04-02 03:04:53'),
(635, 2, '2021-04-15 09:03:32'),
(654, 2, '2021-04-25 02:19:45'),
(711, 25, '2021-04-29 18:29:24'),
(712, 2, '2021-04-29 18:29:55');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` varchar(140) COLLATE utf16_unicode_ci NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `comment_id`, `user_id`, `reply`, `time`) VALUES
(11, 44, 2, 'ty', '2021-05-01 02:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `retweets`
--

CREATE TABLE `retweets` (
  `post_id` int(11) NOT NULL,
  `retweet_msg` varchar(140) COLLATE utf16_unicode_ci DEFAULT NULL,
  `tweet_id` int(11) DEFAULT NULL,
  `retweet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `retweets`
--

INSERT INTO `retweets` (`post_id`, `retweet_msg`, `tweet_id`, `retweet_id`) VALUES
(711, 'good job', 654, NULL),
(712, '&lt;3', NULL, 711);

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `id` int(11) NOT NULL,
  `hashtag` varchar(140) COLLATE utf16_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`id`, `hashtag`, `created_on`) VALUES
(1, 'php', '2021-01-06 05:57:43'),
(4, 'hi', '2021-01-25 21:42:35'),
(5, 'alex', '2021-01-25 21:42:36'),
(6, '7oda', '2021-03-20 23:40:12'),
(9, 'js', '2021-04-02 03:24:28'),
(12, 'bro', '2021-04-02 03:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `post_id` int(11) NOT NULL,
  `status` varchar(140) COLLATE utf16_unicode_ci DEFAULT NULL,
  `img` text COLLATE utf16_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`post_id`, `status`, `img`) VALUES
(362, '@amin hello it\'s amin here!', NULL),
(573, 'one day!', 'tweet-60666d6b426a1.jpg'),
(574, '#php is fun', NULL),
(635, '', 'tweet-6077e54477f73.jpeg'),
(654, 'it\'s all about big dreams!', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(40) COLLATE utf16_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf16_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf16_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `imgCover` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT 'cover.png',
  `bio` varchar(140) COLLATE utf16_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `img`, `imgCover`, `bio`, `location`, `website`) VALUES
(2, 'amin', 'amin@twitter.com', '8e4e9b7ac6fc0df9e06f57f1c366cf8a', 'Amin.', 'user-608b4b4187b5c.JPG', 'user-607ef530bdeab.jpg', 'Undergraduate Software Engineer.', 'Alexandria,Egypt', 'https://github.com/aminyasser'),
(5, 'bodatolba', 'tolba@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tolba', 'default.jpg', 'cover.png', '', '', ''),
(25, '7oda', '7oda@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', '7oda', 'default.jpg', 'cover.png', '', '', ''),
(27, 'hasona', 'hasona@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'hassan', 'default.jpg', 'cover.png', '', '', ''),
(33, '7odawael', 'wael@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mahmoud', 'default.jpg', 'cover.png', '', '', ''),
(34, 'haidy', 'haidy@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'haidy', 'default.jpg', 'cover.png', '', '', ''),
(37, 'aminn', 'amin1@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Amin Yasser', 'default.jpg', 'cover.png', '', '', ''),
(40, 'mohanadyasser', 'mohanad@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mohanad', 'default.jpg', 'cover.png', '', '', ''),
(41, 'khaled0', 'khaled@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Khalid', 'default.jpg', 'cover.png', '', '', ''),
(42, 'ahmed0', 'ahmed@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ahmed', 'default.jpg', 'user-609be2968c0b9.png', '', '', ''),
(43, 'samy', 'samy@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Samy', 'default.jpg', 'cover.png', '', '', ''),
(44, 'remo', 'remo@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ramez', 'default.jpg', 'cover.png', '', '', ''),
(54, 'aminyasser', 'amino@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Amin Yasser', 'default.jpg', 'cover.png', '', '', ''),
(55, 'sasaa', 'aminsss@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Amin Yasser', 'user-609be3deec8e5.jpg', 'cover.png', '', '', ''),
(56, 'nbnbkj', 'nn@twittt.com', 'e10adc3949ba59abbe56e057f20f883e', 'Markting', 'default.jpg', 'cover.png', '', '', ''),
(57, 'sas', 'amin@ydar.com', 'e10adc3949ba59abbe56e057f20f883e', 'Amin Yasser', 'default.jpg', 'cover.png', '', '', ''),
(58, '201', 'amin111@twitter.com', 'e10adc3949ba59abbe56e057f20f883e', 'Amin1', 'default.jpg', 'cover.png', 'Hey', '', ''),
(59,'tinyelephant275','evelyn.watson@example.com','f8e6d3cb3ab17623ac645967d50fba8b','Evelyn','default.jpg','cover.png','None','United States','example.com'),
(60,'yellowostrich512','alfred.adams@example.com','bd2ad056056683306b5730e3f2e8ff13','Alfred','default.jpg','cover.png','None','United States','example.com'),
(61,'greencat743','connor.turner@example.com','e8b318424ae3449996c3f21bda86b25b','Connor','default.jpg','cover.png','None','United States','example.com'),
(62,'orangegoose693','naomi.watkins@example.com','276e697e74e8b5264465139a480db556','Naomi','default.jpg','cover.png','None','United States','example.com'),
(63,'purplebird382','roberta.richardson@example.com','9f3b8e770f43d1ee64cc0c0ae1e0bf3f','Roberta','default.jpg','cover.png','None','United States','example.com'),
(64,'organicswan901','mattie.murray@example.com','451c34bd9452b95c33e226facc4d85ef','Mattie','default.jpg','cover.png','None','United States','example.com'),
(65,'organicmouse146','randall.jordan@example.com','f63f4fbc9f8c85d409f2f59f2b9e12d5','Randall','default.jpg','cover.png','None','United States','example.com'),
(66,'bluelion297','henry.ruiz@example.com','3b6281fa2ce2b6c20669490ef4b026a4','Henry','default.jpg','cover.png','None','United States','example.com'),
(67,'blueduck648','erica.jones@example.com','799d978330dff449f8244947929a4518','Erica','default.jpg','cover.png','None','United States','example.com'),
(68,'brownbear313','gregory.watson@example.com','166ee015c0e0934a8781e0c86a197c6e','Gregory','default.jpg','cover.png','None','United States','example.com'),
(69,'greenkoala715','benjamin.spencer@example.com','29ddc288099264c17b07baf44d3f0adc','Benjamin','default.jpg','cover.png','None','United States','example.com'),
(70,'blackcat384','karl.oliver@example.com','30f1f5b7ab09f3c95ce5c5c824622d1a','Karl','default.jpg','cover.png','None','United States','example.com'),
(71,'smallbear992','marc.evans@example.com','143a299485808af42d46ab8feb3d8cfa','Marc','default.jpg','cover.png','None','United States','example.com'),
(72,'purplemouse944','isabella.bates@example.com','cf8f3b8dc5023b34961e6ff3a7e13fe8','Isabella','default.jpg','cover.png','None','United States','example.com'),
(73,'beautifulostrich853','angel.holland@example.com','e8847133c4152d265693f33033736cb0','Angel','default.jpg','cover.png','None','United States','example.com'),
(74,'biggorilla362','diane.sanders@example.com','fc3db7a8e34b63e73a60e25d519d099c','Diane','default.jpg','cover.png','None','United States','example.com'),
(75,'orangepeacock289','leslie.lee@example.com','2a83283e48961d851b316e553dba7211','Leslie','default.jpg','cover.png','None','United States','example.com'),
(76,'angrybird861','june.rice@example.com','2de3e7e6aab22cfe40b21f071283c565','June','default.jpg','cover.png','None','United States','example.com'),
(77,'heavygoose867','theresa.spencer@example.com','c77f5eb4d7d525855522d7ac65c5487d','Theresa','default.jpg','cover.png','None','United States','example.com'),
(78,'tinydog298','anne.mendoza@example.com','0412602282fa1221ff211994895aa4d2','Anne','default.jpg','cover.png','None','United States','example.com'),
(79,'greenrabbit611','max.hopkins@example.com','d016b20073c1e0616393552c13b2647b','Max','default.jpg','cover.png','None','United States','example.com'),
(80,'smallrabbit213','derek.soto@example.com','f5ffc847c2072ffb5fda82edd30bc19f','Derek','default.jpg','cover.png','None','United States','example.com'),
(81,'tinybird415','rosa.cole@example.com','457967149ea112e14aa6e1a521567e38','Rosa','default.jpg','cover.png','None','United States','example.com'),
(82,'lazylion412','sonia.smith@example.com','acff7ecceeb4c799d280f7252a2b3585','Sonia','default.jpg','cover.png','None','United States','example.com'),
(83,'beautifulwolf941','louis.snyder@example.com','6ae7d2d07dc17d6de8a20f25e62d30d9','Louis','default.jpg','cover.png','None','United States','example.com'),
(84,'greencat232','johnni.fuller@example.com','5223948fbe5b980cf9aae3442a1c16fe','Johnni','default.jpg','cover.png','None','United States','example.com'),
(85,'goldenkoala759','harold.schmidt@example.com','e78caf56938df35dc210cca36f591e38','Harold','default.jpg','cover.png','None','United States','example.com'),
(86,'smalldog913','alfredo.harris@example.com','7c6483ddcd99eb112c060ecbe0543e86','Alfredo','default.jpg','cover.png','None','United States','example.com'),
(87,'bigzebra883','rhonda.lambert@example.com','19f0bd5f2a2c58ebdbbecb1a7a467a71','Rhonda','default.jpg','cover.png','None','United States','example.com'),
(88,'bluegorilla440','debbie.harrison@example.com','fa83f40479a04df219641b58c911b417','Debbie','default.jpg','cover.png','None','United States','example.com'),
(89,'biglion288','theresa.tucker@example.com','5cc224100427d254d62b1fe5fc7883b3','Theresa','default.jpg','cover.png','None','United States','example.com'),
(90,'happybird205','holly.steward@example.com','4eea3a439fa46f1e7395b327a0e9ee54','Holly','default.jpg','cover.png','None','United States','example.com'),
(91,'ticklishmouse478','fernando.mendoza@example.com','298b8014da335621303db1a76500a6dc','Fernando','default.jpg','cover.png','None','United States','example.com'),
(92,'angryfrog471','louis.obrien@example.com','a6e43300cd419da1ffb3e8389919fa33','Louis','default.jpg','cover.png','None','United States','example.com'),
(93,'goldenfish198','joseph.morris@example.com','4a745f30c7c721a55c15cb85043b244d','Joseph','default.jpg','cover.png','None','United States','example.com'),
(94,'orangebird121','frederick.wheeler@example.com','53066aee5deb25f2805c369c101abd81','Frederick','default.jpg','cover.png','None','United States','example.com'),
(95,'crazywolf760','fernando.murphy@example.com','924e509403341760676d4f1368c87f8d','Fernando','default.jpg','cover.png','None','United States','example.com'),
(96,'brownpeacock388','lewis.bryant@example.com','f0d9188d772c111cab3fdc2606ec0d99','Lewis','default.jpg','cover.png','None','United States','example.com'),
(97,'greentiger876','jim.carlson@example.com','a9575efd6da5a277322853c68081ab88','Jim','default.jpg','cover.png','None','United States','example.com'),
(98,'browngoose174','samuel.reynolds@example.com','062d49b6a1d728931cbe173fb26fbcfa','Samuel','default.jpg','cover.png','None','United States','example.com'),
(99,'bluekoala862','olivia.byrd@example.com','8e5f3adee38c8fccc13c1f3be0143796','Olivia','default.jpg','cover.png','None','United States','example.com'),
(100,'heavytiger811','wesley.wheeler@example.com','bb52aeb112dec1f523b47e0b1be60aed','Wesley','default.jpg','cover.png','None','United States','example.com'),
(101,'orangeduck340','phyllis.holt@example.com','9818e2287e76d37753313e255e2428a2','Phyllis','default.jpg','cover.png','None','United States','example.com'),
(102,'purplemouse694','norman.nichols@example.com','5a6e76d426dbf0d54218af925ef6e5cd','Norman','default.jpg','cover.png','None','United States','example.com'),
(103,'sadelephant202','chris.walters@example.com','d0684cfe844d7353619932ef26fa6e90','Chris','default.jpg','cover.png','None','United States','example.com'),
(104,'beautifulpanda787','anna.washington@example.com','0954b97bc68be3f3123dad0b2c918c5b','Anna','default.jpg','cover.png','None','United States','example.com'),
(105,'blackbear132','nicholas.grant@example.com','a557264a7d6c783f6fb57fb7d0b9d6b0','Nicholas','default.jpg','cover.png','None','United States','example.com'),
(106,'orangeelephant766','francis.lawrence@example.com','66d086b249ac5449cf1e62335cfcc001','Francis','default.jpg','cover.png','None','United States','example.com'),
(107,'goldengoose704','tracy.bennett@example.com','509ee77f6b418321a66bfd21b64eaac4','Tracy','default.jpg','cover.png','None','United States','example.com'),
(108,'ticklishelephant103','philip.porter@example.com','52bd43d37ed62eb4c226e31841bc03dc','Philip','default.jpg','cover.png','None','United States','example.com'),
(109,'happyleopard706','leona.palmer@example.com','ac246ff5e386c511f01d2cfb69c047bd','Leona','default.jpg','cover.png','None','United States','example.com'),
(110,'sadwolf667','tristan.wells@example.com','ca654591d4ac97414391907f882b3c05','Tristan','default.jpg','cover.png','None','United States','example.com'),
(111,'orangefrog437','max.ortiz@example.com','cf4c2232354952690368f1b3dfdfb24d','Max','default.jpg','cover.png','None','United States','example.com'),
(112,'whiteostrich532','mason.walters@example.com','2da1ab427df46b3cf8c7b28536c41fa5','Mason','default.jpg','cover.png','None','United States','example.com'),
(113,'whitebird537','tonya.larson@example.com','879253fe01bbe1ec981f2fadd0816389','Tonya','default.jpg','cover.png','None','United States','example.com'),
(114,'happyswan921','catherine.collins@example.com','15e5c87b18c1289d45bb4a72961b58e8','Catherine','default.jpg','cover.png','None','United States','example.com'),
(115,'biggoose516','tonya.castillo@example.com','e15806424fcd348214138bc43b2bb9e1','Tonya','default.jpg','cover.png','None','United States','example.com'),
(116,'blackswan109','duane.wilson@example.com','8977ecbb8cb82d77fb091c7a7f186163','Duane','default.jpg','cover.png','None','United States','example.com'),
(117,'beautifulswan651','martha.riley@example.com','de7de37a35074c337d73b6eaa9bd22dc','Martha','default.jpg','cover.png','None','United States','example.com'),
(118,'sadbird129','fernando.murray@example.com','23fc4cba066f390a8cc729c7592b6ee8','Fernando','default.jpg','cover.png','None','United States','example.com'),
(119,'smallbird381','darrell.austin@example.com','f1bdf5ed1d7ad7ede4e3809bd35644b0','Darrell','default.jpg','cover.png','None','United States','example.com'),
(120,'ticklishlion965','alan.barnett@example.com','25f91520f22005da43a125ccf41a3a26','Alan','default.jpg','cover.png','None','United States','example.com'),
(121,'yellowcat480','lois.mills@example.com','ede929c0da3a3daa87fd9b9732462acb','Lois','default.jpg','cover.png','None','United States','example.com'),
(122,'happypeacock364','vivan.shelton@example.com','78d6810e1299959f3a8db157045aa926','Vivan','default.jpg','cover.png','None','United States','example.com'),
(123,'beautifulbear963','alicia.king@example.com','c67d737bfa90263510c15128c6a1a303','Alicia','default.jpg','cover.png','None','United States','example.com'),
(124,'beautifulzebra295','alex.gray@example.com','1bec52f7fccc9524493d8fae117a0bc8','Alex','default.jpg','cover.png','None','United States','example.com'),
(125,'organicbird598','hailey.black@example.com','89f3a21f6d184df6a92c9a4097380c22','Hailey','default.jpg','cover.png','None','United States','example.com'),
(126,'bigrabbit369','harvey.ellis@example.com','830aec6cc0ee531b040e5f845a9adffb','Harvey','default.jpg','cover.png','None','United States','example.com'),
(127,'silvertiger745','ralph.steward@example.com','a5410ee37744c574ba5790034ea08f79','Ralph','default.jpg','cover.png','None','United States','example.com'),
(128,'crazyleopard488','wilma.flores@example.com','e3408432c1a48a52fb6c74d926b38886','Wilma','default.jpg','cover.png','None','United States','example.com'),
(129,'redsnake569','franklin.stephens@example.com','4b418de29850e887ec758c2ad6dd8c2f','Franklin','default.jpg','cover.png','None','United States','example.com'),
(130,'lazykoala777','peyton.snyder@example.com','0aa08b5c91758a166d13e7cd3f455951','Peyton','default.jpg','cover.png','None','United States','example.com'),
(131,'angryelephant407','violet.beck@example.com','79d8e340812f9db0bbfa508beb319dea','Violet','default.jpg','cover.png','None','United States','example.com'),
(132,'greentiger244','lori.thomas@example.com','63c762af1ff110e97f8b7cb925d36bf7','Lori','default.jpg','cover.png','None','United States','example.com'),
(133,'angrybear539','barry.hopkins@example.com','05e7d19a6d002118deef70d21ff4226e','Barry','default.jpg','cover.png','None','United States','example.com'),
(134,'organicpeacock413','heidi.jones@example.com','6462416cfcbbcf58de319854041b737d','Heidi','default.jpg','cover.png','None','United States','example.com'),
(135,'angrybutterfly739','sonia.kuhn@example.com','71b475cbc823152cb82e8aef5fc03edf','Sonia','default.jpg','cover.png','None','United States','example.com'),
(136,'happyswan453','eduardo.allen@example.com','1ea6a3eb3f30a100a0c2610b2a16d4e8','Eduardo','default.jpg','cover.png','None','United States','example.com'),
(137,'bigsnake992','arnold.reyes@example.com','7a3de2ae903ca43616cdeafb11bbf4d1','Arnold','default.jpg','cover.png','None','United States','example.com'),
(138,'blackwolf433','sue.harris@example.com','952033a3f15b0dff8d4d6d1b33da7aa4','Sue','default.jpg','cover.png','None','United States','example.com'),
(139,'bigtiger704','irene.byrd@example.com','a3f222e616de01ad575d2532fd68b591','Irene','default.jpg','cover.png','None','United States','example.com'),
(140,'lazyladybug333','katie.murphy@example.com','34c336827b750ba10a020fd62ec4664f','Katie','default.jpg','cover.png','None','United States','example.com'),
(141,'purplesnake296','letitia.jacobs@example.com','b68f6bc27bf88929c04ae34c7090a19d','Letitia','default.jpg','cover.png','None','United States','example.com'),
(142,'bigbutterfly299','darrell.sullivan@example.com','813f8ce580f276558ce9e5093468b1ab','Darrell','default.jpg','cover.png','None','United States','example.com'),
(143,'bluekoala693','jorge.ross@example.com','83a1a1c1da46c00a08618d063a6abf11','Jorge','default.jpg','cover.png','None','United States','example.com'),
(144,'heavytiger187','dolores.watson@example.com','e67a7144f9a51413e6b6fd01566be7c7','Dolores','default.jpg','cover.png','None','United States','example.com'),
(145,'angryleopard403','martin.oliver@example.com','bbbd53e913a404b04abf373dc1dac49b','Martin','default.jpg','cover.png','None','United States','example.com'),
(146,'blackzebra646','jon.payne@example.com','c7561db7a418dd39b2201dfe110ab4a4','Jon','default.jpg','cover.png','None','United States','example.com'),
(147,'goldenkoala414','fernando.meyer@example.com','5b6ba13f79129a74a3e819b78e36b922','Fernando','default.jpg','cover.png','None','United States','example.com'),
(148,'biggorilla526','caleb.woods@example.com','c68763c0c7204310ef465cfd4d034441','Caleb','default.jpg','cover.png','None','United States','example.com'),
(149,'crazymouse883','eugene.craig@example.com','574ff4699083ce51de0dabcfad5edc4c','Eugene','default.jpg','cover.png','None','United States','example.com'),
(150,'yellowzebra721','francis.montgomery@example.com','9407c826d8e3c07ad37cb2d13d1cb641','Francis','default.jpg','cover.png','None','United States','example.com'),
(151,'tinyfrog503','camila.jacobs@example.com','c960a0f3bf871d7da2a8413ae78f7b5f','Camila','default.jpg','cover.png','None','United States','example.com'),
(152,'blackgoose850','darren.miles@example.com','aa377d8ad36ba94e585f5221acd590a5','Darren','default.jpg','cover.png','None','United States','example.com'),
(153,'bigsnake405','judd.lopez@example.com','cb5786412becb979c90f606f25ad4b4f','Judd','default.jpg','cover.png','None','United States','example.com'),
(154,'silverelephant226','jane.medina@example.com','570b7f149ef6e997cec98719a93abf92','Jane','default.jpg','cover.png','None','United States','example.com'),
(155,'whitebutterfly461','willie.herrera@example.com','63188b0436e754a4d9a1d89dfc978209','Willie','default.jpg','cover.png','None','United States','example.com'),
(156,'bluebird717','lance.watkins@example.com','8fb744b51a1f14e5e8cda4e4aec68e2f','Lance','default.jpg','cover.png','None','United States','example.com'),
(157,'smallgorilla569','tara.lawrence@example.com','d5256c0fdd004a33dca56a5da5c9ae7e','Tara','default.jpg','cover.png','None','United States','example.com'),
(158,'bluecat572','samuel.owens@example.com','bb0d62b4f0c05e6513f1feca8d6696c6','Samuel','default.jpg','cover.png','None','United States','example.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower_id` (`follower_id`),
  ADD KEY `following_id` (`following_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `likes_ibfk_2` (`post_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_ibfk_1` (`notify_for`),
  ADD KEY `notifications_ibfk_2` (`notify_from`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `retweets`
--
ALTER TABLE `retweets`
  ADD PRIMARY KEY (`post_id`) USING BTREE,
  ADD KEY `retweet_id` (`retweet_id`),
  ADD KEY `retweets_ibfk_2` (`tweet_id`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hashtag` (`hashtag`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notify_for`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`notify_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retweets`
--
ALTER TABLE `retweets`
  ADD CONSTRAINT `retweets_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retweets_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retweets_ibfk_3` FOREIGN KEY (`retweet_id`) REFERENCES `retweets` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
