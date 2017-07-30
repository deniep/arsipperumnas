/*
Navicat MySQL Data Transfer

Source Server         : MySQLLocal
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : pengarsipan

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-07-24 16:49:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_arsip_surat_keluar
-- ----------------------------
DROP TABLE IF EXISTS `tp_arsip_surat_keluar`;
CREATE TABLE `tp_arsip_surat_keluar` (
  `id_arsip_surat_masuk` int(10) NOT NULL AUTO_INCREMENT,
  `id_jenis_surat` int(1) DEFAULT NULL,
  `nomor_urut` varchar(50) DEFAULT NULL,
  `nomor_berkas` varchar(50) DEFAULT NULL,
  `nomor_surat_masuk` varchar(50) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `pengirim` varchar(100) DEFAULT NULL,
  `perihal` varchar(255) DEFAULT NULL,
  `path_berkas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_arsip_surat_masuk`),
  KEY `FK_id_jenis_surat` (`id_jenis_surat`),
  CONSTRAINT `tp_arsip_surat_keluar_ibfk_1` FOREIGN KEY (`id_jenis_surat`) REFERENCES `tr_jenis_surat` (`id_jenis_surat`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_arsip_surat_keluar
-- ----------------------------

-- ----------------------------
-- Table structure for tp_arsip_surat_masuk
-- ----------------------------
DROP TABLE IF EXISTS `tp_arsip_surat_masuk`;
CREATE TABLE `tp_arsip_surat_masuk` (
  `id_arsip_surat_masuk` int(10) NOT NULL AUTO_INCREMENT,
  `id_jenis_surat` int(1) DEFAULT NULL,
  `nomor_urut` varchar(50) DEFAULT NULL,
  `nomor_berkas` varchar(50) DEFAULT NULL,
  `nomor_surat_masuk` varchar(50) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `pengirim` varchar(100) DEFAULT NULL,
  `perihal` varchar(255) DEFAULT NULL,
  `disposisi` varchar(100) DEFAULT NULL,
  `path_berkas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_arsip_surat_masuk`),
  KEY `FK_id_jenis_surat` (`id_jenis_surat`),
  CONSTRAINT `FK_id_jenis_surat` FOREIGN KEY (`id_jenis_surat`) REFERENCES `tr_jenis_surat` (`id_jenis_surat`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_arsip_surat_masuk
-- ----------------------------

-- ----------------------------
-- Table structure for tp_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user` (
  `id_user` int(5) NOT NULL AUTO_INCREMENT,
  `kode_operator` varchar(5) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `login_terakhir` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `wk_rekam` datetime DEFAULT NULL,
  `wk_ubah` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_rekam` varchar(15) DEFAULT NULL,
  `id_ubah` varchar(15) DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES ('1', 'ADM01', 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, '1', '2017-07-24 15:20:54', '2017-07-24 15:23:15', 'admin', null, '1');

-- ----------------------------
-- Table structure for tr_jenis_surat
-- ----------------------------
DROP TABLE IF EXISTS `tr_jenis_surat`;
CREATE TABLE `tr_jenis_surat` (
  `id_jenis_surat` int(1) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_jenis_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tr_jenis_surat
-- ----------------------------
INSERT INTO `tr_jenis_surat` VALUES ('1', 'Memo Dinas');
INSERT INTO `tr_jenis_surat` VALUES ('2', 'Laporan Absensi');
INSERT INTO `tr_jenis_surat` VALUES ('3', 'Pengajuan Diklat');
INSERT INTO `tr_jenis_surat` VALUES ('4', 'Ajuan Uang Makan');
INSERT INTO `tr_jenis_surat` VALUES ('5', 'Transportasi dan Gaji');