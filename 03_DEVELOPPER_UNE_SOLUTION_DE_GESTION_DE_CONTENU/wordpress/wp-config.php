<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'root' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', '' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost:3308' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'v%ig&6J9Z7(#M882KpLq$P[s_Trk [5Y*}7g#`e> ~6d*Y`&z^,y&O2UiE2Ct}-R' );
define( 'SECURE_AUTH_KEY',  'p$C*yYfrQ!qtm^t6sy`sTc`e*!zsL?*}I 9?K.>~Qo#<X8~foH]d.iB^U);Y6SMY' );
define( 'LOGGED_IN_KEY',    'oT@(7G$!y[,brwkwrp+by]eW:Q~wvKY^c8Dt2MoCNr(k|F{_nC6Nb%~#r4jj:;go' );
define( 'NONCE_KEY',        '`N6P?@&[{LOWeRzUp3:)G[9sf*p>DC!8z4Gx{e`hc4Te2W1K7Zw8yTvh3`5G7NRi' );
define( 'AUTH_SALT',        'fDB?vmHo/S0P.yr6ls7l` L%#EYoUu*g<EFp<^!R*:IHN.(yGyaq&S-^IYk!|pOE' );
define( 'SECURE_AUTH_SALT', '*ubU38EtoxJeVXT{`Q0wye?{_C+K@$4o@LK6i=e:!Y:t2O&vwsY|KPEP|JcBl 6q' );
define( 'LOGGED_IN_SALT',   '}IA?K1`j?;=J[[K${jcj%mN[0_+S3O2QzC%UZxOl;* +Vk as]X//k*ynaWWIE9!' );
define( 'NONCE_SALT',       'M1sZ0&YTQv z]6lmIIKL5KWKya= w<YCA[DrPD{&>yu:tG ;&:U7niOqz-Gb{JD3' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
