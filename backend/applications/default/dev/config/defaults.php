<?php
$configuration['url'] = "http://{$configuration['domain']}";

$configuration['backend']['bin']         = "{$configuration['backend']['path']}/bin";
$configuration['backend']['config']      = "{$configuration['backend']['path']}/config";
$configuration['backend']['controllers'] = "{$configuration['backend']['path']}/controllers";
$configuration['backend']['fonts']       = "{$configuration['backend']['path']}/fonts";
$configuration['backend']['helpers']     = "{$configuration['backend']['path']}/helpers";
$configuration['backend']['libraries']   = "{$configuration['backend']['path']}/libraries";
$configuration['backend']['models']      = "{$configuration['backend']['path']}/models";
$configuration['backend']['var']         = "{$configuration['backend']['path']}/var";
$configuration['backend']['views']       = "{$configuration['backend']['path']}/views";

$configuration['var']['cache']       = "{$configuration['backend']['var']}/cache";
$configuration['var']['log']         = "{$configuration['backend']['var']}/log";
$configuration['var']['sessions']    = "{$configuration['backend']['var']}/sessions";
$configuration['var']['spool']       = "{$configuration['backend']['var']}/spool";
$configuration['var']['templates_c'] = "{$configuration['backend']['var']}/templates_c";
$configuration['var']['tmp']         = "{$configuration['backend']['var']}/tmp";

/*
If variable directories does not exist - create them:
*/
foreach ($configuration['var'] as $name => $path) {
  
  if (!is_dir($path)) {
    mkdir($path, 0777, TRUE);
  }
}


$configuration['frontend']['static']['path'] = "./f";
$configuration['frontend']['static']['url']  = "http://{$configuration['domain']}/f";
$configuration['smarty_path']              = "{$configuration['backend']['path']}/smarty/libs";
$configuration['smarty_configs_path']      = "{$configuration['backend']['path']}/configs";
$configuration['smarty_compile_path']      = $configuration['var']['templates_c'];
$configuration['smarty_cache']             = $configuration['var']['cache'];

