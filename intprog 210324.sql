-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 21 Mar 2024, 09:11:06
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `intprog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `branches`
--
DELIMITER $$
CREATE TRIGGER `Delete_branches` BEFORE DELETE ON `branches` FOR EACH ROW BEGIN
    INSERT INTO branches_log (id, title, adress, created_at)
    VALUES (OLD.id, OLD.title, OLD.adress, OLD.created_at);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_branches` BEFORE UPDATE ON `branches` FOR EACH ROW BEGIN INSERT INTO branches_log SET 
id=OLD.id ,title=OLD.title,
adress=OLD.adress,
created_at=OLD.created_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branches_log`
--

CREATE TABLE `branches_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `brands`
--
DELIMITER $$
CREATE TRIGGER `delete_brands` BEFORE DELETE ON `brands` FOR EACH ROW BEGIN INSERT INTO brands_log SET 
id=OLD.id , img_url=OLD.img_url ,
title=OLD.title , rank =OLD.rank ,is_active=OLD.is_active,
created_at=OLD.created_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_brands` BEFORE UPDATE ON `brands` FOR EACH ROW BEGIN INSERT INTO brands_log SET 
id=OLD.id , img_url=OLD.img_url ,
title=OLD.title , rank =OLD.rank ,is_active=OLD.is_active,
created_at=OLD.created_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands_log`
--

CREATE TABLE `brands_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `product`
--
DELIMITER $$
CREATE TRIGGER `delete_product` BEFORE DELETE ON `product` FOR EACH ROW BEGIN INSERT INTO product_log SET 
id=OLD.id , img_url=OLD.img_url ,
title=OLD.title , description = OLD.description ,
rank =OLD.rank ,is_active=OLD.is_active,
created_at=OLD.created_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_product` BEFORE UPDATE ON `product` FOR EACH ROW BEGIN INSERT INTO product_log SET 
id=OLD.id , img_url=OLD.img_url ,
title=OLD.title , description = OLD.description ,
rank =OLD.rank ,is_active=OLD.is_active,
created_at=OLD.created_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_cover` tinyint(4) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `products_images`
--
DELIMITER $$
CREATE TRIGGER `delete_products_images` BEFORE DELETE ON `products_images` FOR EACH ROW BEGIN INSERT INTO products_images SET 
id=OLD.id, product_id=OLD.product_id , rank=OLD.rank , 
is_cover=OLD.is_cover , img_url=OLD.img_url ,
is_active=OLD.is_active , created_at=OLD.created_at ;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_products_images` BEFORE UPDATE ON `products_images` FOR EACH ROW BEGIN INSERT INTO products_images SET 
id=OLD.id, product_id=OLD.product_id , rank=OLD.rank , 
is_cover=OLD.is_cover , img_url=OLD.img_url ,
is_active=OLD.is_active , created_at=OLD.created_at ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products_images_log`
--

CREATE TABLE `products_images_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `is_cover` tinyint(4) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `product_categories`
--
DELIMITER $$
CREATE TRIGGER `delete_product_categories` BEFORE DELETE ON `product_categories` FOR EACH ROW BEGIN INSERT INTO product_categories SET 
id=OLD.id ,
title=OLD.title,is_active=OLD.is_active,
created_at=OLD.created_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_product_categories` BEFORE UPDATE ON `product_categories` FOR EACH ROW BEGIN INSERT INTO product_categories SET 
id=OLD.id ,
title=OLD.title,is_active=OLD.is_active,
created_at=OLD.created_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_categories_log`
--

CREATE TABLE `product_categories_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_log`
--

CREATE TABLE `product_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references`
--

