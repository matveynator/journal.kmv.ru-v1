<?php
/*
Defaults for all environments:
*/
$configuration['application'] = "default";
$configuration['environments'] = array(
  'dev',
  'staging',
  'production',
);
if ((!isset($_SESSION['environment'])) or (!in_array($_SESSION['environment'], $configuration['environments']))) {
  $_SESSION['environment'] = 'production';
}
$configuration['backend']['path'] = "../backend/applications/{$configuration['application']}/{$_SESSION['environment']}";

/*
Environment-related configs:
*/
if ($_SESSION['environment'] == 'dev') {
  $configuration['domain']                  = "brain.dev";
  $configuration['db']['name']              = 'brain_dev';
  $configuration['db']['host']              = 'localhost';
  $configuration['db']['user']              = 'brain';
  $configuration['db']['pass']              = 'CHANGEMEPASS';
  $configuration['db']['port']              = '3306';
  $configuration['debug']['display']        = TRUE;
  $configuration['debug']['logfile']        = TRUE;
  $configuration['development']['wiki']     = TRUE;
  $configuration['development']['bugs']     = TRUE;
  $configuration['development']['features'] = TRUE;
} elseif ($_SESSION['environment'] == "staging") {
  $configuration['domain']                  = "brain.staging";
  $configuration['db']['name']              = 'brain_staging';
  $configuration['db']['host']              = 'localhost';
  $configuration['db']['user']              = 'brain';
  $configuration['db']['pass']              = 'CHANGEMEPASS';
  $configuration['db']['port']              = '3306';
  $configuration['debug']['display']        = FALSE;
  $configuration['debug']['logfile']        = TRUE;
  $configuration['development']['wiki']     = FALSE;
  $configuration['development']['bugs']     = TRUE;
  $configuration['development']['features'] = TRUE;
} elseif ($_SESSION['environment'] == "production") {
  $configuration['domain']                  = "brain.production";
  $configuration['db']['name']              = 'brain_production';
  $configuration['db']['host']              = 'localhost';
  $configuration['db']['user']              = 'brain';
  $configuration['db']['pass']              = 'CHANGEMEPASS';
  $configuration['db']['port']              = '3306';
  $configuration['debug']['display']        = FALSE;
  $configuration['debug']['logfile']        = TRUE;
  $configuration['development']['wiki']     = FALSE;
  $configuration['development']['bugs']     = FALSE;
  $configuration['development']['features'] = FALSE;
}
?>
