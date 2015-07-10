<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** Heroku Postgres settings - from Heroku Environment ** //
/** Local config in a mac set an environment variable in the MAMP apache config
    /Applications/MAMP/conf/apache/httpd.conf
    <VirtualHost *:8888>
        SetEnv DATABASE_URL 'postgres://user:pass@localhost:5432/dbname'
        ErrorLog /Applications/MAMP/logs/eell_error.log
    </VirtualHost> 
    Then try to read ENV var first and if we miss read from SERVER
    if (isset($_ENV["DATABASE_URL"]))
        $db = parse_url($_ENV["DATABASE_URL"]);
    else
        $db = parse_url($_SERVER["DATABASE_URL"]);

    Then parse as usual in production
*/
if (isset($_ENV["DATABASE_URL"]))
  $db = parse_url($_ENV["DATABASE_URL"]);
else
  $db = parse_url($_SERVER["DATABASE_URL"]);

/** The name of the database for WordPress */
define('DB_NAME', trim($db["path"],"/"));

/** MySQL database username */
define('DB_USER', $db["user"]);

/** MySQL database password */
define('DB_PASSWORD', $db["pass"]);

/** MySQL hostname */
define('DB_HOST', $db["host"]);

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'KJx{5 M$nCDR&K4h$kbFa-{YB.gAog2#%JFA+^OU6u,wiVqTv*&V5OU$0mwq-2=c');
define('SECURE_AUTH_KEY',  'nQ0x/> BF~9eizSORxAD<MJCBSVGjn..ODb^c<k/w,vSv@PL^|019Xcp(v];h9@C');
define('LOGGED_IN_KEY',    'Sx#d5sf_h0c{3+A@.-u$Ccd$.sh|(fNl>BbYM+`)+%kl:9NYrnPis7On8ta,j_|5');
define('NONCE_KEY',        '|X/gAeg9k4%GLBqq5<GtYV`s|cIiT8(@Q/}}-|3AT%DP^``mV[@^35^u7ge?D:n?');
define('AUTH_SALT',        'GC9T=- e@{}L,d}h|6dXXZ|}tn*@16AZ3HX2B/r6d_u#e|h,HWq(;.x=e/r.LS+I');
define('SECURE_AUTH_SALT', 'y%_KIL0NS3%9@g{_5+08h}FEQ$ l@6&d|9z4:|%%#,,3lsfR|}i=DY>gIo)O~hVD');
define('LOGGED_IN_SALT',   'aO+!|}c,l>nBc;g>w~ #,V5`RWBV8SqsT8Ce)2:1o5TY~q9b0|xKGB4;vg5GprsV');
define('NONCE_SALT',       'diyQ&|y-Xs>/f^guJQ{T9T|H-#eNGrKyz0+_[41yk3u>m#gv?8+=OP5%:_SF3c4O');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
