/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100420
 Source Host           : localhost:3306
 Source Schema         : mncapp

 Target Server Type    : MySQL
 Target Server Version : 100420
 File Encoding         : 65001

 Date: 25/10/2021 19:23:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (3, 'Tas Gucci', 'Tas', 'Tas gucci untuk menempatkan barang');
INSERT INTO `produk` VALUES (5, 'tesssr', 'tesasd', 'cdsndjk');
INSERT INTO `produk` VALUES (6, 'tess', 'sec', 'dcs');
INSERT INTO `produk` VALUES (7, 'tess', 'sec', 'dcs');
INSERT INTO `produk` VALUES (8, 'fwfew', 'fssef', 'fsse');
INSERT INTO `produk` VALUES (9, 'barang', 'barang', 'fsse');
INSERT INTO `produk` VALUES (10, 'barang', 'barang', 'fsse');
INSERT INTO `produk` VALUES (11, 'barang', 'barang', 'fsse');
INSERT INTO `produk` VALUES (12, 'KUNCI', 'KUNCI', 'KUNCI');
INSERT INTO `produk` VALUES (14, 'FEFE', 'FSCS', 'EFC');
INSERT INTO `produk` VALUES (15, 'barang', 'barang', 'fsse');
INSERT INTO `produk` VALUES (16, 'barang', 'barang', 'fsse');
INSERT INTO `produk` VALUES (17, 'barang', 'barang', 'fsse');
INSERT INTO `produk` VALUES (18, 'barang', 'barang', 'fsse');
INSERT INTO `produk` VALUES (19, 'barang', 'barang', 'fsse');
INSERT INTO `produk` VALUES (20, 'barang', 'barang', 'fsse');

-- ----------------------------
-- Table structure for produk_detail
-- ----------------------------
DROP TABLE IF EXISTS `produk_detail`;
CREATE TABLE `produk_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produk` int NULL DEFAULT NULL,
  `warna` enum('Merah','Biru','Hitam','abu-abu') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ukuran` enum('S','M','L','XL','XXL') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_produk`(`id_produk`) USING BTREE,
  CONSTRAINT `produkdetail_to_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk_detail
-- ----------------------------
INSERT INTO `produk_detail` VALUES (2, 3, 'Merah', 'M', 50000);
INSERT INTO `produk_detail` VALUES (4, NULL, 'Merah', NULL, NULL);
INSERT INTO `produk_detail` VALUES (5, NULL, 'Merah', NULL, NULL);
INSERT INTO `produk_detail` VALUES (6, NULL, 'Biru', NULL, NULL);
INSERT INTO `produk_detail` VALUES (7, NULL, 'Biru', NULL, NULL);
INSERT INTO `produk_detail` VALUES (8, NULL, 'Biru', NULL, NULL);
INSERT INTO `produk_detail` VALUES (12, NULL, NULL, NULL, NULL);
INSERT INTO `produk_detail` VALUES (13, 14, NULL, NULL, NULL);
INSERT INTO `produk_detail` VALUES (14, 15, NULL, NULL, NULL);
INSERT INTO `produk_detail` VALUES (15, 16, NULL, NULL, NULL);
INSERT INTO `produk_detail` VALUES (16, 17, NULL, NULL, NULL);
INSERT INTO `produk_detail` VALUES (17, 18, NULL, NULL, NULL);
INSERT INTO `produk_detail` VALUES (18, 19, NULL, NULL, NULL);
INSERT INTO `produk_detail` VALUES (19, 19, 'Biru', 'S', 4434);
INSERT INTO `produk_detail` VALUES (20, 20, NULL, NULL, NULL);
INSERT INTO `produk_detail` VALUES (21, 20, 'Biru', 'S', 4434);

-- ----------------------------
-- Triggers structure for table produk
-- ----------------------------
DROP TRIGGER IF EXISTS `produk_to_produkdetail`;
delimiter ;;
CREATE TRIGGER `produk_to_produkdetail` AFTER INSERT ON `produk` FOR EACH ROW BEGIN
INSERT INTO produk_detail (id_produk)values(NEW.id);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table produk
-- ----------------------------
DROP TRIGGER IF EXISTS `idproduk_to_produkdetail`;
delimiter ;;
CREATE TRIGGER `idproduk_to_produkdetail` AFTER DELETE ON `produk` FOR EACH ROW BEGIN
DELETE FROM produk_detail WHERE id_produk=OLD.id;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