/*

//php object stuff
$configuration['soap']           = "http://www.phpobjectgenerator.com/services/pog.wsdl";
$configuration['homepage']       = "http://www.phpobjectgenerator.com";
$configuration['revisionNumber'] = "";
$configuration['versionNumber']  = "3.0e";
$configuration['setup_password'] = '';
$configuration['plugins_path']   = "{$configuration['backend']['path']}/plugins";
//proxy settings - if you are behnd a proxy, change the settings below
$configuration['proxy_host']     = false;
$configuration['proxy_port']     = false;
$configuration['proxy_username'] = false;
$configuration['proxy_password'] = false;

$configuration['db_dsn'] = array(
  'phptype'  => 'mysqli',
  'username' => $configuration['user'],
  'password' => $configuration['pass'],
  'hostspec' => $configuration['host'],
  'database' => $configuration['db'],
);
$configuration['db_options'] = array(
  'debug' => '2',
  'portability' => 'DB_PORTABILITY_ALL',
);
//various
$configuration['photos_dimensions'] = array(
  array(
    "width"    => "75",
    "geometry" => "crop",
    "palette"  => "color",
  ),
  array(
    "width"    => "100",
    "geometry" => "standart",
    "palette"  => "color",
  ),
  array(
    "width"    => "150",
    "geometry" => "standart",
    "palette"  => "color",
  ),
  array(
    "width"    => "229",
    "geometry" => "crop",
    "palette"  => "color",
  ),
  array(
    "width"    => "240",
    "geometry" => "standart",
    "palette"  => "color",
  ),
  array(
    "width"    => "500",
    "geometry" => "standart",
    "palette"  => "color",
  ),
  array(
    "width"    => "1024",
    "geometry" => "standart",
    "palette"  => "color",
  ),
  array(
    "width"    => "original",
    "geometry" => "standart",
    "palette"  => "color",
  ),
);
$configuration['avatar_dimensions'] = array(
  array(
    "width"    => "13",
    "geometry" => "crop",
    "palette"  => "color",
  ),
  array(
    "width"    => "13",
    "geometry" => "crop",
    "palette"  => "grey",
  ),
  array(
    "width"    => "16",
    "geometry" => "crop",
    "palette"  => "color",
  ),
  array(
    "width"    => "16",
    "geometry" => "crop",
    "palette"  => "grey",
  ),
  array(
    "width"    => "32",
    "geometry" => "crop",
    "palette"  => "color",
  ),
  array(
    "width"    => "32",
    "geometry" => "crop",
    "palette"  => "grey",
  ),
  array(
    "width"    => "48",
    "geometry" => "crop",
    "palette"  => "color",
  ),
  array(
    "width"    => "48",
    "geometry" => "crop",
    "palette"  => "grey",
  ),
  array(
    "width"    => "100",
    "geometry" => "crop",
    "palette"  => "color",
  ),
  array(
    "width"    => "100",
    "geometry" => "crop",
    "palette"  => "grey",
  ),
);
$configuration['post_types'] = array(
  "Blog" => array(
    "Required" => array(
      "Text",
    ),
    "Layout" => array(
      "Text",
      "Title",
      "Tags",
      "Mood",
      "Music",
      "Privacy",
      "PrivacyComment",
      "ShowOnFirst",
      "MOTD",
    ),
  ),
  "Album" => array(
    "Layout" => array(
      "Title",
      "Tags",
      "Privacy",
      "PrivacyComment",
      "ShowOnFirst",
    ),
  ),
  "Wiki" => array(
    "Required" => array(
      "Text",
    ),
    "Layout" => array(
      "Title",
      "Tags",
      "Text",
    ),
  ),
);
$configuration['invisible_files'] = array(
  ".",
  "..",
  ".htaccess",
  ".htpasswd",
  ".svn",
);
$configuration['request_uri']  = dirname($_SERVER['REQUEST_URI'] . '/.');
$configuration['request_url']  = "http://{$_SERVER["SERVER_NAME"]}{$_SERVER['REQUEST_URI']}";
$configuration['daily_charge'] = "1";
//charge this sum daily
$configuration['currency']        = "US$";
$configuration['current_day']     = date('Ymd');
$configuration['doctype']         = "HTML 4.01 Transitional";
$configuration['max_image_width'] = "500";
//default quota in bytes and ammounts of originals:
$configuration['default_quota_bytes'] = "104857600";
//100Mb
$configuration['default_quota_originals'] = "5";
//100Mb
//maximum length of text ot show on first page
$configuration['cut_sign'] = '[cut]';
$configuration['max_first_page_text_length'] = 1500;
//liqpay
$configuration['liqpay_name']           = 'LiqPay.com';
$configuration['liqpay_order_id']       = time();
$configuration['liqpay_method']         = 'card';
$configuration['liqpay_order_currency'] = 'USD';
$configuration['liqpay_url_server']     = "{$configuration['url']}/processor/liqpay";
$configuration['liqpay_url_client']     = "{$configuration['url']}/profile/liqpay";
//session configuration
ini_set("max_execution_time", "86400");
//Maximum execution time of each script, in seconds
ini_set("memory_limit", "256M");
ini_set("session.name", "BONJOUR");
ini_set("session.use_cookies", 1);
ini_set("session.use_only_cookies", 1);
ini_set("session.cookie_httponly", 1);
ini_set("session.gc_maxlifetime", (3600 * 24 * 365));
//logged in time 1 year
ini_set("session.save_path", $configuration['sessions_path']);
ini_set("session.cookie_lifetime", (3600 * 24 * 365));
//logged in time 1 year
ini_set("session.cache_expire", (3600 * 24 * 365));
//logged in time 1 year
ini_set("session.cookie_domain", ".{$configuration['domain']}");
ini_set("error_log", "{$configuration['backend']['path']}/logs/error.log");
ini_set("log_errors", 1);
//require php classes
require_once("{$configuration['backend']['path']}/objects/DB/DB.php");
require_once("{$configuration['backend']['path']}/objects/class.database.php");
require_once("{$configuration['backend']['path']}/objects/class.pog_base.php");
require_once("{$configuration['backend']['path']}/objects/class.language.php");
require_once("{$configuration['backend']['path']}/objects/class.template.php");
require_once("{$configuration['backend']['path']}/objects/class.user.php");
require_once("{$configuration['backend']['path']}/objects/class.transaction.php");
require_once("{$configuration['backend']['path']}/objects/class.post.php");
require_once("{$configuration['backend']['path']}/objects/class.image.php");
require_once("{$configuration['backend']['path']}/objects/class.group.php");
require_once("{$configuration['backend']['path']}/objects/class.message.php");
require_once("{$configuration['backend']['path']}/objects/class.product.php");

/*
pear channel-discover htmlpurifier.org
pear install hp/HTMLPurifier
*/

