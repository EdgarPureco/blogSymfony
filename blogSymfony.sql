-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 31 mars 2022 à 13:34
-- Version du serveur :  5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blogSymfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `user_id`, `category_id`, `title`, `text`, `created`) VALUES
(10, 4, 1, 'Nouvelle saison Halo Infinite', 'La saison 2 de Halo Infinite devrait être lancée le 2 mai 2022, marquant l’arrivée d’une nouvelle campagne et d’un nouveau contenu multijoueur. Alors que le développeur de Halo Infinite, 343 Industries, ne s’est engagé qu’à une fenêtre de lancement lâche « mai 2022 » pour la saison 2, le Battle Pass existant fournit une date de lancement plus ferme. Le Battle Pass, Heroes of Reach, affiche un compte à rebours jusqu’à la fin de la saison 1, doublant également la date de lancement prévue de la saison 2.\r\n\r\nAvec les mises à jour de Halo Infinite traditionnellement déployées à 10 h PT / 13 h HE, la saison 2 devrait suivre le même calendrier, en supposant un lancement le 2 mai.\r\n\r\n343 Industries avait précédemment annoncé une approche saisonnière du contenu post-lancement, avec un écart de trois mois entre ces versions importantes. Et alors que la saison 2 devait autrefois être lancée début février 2022, le studio a annoncé plus tard un report de trois mois jusqu’en mai.', '2022-03-28 00:00:00'),
(11, 6, 3, 'Le Warden est là grace à la Snapshot 22w12a', 'Depuis le 24 mars dernier, une nouvelle Snapshot est disponible dans Minecraft et il s\'agit de la Snapshot 22w12a. Celle-ci permet l\'ajout de nouveautés avec principalement l\'introduction du Warden, mais aussi les hurleurs Sculk, ainsi qu\'un nouvel enchantement et les bateaux-coffre.', '2022-03-27 00:00:00'),
(12, 4, 2, 'Evil Dead The Game va lancer une bêta fermée sur Xbox', 'Evil Dead The Game, le prochain jeu tiré de la licence phare de Sam Raimi arrive bientôt sur nos consoles, dans un format PVP avec Bruce Campbell qui donnera de la voix pour reprendre son rôle de Ash, héros emblématique de la trilogie de films et de la série Ash vs Evil Dead. La sortie du jeu est toujours prévue pour le 13 mai 2022.\r\n\r\nBonne nouvelle pour ceux qui attendent le titre, puisqu’on apprend que les membres Insider Xbox auront accès à une bêta fermée du jeu qui débutera ce vendredi 25 mars à 19h00 et pour toute la durée du week-end. On rappelle que tout le monde peut devenir membre Insiders. Pour participer il suffit de télécharger l’appli Xbox Insider HUB sur votre Xbox, de se rendre dans l’onglet « Aperçu disponible » et d’y trouver le jeu « Evil Dead The Game – BETA ».', '2022-03-30 11:20:03');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `type`) VALUES
(1, 'Shooters', 'Jeux'),
(2, 'Horror', 'Jeux'),
(3, 'Survival', 'Jeux'),
(4, 'Goodies', 'Produit'),
(5, 'Test', 'Article'),
(6, 'Video', 'Article');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `user_id`, `parent_id`, `contenu`, `created_at`, `article_id`) VALUES
(1, 6, NULL, 'test commentaire', '2022-03-31 09:39:22', 12),
(2, 4, NULL, 'test comment', '2022-03-31 09:39:22', 12),
(3, 6, NULL, '<p>Nouveau commentaire</p>', '2022-03-31 13:01:17', 10),
(4, 6, NULL, '<p>Super article wow</p>', '2022-03-31 13:03:58', 10),
(5, 6, NULL, '<p>Super article wow</p>', '2022-03-31 13:04:03', 10),
(6, 6, NULL, '<p>yuyu</p>', '2022-03-31 13:04:38', 10),
(7, 6, NULL, '<p>gjgg</p>', '2022-03-31 13:06:21', 10),
(8, 6, NULL, '<p>gjgg</p>', '2022-03-31 13:06:31', 10),
(9, 6, NULL, '<p>gjgg</p>', '2022-03-31 13:06:32', 10),
(10, 6, NULL, '<p>gjgg</p>', '2022-03-31 13:06:32', 10),
(11, 6, NULL, '<p>gjgg</p>', '2022-03-31 13:07:55', 10),
(12, 6, NULL, '<p>dgdg</p>', '2022-03-31 13:16:18', 10),
(13, 6, NULL, '<p>dgdg</p>', '2022-03-31 13:16:20', 10),
(14, 6, NULL, '<p>dgdg</p>', '2022-03-31 13:16:38', 10),
(15, 6, NULL, '<p>test</p>', '2022-03-31 13:17:00', 10),
(16, 6, NULL, '<p>ggd</p>', '2022-03-31 13:20:49', 10),
(17, 6, NULL, '<p>ggd</p>', '2022-03-31 13:21:04', 10),
(18, 6, NULL, '<p>yty</p>', '2022-03-31 13:24:28', 10),
(19, 6, NULL, '<p>yty</p>', '2022-03-31 13:24:30', 10),
(20, 6, NULL, '<p>yty</p>', '2022-03-31 13:24:31', 10),
(21, 6, NULL, '<p>yty</p>', '2022-03-31 13:24:33', 10),
(22, 6, NULL, '<p>ryr</p>', '2022-03-31 13:25:03', 10),
(23, 6, NULL, '<p>New comment</p>', '2022-03-31 13:28:22', 10),
(24, 6, NULL, '<p>come</p>', '2022-03-31 13:30:15', 10),
(25, 6, NULL, '<p>h</p>', '2022-03-31 13:31:07', 10),
(26, 6, NULL, '<p>j,hh</p>', '2022-03-31 13:31:32', 10);

