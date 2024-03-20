
SET character_set_client = utf8;

CREATE USER IF NOT EXISTS 'journal'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'journal'@'localhost';
FLUSH PRIVILEGES;


CREATE DATABASE IF NOT EXISTS `journal`;
USE `journal`;


DROP TABLE IF EXISTS `bannedlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannedlist` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '1',
  `data` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_data` (`type`,`data`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `id_enemy` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `f_uid` int(4) NOT NULL DEFAULT '0',
  `t_uid` int(4) NOT NULL DEFAULT '0',
  `f_name` char(25) NOT NULL DEFAULT '',
  `t_name` char(25) NOT NULL DEFAULT '',
  `permit` tinyint(2) NOT NULL DEFAULT '0',
  KEY `id_enemy` (`id_enemy`)
) ENGINE=MyISAM AUTO_INCREMENT=2062 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id_comment` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `id_old` bigint(20) NOT NULL DEFAULT '0',
  `eid` int(4) NOT NULL DEFAULT '0',
  `uid` int(4) NOT NULL DEFAULT '0',
  `uid_name` varchar(25) NOT NULL DEFAULT '',
  `time` bigint(20) DEFAULT NULL,
  `entry` text NOT NULL,
  `onlyauthor` tinyint(4) NOT NULL DEFAULT '0',
  `ip` tinytext NOT NULL,
  `avatar` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_comment`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=1976307 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` char(32) NOT NULL DEFAULT '',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `text_background_day` char(11) NOT NULL DEFAULT '',
  `text_color_day` char(11) NOT NULL DEFAULT '',
  `links_color_day` char(11) NOT NULL DEFAULT '',
  `body_background_day` char(11) NOT NULL DEFAULT '',
  `text_background_night` char(11) NOT NULL DEFAULT '',
  `text_color_night` char(11) NOT NULL DEFAULT '',
  `links_color_night` char(11) NOT NULL DEFAULT '',
  `body_background_night` char(11) NOT NULL DEFAULT '',
  `font_size` int(11) NOT NULL DEFAULT '0',
  `links_menu` text NOT NULL,
  `page_footer_text` text NOT NULL,
  `terms_text` text NOT NULL,
  `help_terms` text NOT NULL,
  `help_login` text NOT NULL,
  `tag_cloud_max_tags` int(11) NOT NULL DEFAULT '75',
  `tag_cloud_max_font_size` int(11) NOT NULL DEFAULT '24',
  `tag_cloud_min_font_size` int(11) NOT NULL DEFAULT '9',
  `users_cloud_max_users` int(11) NOT NULL DEFAULT '750',
  `users_cloud_max_font_size` int(11) NOT NULL DEFAULT '24',
  `users_cloud_min_font_size` int(11) NOT NULL DEFAULT '9',
  `firstpage_limit_seconds` int(11) NOT NULL DEFAULT '31536000',
  `user_respect_time` int(11) NOT NULL DEFAULT '31536000',
  `domain_main_title` text NOT NULL,
  `page_headers_day` text NOT NULL,
  `page_headers_night` text NOT NULL,
  `page_footer_ads` text NOT NULL,
  `domain_description` text NOT NULL,
  `domain_style` text NOT NULL,
  `domain_day_style` text NOT NULL,
  `domain_night_style` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains_aliases`
--

DROP TABLE IF EXISTS `domains_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains_aliases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` char(32) NOT NULL DEFAULT '',
  `alias` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drop_ids`
--

