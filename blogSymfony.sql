-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 28 mars 2022 à 08:46
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
DROP TABLE IF EXISTS `article` ;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `type`
--
DROP TABLE IF EXISTS `type`  ;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `comment`
--
DROP TABLE IF EXISTS `comment` ;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `game`
--
DROP TABLE IF EXISTS `game` ;
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` date NOT NULL,
  `developer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `synopsis` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plateforme` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------
--
-- Structure de la table `order_line`
--
DROP TABLE IF EXISTS `order_line`;
CREATE TABLE IF NOT EXISTS `order_line` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Structure de la table `orders`
--
DROP TABLE IF EXISTS `orders` ;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `product`
--
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `category`
--
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `user`
--
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `roles` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'Jeux'),
(2, 'Article'),
(3, 'Produit');

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `type`) VALUES
(1, 'Shooters', 1),
(2, 'Horror', 1),
(3, 'Survival', 1),
(4, 'Goodies', 3),
(5, 'Test', 2),
(6, 'Video', 2),
(7, 'Adventure', 1);
--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `photo`, `price`, `description`) VALUES
(1, 4, 'T-shirt', 'upload/62415c95ad0cd9.63551376.jpg', 20, 'T-shirt du sites'),
(2, 4, 'Porte-clé', 'upload/62415d42c12d91.71829870.jpg', 5, 'Porte-clé du site');

--
-- Déchargement des données de la table `game`
--
INSERT INTO `game` (`id`, `category_id`, `title`, `year`, `developer`, `synopsis`, `photo`) VALUES
(1, 1, 'Halo Infinite', '2021-11-15', "343 Industries", "Incarnez le Major :
Tandis que l'espoir meurt et que le sort de l'humanité est en jeu, le Major s'apprête à affronter son plus redoutable ennemi à ce jour. Enfilez l'armure du plus grand héros de l'humanité pour vivre une aventure épique et explorer l'immensité de l'anneau.
Explorez le Halo Zeta :
Halo Infinite offre la campagne Halo la plus complète et haletante jamais proposée, située dans l'environnement ouvert d'un anneau-monde antique, le Halo Zeta. Parcourez les vastes étendues de l'Installation 07, des points culminants aux profondeurs secrètes de l'anneau. Sauvez les Marines de l'UNSC pour obtenir des renforts dans votre lutte contre ces redoutables ennemis qui se font appeler ''les Parias''.
Terrassez les Parias :
Suite aux événements de Halo 5 et après avoir essuyé une défaite écrasante, la flotte de l'UNSC s'est échouée à la surface de l'Installation 07, fortement endommagée. Mais un clan terrifiant de guerriers brutes, les Parias, arpente désormais cet anneau-monde dévasté. En claire infériorité numérique et matérielle, le Major devra empêcher les Parias de réparer le Halo et d'avoir la mainmise sur la plus grande menace de la galaxie.", NULL),
(2, 1, 'Elden Ring', '2022-02-25', "FromSoftware", "UNE NOUVELLE AVENTURE GRANDIOSE VOUS ATTEND
Levez-vous, Sans-éclat, et puisse la grâce guider vos pas. Brandissez la puissance du Cercle d'Elden. Devenez Seigneur de l'Entre-terre.
• Un vaste monde à explorer
Un monde immense aux environnements riches et variés, parsemé d'obscurs et tortueux donjons tous reliés naturellement entre eux, vous attend. Au fil de votre exploration, goûtez à l'inconnu, bravez les menaces permanentes et accomplissez votre destinée.
• Créez votre propre personnage
En plus de l'apparence de votre personnage, vous êtes libre de personnaliser votre arsenal d'armes, d'armures et de sorts. Construisez un personnage qui correspond à votre style de jeu, et devenez un guerrier surpuissant, ou encore un maître de la magie.
• Un scénario épique né d'un mythe
Plusieurs histoires se mêlent dans un récit narré par fragments. Vous rencontrerez des personnages complexes au fil de votre découverte épique de l'Entre-terre.
• Connectez-vous librement à d'autres joueurs grâce au mode en ligne
En plus du mode multijoueur, vous permettant de vous connecter directement à d'autres joueurs et de voyager ensemble, le jeu propose un système en ligne asynchrone unique vous permettant de ressentir la présence des autres Sans-éclat.", NULL ),
(3, 3, 'Minecraft', '2011-11-18',"Mojang", "Minecraft est un jeu vidéo de type aventure « bac à sable » (construction complètement libre) développé par le Suédois Markus Persson, alias Notch, puis par la société Mojang Studios. Il s'agit d'un univers composé de voxels et généré de façon procédurale, qui intègre un système d'artisanat axé sur l'exploitation puis la transformation de ressources naturelles (minéralogiques, fossiles, animales et végétales).", NULL);


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

INSERT INTO `article` values 
(1, 4, 1, "Nouvelle saison Halo Infinite", "La saison 2 de Halo Infinite devrait être lancée le 2 mai 2022, marquant l’arrivée d’une nouvelle campagne et d’un nouveau contenu multijoueur. Alors que le développeur de Halo Infinite, 343 Industries, ne s’est engagé qu’à une fenêtre de lancement lâche « mai 2022 » pour la saison 2, le Battle Pass existant fournit une date de lancement plus ferme. Le Battle Pass, Heroes of Reach, affiche un compte à rebours jusqu’à la fin de la saison 1, doublant également la date de lancement prévue de la saison 2.

Avec les mises à jour de Halo Infinite traditionnellement déployées à 10 h PT / 13 h HE, la saison 2 devrait suivre le même calendrier, en supposant un lancement le 2 mai.

343 Industries avait précédemment annoncé une approche saisonnière du contenu post-lancement, avec un écart de trois mois entre ces versions importantes. Et alors que la saison 2 devait autrefois être lancée début février 2022, le studio a annoncé plus tard un report de trois mois jusqu’en mai.

« Nous avons pris la décision de prolonger la saison 1 pour nous donner plus de temps pour nous assurer que la saison 2 respecte notre barre de haute qualité et ainsi nous pouvons terminer le développement de la saison 2 de manière saine et durable pour notre équipe », a déclaré Joesph Staten, directeur créatif de Halo Infinite. . Le déménagement a vu la saison 1 s’étendre sur six mois, avec plus d’événements introduits pour compenser la durée d’exécution prolongée.","2022-03-28"),
(2, 6, 1, "Le Warden est là grace à la Snapshot 22w12a", "Depuis le 24 mars dernier, une nouvelle Snapshot est disponible dans Minecraft et il s'agit de la Snapshot 22w12a. Celle-ci permet l'ajout de nouveautés avec principalement l'introduction du Warden, mais aussi les hurleurs Sculk, ainsi qu'un nouvel enchantement et les bateaux-coffre.", "2022-03-27");
-- --------------------------------------------------------


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
-- Index pour la table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FF232B3112469DE2` (`category_id`);

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
-- AUTO_INCREMENT pour la table `game`
--
ALTER TABLE `game`
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
-- Contraintes pour la table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `FK_FF232B3112469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

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