-- --------------------------------------------------------

--
-- Structure de la table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` date NOT NULL,
  `developer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `synopsis` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `video` longtext COLLATE utf8mb4_unicode_ci,
  `plateforme_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `games`
--

INSERT INTO `games` (`id`, `title`, `year`, `developer`, `synopsis`, `photo`, `genre_id`, `video`, `plateforme_id`) VALUES
(1, 'Evil Dead : The Game', '2022-05-13', '', 'Inspiré de la franchise emblématique Evil Dead, Evil Dead : The Game est un jeu d\'horreur qui se joue en multijoueur (coop ou JcJ). Vous pouvez y incarner Ash Williams ou l\'un des ses acolytes pour former des équipes de quatre survivants. Votre but ? Trouver de quoi sceller la faille entre les mondes sans vous faire rattraper par vos plus grandes peurs.', 'https://image.jeuxvideo.com/medias-sm/164062/1640616462-1614-jaquette-avant.gif', 3, 'https://www.youtube.com/embed/37j_Lu_9iNs', 6),
(2, 'Battlefield 2042', '2021-11-19', 'Dice  Electronic Arts', 'Battlefield 2042 est un jeu de tir à la première personne multijoueur ancré dans un futur dystopique. Deux nations mènent une guerre totale, les Etats-Unis et la Russie. Trois modes de jeux sont proposés : All-Out Warfare (128 joueurs sur PS5/Xbox Series, 64 sur PS4/Xbox One), Hazard Zone et Mode Portal.', 'https://image.jeuxvideo.com/medias-sm/163664/1636636223-8849-jaquette-avant.jpg', 1, 'https://www.youtube.com/embed/nkTplFoXFlY', 9),
(3, 'Fifa 22', '2021-10-01', '', 'FIFA 22 est une simulation de football éditée par Electronic Arts. Comme chaque saison, le jeu offre son lot d\'améliorations techniques pour toujours plus de réalisme ainsi que des animations et des comportements toujours plus poussés. Les modes carrière et Ultimate Team disposent également de nouveaux ajouts.', 'https://image.jeuxvideo.com/medias-sm/163154/1631541998-5162-jaquette-avant.jpg', 8, 'https://www.youtube.com/embed/vLj-27T-SEQ', 8),
(4, 'Légendes Pokémon : Arceus', '2022-01-22', 'Nintendo The Pokémon Company', 'Légendes Pokémon : Arceus tranche avec les précédents opus Pokémon puisqu\'il prend place dans un monde ouvert. Le titre se déroule dans la région de Sinnoh, bien avant sa colonisation par les êtres humains. Le joueur incarnera toujours un dresseur de Pokémon, cette fois-ci chargé de créer le premier Pokédex de Sinnoh.', 'https://image.jeuxvideo.com/medias-sm/163353/1633531106-3464-jaquette-avant.gif', 4, 'https://www.youtube.com/embed/ALjqD5SLuHo', 5),
(5, 'Elden Ring', '2022-02-25', 'From Software Bandai Namco', 'Elden Ring est le nouveau jeu de From Software. Il s\'agit d\'un RGP/action à la troisième personne qui proposerait un monde ouvert. L ejeu marque la collaboration entre Hidetaka Miyazaki et George R. R. Martin, le créateur de Game of Thrones.', 'https://image.jeuxvideo.com/medias-sm/163301/1633006670-7022-jaquette-avant.jpg', 2, 'https://www.youtube.com/embed/M2EZDQ6_jfA', 12),
(6, 'Martha is Dead', '2022-02-24', '	LKA Wired Productions', 'Aventure à la première personne, Martha is Dead est un thriller psychologique dont l\'intrigue commence en 1944, en Toscane. Le conflit entre l\'Allemagne et les Alliés y fait rage. À travers les yeux d\'une fille d\'un soldat allemand, le joueur découvre le corps d\'une femme noyée : il devra donc partir à la recherche de la vérité entourant le mystérieux décès.', 'https://image.jeuxvideo.com/medias-sm/164545/1645450819-855-jaquette-avant.jpg', 5, 'https://www.youtube.com/embed/bND7zF7z548', 11),
(7, 'New Super Mario Bros. U Deluxe', '2019-01-11', 'Nintendo', 'New Super Mario Bros. U Deluxe est à la fois une fusion et un portage. Le jeu contient tous les niveaux de New Super Mario Bros. U et New Super Luigi. U emmenés sur Nintendo Switch. Les personnages secondaires ont également été modifiées par rapport au jeu de base, Nabbit et Toadette sont donc les aventuriers bonus de cet épisode.', 'https://image.jeuxvideo.com/medias-sm/154410/1544104487-917-jaquette-avant.jpg', 6, 'https://www.youtube.com/embed/zTA5MKKZXx0', 5);

-- --------------------------------------------------------

--
-- Structure de la table `games_plateformes`
--

CREATE TABLE `games_plateformes` (
  `games_id` int(11) NOT NULL,
  `plateforme_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'FPS'),