/*
require_once 'HTMLPurifier.auto.php';
//
$configuration['HTMLPurifier_Config'] = HTMLPurifier_Config::createDefault();
$configuration['HTMLPurifier_Config']->set('HTML.Doctype', $configuration['doctype']);
$configuration['HTMLPurifier_Config']->set('HTML.MaxImgLength', $configuration['max_image_width']);
$configuration['HTMLPurifier_Config']->set('CSS.MaxImgLength', "{$configuration['max_image_width']}px");
//add automatic href
$configuration['HTMLPurifier_Config']->set('AutoFormat.Linkify', 'true');
$configuration['HTMLPurifier_Config']->set('Filter.YouTube', 'true');


require_once("{$configuration['backend']['path']}/objects/class.captcha.php");
require_once("/usr/share/php/Mail.php");
//pear install Mail
// smarty configuration
require_once("{$configuration['smarty_path']}/Smarty.class.php");
global $smarty;
$smarty                  = new Smarty();
$smarty->template_dir    = "{$configuration['smarty_template_path']}";
$smarty->compile_dir     = "{$configuration['smarty_compile_path']}";
$smarty->config_dir      = "{$configuration['smarty_configs_path']}";
$smarty->cache_dir       = "{$configuration['smarty_cache']}";
$smarty->left_delimiter  = '[[';
$smarty->right_delimiter = ']]';
//if ($_GET['sid']=='5') {
//session_id('28e1c0241e64bc5fa2c81bd2b4b64bd7');
//}
//start session
session_start();

/*
Referer
*/
/*
if (isset($_SESSION['REQUEST_URI'])) {
  $configuration['referer_uri'] = $_SESSION['REQUEST_URI'];
  $_SESSION['REFERER_URI']      = $_SESSION['REQUEST_URI'];
  $configuration['referer_url'] = $configuration['url'] . $_SESSION['REFERER_URI'];
}

$Request = pathinfo($_SERVER['REQUEST_URI']);
if (!isset($Request['extension'])) {
  $_SESSION['REQUEST_URI'] = $_SERVER['REQUEST_URI'];
}

//negotiate language
$langs = array(
  'Русский' => 'ru',
);
if (!isset($_SESSION['LANG']) or $_SESSION['LANG'] == "") {
  $LANG = (http_negotiate_language($langs, $result));
  $_SESSION['LANG'] = $LANG;
  //pecl install pecl_http
} else {
  $LANG = $_SESSION['LANG'];
}
//Languages other than English
if ($LANG == 'en') {
  require_once("{$configuration['includes_path']}/LANG/{$LANG}.php");
} else {
  $Language     = new Language();
  $LanguageData = $Language->GetSingle(array(array("Code", "=", $LANG), array("Domain", "=", $configuration['domain'])), "Revision", false);
  $dic          = unserialize(base64_decode($LanguageData->Dictionary));
  $dic_revision = $LanguageData->Revision;
  if (($dic == "") and (isset($LANG))) {
    if (file_exists("{$configuration['includes_path']}/LANG/{$LANG}.php")) {
      require_once("{$configuration['includes_path']}/LANG/{$LANG}.php");
    } else {
      require_once("{$configuration['includes_path']}/LANG/en.php");
    }
    global $dic;
    //make dic global
  }
}
//Lowercase language (eg: en)
$LOWLANG = strtolower($LANG);
//Uppercase language (eg: EN)
$UPLANG = strtoupper($LANG);
//set locale (sudo dpkg-reconfigure locales) and select ALL.
setlocale(LC_ALL, "{$LOWLANG}_{$UPLANG}.UTF8");

//assign dic to smarty
$smarty->assign('dic', $dic);
//assign LANG to smarty
$smarty->assign('LANG', $LANG);
//require functions
require_once("{$configuration['includes_path']}/functions.php");
require_once("{$configuration['includes_path']}/temp.php");
//various smarty
$smarty->assign('currency', $configuration['currency']);
$smarty->assign('DailyCharge', $configuration['daily_charge']);
$smarty->assign('Domain', $configuration['domain']);
$smarty->assign('RequestUri', $configuration['request_uri']);
$smarty->assign('PhotosUrl', $configuration['photos_url']);
$smarty->assign('AlbumsUrl', $configuration['albums_url']);
$smarty->assign('ImageUploadUrl', $configuration['image_upload_url']);
$smarty->assign('PagerUrl', $configuration['page_area']);
$smarty->assign('MaxFirstPageTextLength', $configuration['max_first_page_text_length']);
//avatars
$configuration['default_avatar_url']       = "http://{$configuration['domain']}/i/noman.jpg";
$configuration['default_icon_online_url']  = "http://{$configuration['domain']}/i/online.gif";
$configuration['default_icon_offline_url'] = "http://{$configuration['domain']}/i/offline.gif";
$configuration['default_sms_online_url']   = "http://{$configuration['domain']}/i/sms-green.gif";
$configuration['default_sms_offline_url']  = "http://{$configuration['domain']}/i/sms-yellow.gif";
//avatars to smarty
$smarty->assign('default_avatar_url', $configuration['default_avatar_url']);
$smarty->assign('default_icon_online_url', $configuration['default_icon_online_url']);
$smarty->assign('default_icon_offline_url', $configuration['default_icon_offline_url']);
$smarty->assign('default_sms_online_url', $configuration['default_sms_online_url']);
$smarty->assign('default_sms_offline_url', $configuration['default_sms_offline_url']);
//$smarty->assign('',$configuration['']);
//JSON configuration of selects:
$configuration['PrivacyTypes'] = array(
  "All"               => $dic['All'],
  "Female"            => $dic['Female'],
  "Male"              => $dic['Male'],
  "Users"             => $dic['Users'],
  "UsersOfSameDomain" => $configuration['domain'],
  "Group"             => $dic['Group'],
  "Nobody"            => $dic['Nobody'],
);
$smarty->assign('JSONPrivacyTypes', json_encode($configuration['PrivacyTypes']));

$configuration['PrivacyCommentTypes'] = array(
  "All"               => $dic['All'],
  "Female"            => $dic['Female'],
  "Male"              => $dic['Male'],
  "Users"             => $dic['Users'],
  "UsersOfSameDomain" => $configuration['domain'],
  "Group"             => $dic['Group'],
  "Nobody"            => $dic['Nobody'],
);
$smarty->assign('JSONPrivacyCommentTypes', json_encode($configuration['PrivacyCommentTypes']));

$configuration['YesNo'] = array(
  "Yes" => $dic['Yes'],
  "No" => $dic['No'],
);
$smarty->assign('JSONYesNo', json_encode($configuration['YesNo']));
*/
?>