CREATE TABLE `references` (
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `references`
--
DELIMITER $$
CREATE TRIGGER `delete_references` BEFORE DELETE ON `references` FOR EACH ROW BEGIN INSERT INTO product_categories SET 
id=OLD.id , img_url=OLD.img_url, url=OLD.url,
title=OLD.title , description=OLD.description ,
rank=OLD.rank,is_active=OLD, created_at=OLD.created_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_references` BEFORE UPDATE ON `references` FOR EACH ROW BEGIN INSERT INTO product_categories SET 
id=OLD.id , img_url=OLD.img_url, url=OLD.url,
title=OLD.title , description=OLD.description ,
rank=OLD.rank,is_active=OLD, created_at=OLD.created_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references_log`
--

CREATE TABLE `references_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `title` varchar(150) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `services`
--
DELIMITER $$
CREATE TRIGGER `delete_services` BEFORE DELETE ON `services` FOR EACH ROW BEGIN INSERT INTO services SET 
id=OLD.id , img_url=OLD.img_url,
title=OLD.title ,url=OLD.url, description=OLD.description ,
rank=OLD.rank,is_active=OLD.is_active, created_at=OLD.created_at;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_services` BEFORE UPDATE ON `services` FOR EACH ROW BEGIN INSERT INTO services SET 
id=OLD.id , img_url=OLD.img_url,
title=OLD.title ,url=OLD.url, description=OLD.description ,
rank=OLD.rank,is_active=OLD.is_active, created_at=OLD.created_at;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services_log`
--

CREATE TABLE `services_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `company_name` varchar(250) NOT NULL,
  `adress` varchar(250) NOT NULL,
  `about_us` text NOT NULL,
  `slogan` varchar(250) NOT NULL,
  `mission` varchar(250) NOT NULL,
  `vision` varchar(250) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `mobile_img_url` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `gsm1` varchar(50) NOT NULL,
  `gsm2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `settings`
--
DELIMITER $$
CREATE TRIGGER `delete_settings` BEFORE DELETE ON `settings` FOR EACH ROW BEGIN INSERT INTO services SET 
id=OLD.id , company_name=OLD.company_name,  adress=OLD.adress, about_us=OLD.about_us , slogan=OLD.slogan , mission=OLD.mission  ,vision=OLD.vision, img_url=OLD.img_url ,
mobile_img_url=OLD.mobile_img_url , favicon=OLD.favicon, 
phone1=OLD.phone1, phone2=OLD.phone2 , email=OLD.email ,
facebook=OLD.facebook , twitter=OLD.twitter , instagram=OLD.instagram , linkedin=OLD.linkedin , created_at=OLD.created_at , gsm1=OLD.gsm1 ,gsm2=OLD.gsm2 ;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_settings` BEFORE UPDATE ON `settings` FOR EACH ROW BEGIN INSERT INTO services SET 
id=OLD.id , company_name=OLD.company_name,  adress=OLD.adress, about_us=OLD.about_us , slogan=OLD.slogan , mission=OLD.mission  ,vision=OLD.vision, img_url=OLD.img_url ,
mobile_img_url=OLD.mobile_img_url , favicon=OLD.favicon, 
phone1=OLD.phone1, phone2=OLD.phone2 , email=OLD.email ,
facebook=OLD.facebook , twitter=OLD.twitter , instagram=OLD.instagram , linkedin=OLD.linkedin , created_at=OLD.created_at , gsm1=OLD.gsm1 ,gsm2=OLD.gsm2 ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings_log`
--

CREATE TABLE `settings_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `company_name` varchar(250) NOT NULL,
  `adress` varchar(250) NOT NULL,
  `about_us` varchar(250) NOT NULL,
  `slogan` varchar(250) NOT NULL,
  `mission` varchar(250) NOT NULL,
  `vision` varchar(250) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `mobile_img_url` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `gsm1` varchar(50) NOT NULL,
  `gsm2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subeler`
--

CREATE TABLE `subeler` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `adress` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subeler_log`
--

CREATE TABLE `subeler_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `adress` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `testimonials`
--
DELIMITER $$
CREATE TRIGGER `delete_testimonials` BEFORE DELETE ON `testimonials` FOR EACH ROW BEGIN INSERT INTO testimonials SET 
id=OLD.id, title=OLD.title ,
description=OLD.description , full_name=OLD.full_name,
company=OLD.company , img_url =OLD.img_url ,
rank=OLD.rank , is_active=OLD.is_active , created_at=OLD.created_at ;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_testimonials` BEFORE UPDATE ON `testimonials` FOR EACH ROW BEGIN INSERT INTO testimonials SET 
id=OLD.id, title=OLD.title ,
description=OLD.description , full_name=OLD.full_name,
company=OLD.company , img_url =OLD.img_url ,
rank=OLD.rank , is_active=OLD.is_active , created_at=OLD.created_at ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimonials_log`
--

CREATE TABLE `testimonials_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `users`
--
DELIMITER $$
CREATE TRIGGER `delete_users` BEFORE DELETE ON `users` FOR EACH ROW BEGIN INSERT INTO users SET 
id=OLD.id,img_url =OLD.img_url ,
email=OLD.email , name=OLD.name , surname=OLD.surname , password=OLD.password , is_active=OLD.is_active  ;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_users` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN INSERT INTO users SET 
id=OLD.id,img_url =OLD.img_url ,
email=OLD.email , name=OLD.name , surname=OLD.surname , password=OLD.password , is_active=OLD.is_active  ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users_log`
--

CREATE TABLE `users_log` (
  `log_id` int(11) NOT NULL,
  `status_log` int(11) NOT NULL,
  `log_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `branches_log`
--
ALTER TABLE `branches_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `brands_log`
--
ALTER TABLE `brands_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products_images_log`
--
ALTER TABLE `products_images_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_categories_log`
--
ALTER TABLE `product_categories_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `product_log`
--
ALTER TABLE `product_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `references`
--
ALTER TABLE `references`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `references_log`
--
ALTER TABLE `references_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `services_log`
--
ALTER TABLE `services_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `settings_log`
--
ALTER TABLE `settings_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `subeler`
--
ALTER TABLE `subeler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `subeler_log`
--
ALTER TABLE `subeler_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `testimonials_log`
--
ALTER TABLE `testimonials_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users_log`
--
ALTER TABLE `users_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `branches_log`
--
ALTER TABLE `branches_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `brands_log`
--
ALTER TABLE `brands_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `products_images_log`
--
ALTER TABLE `products_images_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_categories_log`
--
ALTER TABLE `product_categories_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_log`
--
ALTER TABLE `product_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `references`
--
ALTER TABLE `references`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `references_log`
--
ALTER TABLE `references_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `services_log`
--
ALTER TABLE `services_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `settings_log`
--
ALTER TABLE `settings_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `subeler`
--
ALTER TABLE `subeler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `subeler_log`
--
ALTER TABLE `subeler_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `testimonials_log`
--
ALTER TABLE `testimonials_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users_log`
--
ALTER TABLE `users_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