DROP TABLE IF EXISTS `drop_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drop_ids` (
  `id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id_entry` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `id_old` bigint(20) NOT NULL DEFAULT '0',
  `uid` int(4) NOT NULL DEFAULT '0',
  `uid_name` varchar(25) NOT NULL DEFAULT '',
  `time` bigint(20) DEFAULT NULL,
  `title` text NOT NULL,
  `entry` text NOT NULL,
  `privacy_read` tinyint(4) NOT NULL DEFAULT '0',
  `privacy_comment` tinyint(4) NOT NULL DEFAULT '0',
  `mood` tinytext NOT NULL,
  `music` tinytext NOT NULL,
  `showonfirst` tinyint(4) NOT NULL DEFAULT '1',
  `lastcomment` int(11) DEFAULT '0',
  `keepontop` tinyint(4) NOT NULL DEFAULT '0',
  `avatar` tinyint(4) NOT NULL DEFAULT '1',
  `numcomments` int(11) NOT NULL DEFAULT '0',
  `bayan` tinyint(4) NOT NULL DEFAULT '0',
  `notifybyemail` tinyint(4) NOT NULL DEFAULT '1',
  `domain` char(32) NOT NULL DEFAULT '',
  `imported` tinyint(4) NOT NULL DEFAULT '0',
  `import_source` char(32) NOT NULL DEFAULT '',
  `import_url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_entry`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `keepontop` (`keepontop`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=643835 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favelist`
--

DROP TABLE IF EXISTS `favelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favelist` (
  `id_fave` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `own_uid` int(4) NOT NULL DEFAULT '0',
  `f_euid` int(4) NOT NULL DEFAULT '0',
  KEY `id_fave` (`id_fave`)
) ENGINE=MyISAM AUTO_INCREMENT=4347 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `title` char(64) NOT NULL DEFAULT '',
  `category` char(128) NOT NULL DEFAULT '',
  `file` char(32) NOT NULL DEFAULT '',
  `hash` char(32) NOT NULL DEFAULT '',
  `mime` char(32) NOT NULL DEFAULT '',
  `size` bigint(20) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `width` bigint(20) NOT NULL DEFAULT '0',
  `height` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `utcp` (`user_id`,`title`,`category`,`parent_id`),
  KEY `title` (`title`),
  KEY `file` (`file`)
) ENGINE=MyISAM AUTO_INCREMENT=91997 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id_friend` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `fromuser` int(4) NOT NULL DEFAULT '0',
  `touser` int(4) NOT NULL DEFAULT '0',
  `fromuser_name` char(25) NOT NULL DEFAULT '',
  `touser_name` char(25) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_friend`),
  KEY `fromto` (`fromuser`,`touser`),
  KEY `fromuser` (`fromuser`),
  KEY `touser` (`touser`),
  KEY `status` (`status`),
  KEY `fromuser_2` (`fromuser`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=133854 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `import`
--

DROP TABLE IF EXISTS `import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `user` char(32) NOT NULL DEFAULT '',
  `pass` char(32) NOT NULL DEFAULT '',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` char(32) NOT NULL DEFAULT '',
  `error` char(32) NOT NULL DEFAULT '',
  `cookie` char(255) NOT NULL DEFAULT '',
  `source` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `import_pages`
--

DROP TABLE IF EXISTS `import_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` char(255) NOT NULL DEFAULT '',
  `url_hash` char(32) NOT NULL DEFAULT '',
  `import_id` bigint(20) NOT NULL DEFAULT '0',
  `status` char(32) NOT NULL DEFAULT '',
  `error` char(32) NOT NULL DEFAULT '',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` char(32) NOT NULL DEFAULT '',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `entry_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=MyISAM AUTO_INCREMENT=43362 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `smsid` text NOT NULL,
  `num` text NOT NULL,
  `operator` text NOT NULL,
  `user_id` text NOT NULL,
  `cost` text NOT NULL,
  `msg` text NOT NULL,
  `acr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms` (
  `id_sms` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `fromuser` int(4) NOT NULL DEFAULT '0',
  `touser` int(4) NOT NULL DEFAULT '0',
  `fromuser_name` varchar(25) NOT NULL DEFAULT '',
  `touser_name` varchar(25) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `readed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_sms`),
  KEY `fromuser` (`fromuser`),
  KEY `touser` (`touser`),
  KEY `fromto` (`fromuser`,`touser`),
  KEY `touser_2` (`touser`,`readed`),
  KEY `fromuser_name` (`fromuser_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12106570 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag` char(32) NOT NULL DEFAULT '',
  `entry_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id_tag` (`entry_id`,`tag`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=87619 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useronline`
--

DROP TABLE IF EXISTS `useronline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useronline` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_online` int(11) NOT NULL DEFAULT '0',
  `online_name` char(25) NOT NULL DEFAULT '',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` char(18) NOT NULL DEFAULT '',
  `url` char(64) NOT NULL DEFAULT '',
  `showonline` tinyint(4) NOT NULL DEFAULT '1',
  `domain` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_online_2` (`id_online`,`ip`),
  KEY `id_online` (`id_online`),
  KEY `ip` (`ip`),
  KEY `domain` (`domain`),
  KEY `showonline` (`showonline`)
) ENGINE=MyISAM AUTO_INCREMENT=13894359 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `id_old` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(25) NOT NULL DEFAULT '',
  `password` varchar(25) NOT NULL DEFAULT '',
  `realname` tinytext,
  `email` tinytext,
  `location` tinytext,
  `gender` tinytext NOT NULL,
  `birthdate` date NOT NULL DEFAULT '0000-00-00',
  `www` tinytext,
  `wwwname` tinytext,
  `aim` tinytext,
  `icq` tinytext,
  `yim` tinytext,
  `msn` tinytext,
  `about` text NOT NULL,
  `interests` text NOT NULL,
  `sec_location` tinyint(4) DEFAULT '1',
  `sec_gender` tinyint(4) DEFAULT '1',
  `sec_email` tinyint(4) DEFAULT '1',
  `sec_age` tinyint(4) DEFAULT '1',
  `sec_name` tinyint(4) DEFAULT '1',
  `color1` char(11) NOT NULL DEFAULT '',
  `color2` char(11) NOT NULL DEFAULT '',
  `color3` char(11) NOT NULL DEFAULT '',
  `color4` char(11) NOT NULL DEFAULT '',
  `fontsize` tinyint(4) NOT NULL DEFAULT '3',
  `links` tinytext,
  `timeoffset` tinytext NOT NULL,
  `avatarwidth` tinyint(4) NOT NULL DEFAULT '5',
  `showfirst` tinyint(4) NOT NULL DEFAULT '1',
  `showonline` tinyint(4) NOT NULL DEFAULT '1',
  `showfriends` tinyint(4) NOT NULL DEFAULT '1',
  `myonline` tinyint(4) NOT NULL DEFAULT '1',
  `showgraphics` tinyint(4) NOT NULL DEFAULT '1',
  `pic_photo` varchar(30) NOT NULL DEFAULT '',
  `pic_photo_id` bigint(20) NOT NULL DEFAULT '0',
  `pic_smallphoto` varchar(30) NOT NULL DEFAULT '',
  `pic_smallphoto_id` bigint(20) NOT NULL DEFAULT '0',
  `pic_logo` varchar(30) NOT NULL DEFAULT '',
  `pic_logo_id` bigint(20) NOT NULL DEFAULT '0',
  `pic_back` varchar(30) NOT NULL DEFAULT '',
  `pic_back_id` bigint(20) NOT NULL DEFAULT '0',
  `lastvisit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `domain` char(32) NOT NULL DEFAULT '',
  `session_id` char(32) NOT NULL DEFAULT '',
  `enablewatermark` tinyint(4) DEFAULT '1',
  `rights` tinyint(4) NOT NULL DEFAULT '0',
  `lang` text NOT NULL,
  `migrated` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username_2` (`username`,`domain`),
  KEY `username` (`username`),
  KEY `up` (`username`,`password`),
  KEY `lastvisit` (`lastvisit`),
  KEY `created` (`created`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=51000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 14:25:52
