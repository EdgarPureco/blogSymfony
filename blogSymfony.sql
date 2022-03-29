-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 28 mars 2022 à 12:58
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

INSERT INTO `article` values 
(1, 4, 1, "Nouvelle saison Halo Infinite", "La saison 2 de Halo Infinite devrait être lancée le 2 mai 2022, marquant l’arrivée d’une nouvelle campagne et d’un nouveau contenu multijoueur. Alors que le développeur de Halo Infinite, 343 Industries, ne s’est engagé qu’à une fenêtre de lancement lâche « mai 2022 » pour la saison 2, le Battle Pass existant fournit une date de lancement plus ferme. Le Battle Pass, Heroes of Reach, affiche un compte à rebours jusqu’à la fin de la saison 1, doublant également la date de lancement prévue de la saison 2.

Avec les mises à jour de Halo Infinite traditionnellement déployées à 10 h PT / 13 h HE, la saison 2 devrait suivre le même calendrier, en supposant un lancement le 2 mai.

343 Industries avait précédemment annoncé une approche saisonnière du contenu post-lancement, avec un écart de trois mois entre ces versions importantes. Et alors que la saison 2 devait autrefois être lancée début février 2022, le studio a annoncé plus tard un report de trois mois jusqu’en mai.

« Nous avons pris la décision de prolonger la saison 1 pour nous donner plus de temps pour nous assurer que la saison 2 respecte notre barre de haute qualité et ainsi nous pouvons terminer le développement de la saison 2 de manière saine et durable pour notre équipe », a déclaré Joesph Staten, directeur créatif de Halo Infinite. . Le déménagement a vu la saison 1 s’étendre sur six mois, avec plus d’événements introduits pour compenser la durée d’exécution prolongée.","2022-03-28"),
(2, 6, 1, "Le Warden est là grace à la Snapshot 22w12a", "Depuis le 24 mars dernier, une nouvelle Snapshot est disponible dans Minecraft et il s'agit de la Snapshot 22w12a. Celle-ci permet l'ajout de nouveautés avec principalement l'introduction du Warden, mais aussi les hurleurs Sculk, ainsi qu'un nouvel enchantement et les bateaux-coffre.", "2022-03-27");
-- --------------------------------------------------------

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
-- Structure de la table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` date NOT NULL,
  `developer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `synopsis` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plateforme_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `games`
--

INSERT INTO `games` (`id`, `title`, `year`, `developer`, `synopsis`, `photo`, `plateforme_id`, `genre_id`) VALUES
(1, 'Dying Light 2 : Stay Human', '2022-02-04', 'Techland', 'Dying Light 2 est un Survival-Horror dans lequel le joueur doit survivre dans un environnement peuplé de zombies. Dans ce nouvel opus, l\'enjeu sera de contrôler notamment des réserves d\'eau et de nourriture afin de maîtriser une cité de survivants. Les choix du joueur ont ainsi une importance capitale dans le déroulement du scénario.\r\n', 'https://image.jeuxvideo.com/medias-sm/163247/1632473272-6800-jaquette-avant.jpg ', 2, 3),
(2, 'Battlefield 2042', '2021-11-19', 'Dice  Electronic Arts', 'Battlefield 2042 est un jeu de tir à la première personne multijoueur ancré dans un futur dystopique. Deux nations mènent une guerre totale, les Etats-Unis et la Russie. Trois modes de jeux sont proposés : All-Out Warfare (128 joueurs sur PS5/Xbox Series, 64 sur PS4/Xbox One), Hazard Zone et Mode Portal.', 'https://image.jeuxvideo.com/medias-sm/163664/1636636223-8849-jaquette-avant.jpg', 4, 1),
(3, 'Fifa 22', '2021-10-01', '', 'FIFA 22 est une simulation de football éditée par Electronic Arts. Comme chaque saison, le jeu offre son lot d\'améliorations techniques pour toujours plus de réalisme ainsi que des animations et des comportements toujours plus poussés. Les modes carrière et Ultimate Team disposent également de nouveaux ajouts.', 'https://image.jeuxvideo.com/medias-sm/163154/1631541998-5162-jaquette-avant.jpg', 12, 8),
(4, 'Légendes Pokémon : Arceus', '2022-01-22', 'Nintendo The Pokémon Company', 'Légendes Pokémon : Arceus tranche avec les précédents opus Pokémon puisqu\'il prend place dans un monde ouvert. Le titre se déroule dans la région de Sinnoh, bien avant sa colonisation par les êtres humains. Le joueur incarnera toujours un dresseur de Pokémon, cette fois-ci chargé de créer le premier Pokédex de Sinnoh.', 'https://image.jeuxvideo.com/medias-sm/163353/1633531106-3464-jaquette-avant.gif', 5, 4),
(5, 'Elden Ring', '2022-02-25', 'From Software Bandai Namco', 'Elden Ring est le nouveau jeu de From Software. Il s\'agit d\'un RGP/action à la troisième personne qui proposerait un monde ouvert. L ejeu marque la collaboration entre Hidetaka Miyazaki et George R. R. Martin, le créateur de Game of Thrones.', 'https://image.jeuxvideo.com/medias-sm/163301/1633006670-7022-jaquette-avant.jpg', 12, 2),
(6, 'Martha is Dead', '2022-02-24', '	LKA Wired Productions', 'Aventure à la première personne, Martha is Dead est un thriller psychologique dont l\'intrigue commence en 1944, en Toscane. Le conflit entre l\'Allemagne et les Alliés y fait rage. À travers les yeux d\'une fille d\'un soldat allemand, le joueur découvre le corps d\'une femme noyée : il devra donc partir à la recherche de la vérité entourant le mystérieux décès.', 'https://image.jeuxvideo.com/medias-sm/164545/1645450819-855-jaquette-avant.jpg', 1, 5),
(7, 'New Super Mario Bros. U Deluxe', '2019-01-11', 'Nintendo', 'New Super Mario Bros. U Deluxe est à la fois une fusion et un portage. Le jeu contient tous les niveaux de New Super Mario Bros. U et New Super Luigi. U emmenés sur Nintendo Switch. Les personnages secondaires ont également été modifiées par rapport au jeu de base, Nabbit et Toadette sont donc les aventuriers bonus de cet épisode.', 'https://image.jeuxvideo.com/medias-sm/154410/1544104487-917-jaquette-avant.jpg', 5, 6);

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
(3, 'Survival'),
(4, 'Action'),
(5, 'Aventure'),
(6, 'Plateforme'),
(7, 'Simulation'),
(8, 'Sport');

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
(4, 'One'),
(5, 'Switch'),
(6, 'PC'),
(7, 'Xbox Series/One'),
(8, 'PS5/PS4'),
(9, 'PC/PS5/PS4'),
(10, 'PC'),
(11, 'PC/Xbox Series/One'),
(12, 'PC/Xbox Series/One/PS5/PS4');

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
-- Index pour la table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FF232B31391E226B` (`plateforme_id`),
  ADD KEY `IDX_FF232B314296D31F` (`genre_id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- Contraintes pour la table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `FK_FF232B31391E226B` FOREIGN KEY (`plateforme_id`) REFERENCES `plateforme` (`id`),
  ADD CONSTRAINT `FK_FF232B314296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

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