(2, 'RPG'),
(3, 'Survival-Horreur'),
(4, 'Action'),
(5, 'Aventure'),
(6, 'Plateforme'),
(7, 'Simulation'),
(8, 'Sport');

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `link` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_line`
--

CREATE TABLE `order_line` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plateforme`
--

CREATE TABLE `plateforme` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `plateforme`
--

INSERT INTO `plateforme` (`id`, `name`) VALUES
(1, 'Xbox Series'),
(2, 'PS5'),
(3, 'PS4'),
(4, 'Xbox One'),
(5, 'Switch'),
(6, 'PC'),
(7, 'Xbox Series/One'),
(8, 'PS5/PS4'),
(9, 'PC/PS5/PS4'),
(10, 'PC'),
(11, 'PC/Xbox Series/One'),
(12, 'Toutes plateformes');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `photo`, `price`, `description`) VALUES
(1, 4, 'T-shirt', 'upload/62415c95ad0cd9.63551376.jpg', 20, 'T-shirt du sites'),
(2, 4, 'Porte-clé', 'upload/62415d42c12d91.71829870.jpg', 5, 'Porte-clé du site');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `roles` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `mail`, `last_login`, `roles`) VALUES
(1, 'Valentin', '$argon2id$v=19$m=65536,t=4,p=1$jAMOve37STgOuQX8zGk+rA$879ui3Kt5tVo7HTplwxqIFoFYp8ud+gsXEK96srnjNs', 'valentin.saugnier@gmail.com', NULL, 'ROLE_USER'),
(2, 'Test', '$argon2id$v=19$m=65536,t=4,p=1$7mqlKgudpOMF4IT20FXhSQ$odV0E+Yk4Wv0tFlLYq8rJ2lWrCH/UkZg+HW5UW217tw', 'test@gmail.com', NULL, 'ROLE_ADMIN'),
(4, 'Edgar Pureco', '$2y$13$4Q.iTmzp3s2ygFtx1/CEEOWbfRCeWHTWj2A0mJVVd9S7.fCPhJwre', 'edgar@gmail.com', NULL, 'ROLE_ADMIN'),
(5, 'Edgar Pureco Huerta', '$2y$13$cfJLaHXXKAwLcSbEQeWiXetSTl3trGRTNDNaTAxhHhKP5nxQAvG8K', 'pureco@gmail.com', NULL, 'ROLE_ADMIN'),
(6, 'Aymane', '$2y$13$L2..flvkm/8STB94xsnFROOj1u2KdVXiUauLZc9kHGFbIjzv33xtW', 'a@a.fr', NULL, 'ROLE_ADMIN'),
(7, 'User', '$2y$13$bb1Nm2jYlBizkQ0Th7FSPeWWF2NEny6swqyFYrKuCW71l.cebYBJG', 'u@u.fr', NULL, 'ROLE_USER'),
(8, 'ee', '$2y$13$rMCUsjf8mESVkJK.57/uE.4MkJ352pEs8ReB.dnvIcBVekqCPGYBm', 'e@e.fr', NULL, 'ROLE_USER');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E66A76ED395` (`user_id`),
  ADD KEY `IDX_23A0E6612469DE2` (`category_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCA76ED395` (`user_id`),
  ADD KEY `IDX_67F068BC727ACA70` (`parent_id`),
  ADD KEY `IDX_67F068BC7294869C` (`article_id`);

--
-- Index pour la table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FF232B314296D31F` (`genre_id`),
  ADD KEY `IDX_FF232B31391E226B` (`plateforme_id`);

