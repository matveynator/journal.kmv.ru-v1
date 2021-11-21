<?php
/*
Environment:
*/
$configuration['application_name']               = 'uranruda';
$configuration['domain']                         = implode('.', array_slice(explode('.', $_SERVER['SERVER_NAME']), - 2));
$configuration['sys_var']                        = "../backend/applications/{$configuration['application_name']}/var";
$configuration['backend']['sys_var']['sessions'] = "{$configuration['sys_var']}/sessions";
$configuration['backend']['sys_var']['log']      = "{$configuration['sys_var']}/log";

//echo "<pre>";
//print_r($configuration['backend']['sys_var']);
//die;
//session configuration
//session configuration
//we use redis as session handler
//ini_set("session.save_path", $configuration['backend']['sys_var']['sessions']);
ini_set("session.save_handler", "redis");
ini_set("session.save_path", "localhost");
ini_set("max_execution_time", "86400");
ini_set("memory_limit", "12800M");
ini_set("session.name", "BONJOUR");
ini_set("session.use_cookies", 1);
ini_set("session.use_only_cookies", 0);
ini_set("session.cookie_httponly", 0);
ini_set("session.gc_maxlifetime", (3600 * 24 * 31));
ini_set("session.cookie_lifetime", (3600 * 24 * 31));
ini_set("session.cache_expire", (3600 * 24 * 31));
ini_set("session.cookie_domain", ".{$configuration['domain']}");
ini_set("error_log", "{$configuration['backend']['sys_var']['log']}/error.log");
ini_set("log_errors", 1);
ini_set("date.timezone", "Europe/Moscow");
ini_set("upload_max_filesize", "128M");
ini_set("upload_tmp_dir", "/tmp");

/*
If variable directories does not exist - create them:
*/
foreach ($configuration['backend']['sys_var'] as $name => $path) {
  
  if (!is_dir($path)) {
    mkdir($path, 0777, TRUE);
  }
}

/*
Start session:
*/
session_start();

/*
Host related configuration: please edit this file:
../backend/applications/>>APPLICATION NAME<</config.php
*/
require_once("../backend/applications/{$configuration['application_name']}/config.php");

/*
If no environment found - print an error "Updating site";
*/
if ((!is_dir($configuration['backend']['path'])) or (!is_file("{$configuration['backend']['path']}/config/defaults.php"))) {
  echo "
<html>
 <head>
 <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
 <meta http-equiv='refresh' content='15'>
 <title>{$configuration['domain']}: maintainance</title>
 </head>
 <body>
        <h1>Мы обновляем сайт {$configuration['domain']}</h1>
	Мы вернемся через одну минуту. <a href=''>Обновите страницу вручную</a> или подождите немного и все наладится само собой.
        
 </body>
	";
  exit();
}

/*
Load default configuration variables:
*/
require_once("{$configuration['backend']['path']}/config/defaults.php");

/*
Take the username from url:
*/
if ((count(explode('.', $_SERVER['SERVER_NAME']))) > 2) {
  $user_name = implode(array_slice(explode('.', $_SERVER['SERVER_NAME']), - 3, 1, TRUE));
  if (isset($user_name) and ($user_name != "") and ($user_name != $configuration['domain'])) {
    $configuration['user_name'] = $user_name;
  }
}

/*
Pre start operations go here:
*/
require_once("{$configuration['backend']['libraries']}/includes/manual/pre-start.php");

/*
Parse $_SERVER['REQUEST_URI'] string.
and set http://domain.com/>>$url_path[1]<</>>$url_path[2]<</>>$url_path[3]<</ etc...
*/
$url = parse_url($_SERVER['REQUEST_URI']);
$url_path = explode("/", "$url[path]");

/*
Security:
*/
if ((isset($_SESSION['Human'])) and ($_SESSION['Human'] != TRUE)) {
  if (($url_path[1] != 'login') and ($url_path[1] != 'captcha') and ($url_path[1] != 'captcha.png')) {
    CAPTCHA();
  } elseif ($url_path[1] == 'login') {
    Jump("http://".$configuration['domain']);
  }
}
/*
If user exist - show his domain, if not - jump to main domain index.
*/
if (isset($configuration['user_name']) and ($configuration['user_name'] != "")) {
  $Author = UserQuery::create()->filterByNickName($configuration['user_name'])->filterByStatus('Active')->filterByDomain($configuration['domain'])->findOne();
  if (!isset($Author)) {
    Jump("http://".$configuration['domain']);
  }
}
/*
Select appropriate controller.
*/
if (file_exists("{$configuration['backend']['controllers']}/{$url_path[1]}.php")) {
  $smarty->Assign('Controller', $url_path[1]);
  require_once("{$configuration['backend']['controllers']}/{$url_path[1]}.php");
} else {
  $smarty->Assign('Controller', '404');
  require_once("{$configuration['backend']['controllers']}/404.php");
}
exit();
?>