--
-- Index pour la table `games_plateformes`
--
ALTER TABLE `games_plateformes`
  ADD PRIMARY KEY (`games_id`,`plateforme_id`),
  ADD KEY `IDX_E82B996B97FFC673` (`games_id`),
  ADD KEY `IDX_E82B996B391E226B` (`plateforme_id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEEA76ED395` (`user_id`);

--
-- Index pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9CE58EE14584665A` (`product_id`),
  ADD KEY `IDX_9CE58EE18D9F6D38` (`order_id`);

--
-- Index pour la table `plateforme`
--
ALTER TABLE `plateforme`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_line`
--
ALTER TABLE `order_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `plateforme`
--
ALTER TABLE `plateforme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E6612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_23A0E66A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `commentaire` (`id`),
  ADD CONSTRAINT `FK_67F068BC7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_67F068BCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `FK_FF232B31391E226B` FOREIGN KEY (`plateforme_id`) REFERENCES `plateforme` (`id`),
  ADD CONSTRAINT `FK_FF232B314296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

--
-- Contraintes pour la table `games_plateformes`
--
ALTER TABLE `games_plateformes`
  ADD CONSTRAINT `FK_E82B996B391E226B` FOREIGN KEY (`plateforme_id`) REFERENCES `plateforme` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E82B996B97FFC673` FOREIGN KEY (`games_id`) REFERENCES `games` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `FK_9CE58EE14584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_9CE58EE18D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
