/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - perpustakaan-ppt
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perpustakaan-ppt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `perpustakaan-ppt`;

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `idBuku` char(10) NOT NULL,
  `judulBuku` varchar(25) NOT NULL,
  `tahunTerbit` varchar(13) NOT NULL,
  `jumlahBukuTersedia` int(11) NOT NULL,
  `idPenerbit` char(10) NOT NULL,
  `idKategori` char(10) NOT NULL,
  PRIMARY KEY (`idBuku`),
  KEY `fk_buku_penerbit` (`idPenerbit`),
  KEY `fk_buku_kategori` (`idKategori`),
  CONSTRAINT `fk_buku_kategori` FOREIGN KEY (`idKategori`) REFERENCES `kategoribuku` (`idKategori`),
  CONSTRAINT `fk_buku_penerbit` FOREIGN KEY (`idPenerbit`) REFERENCES `penerbit` (`idPenerbit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `buku` */

insert  into `buku`(`idBuku`,`judulBuku`,`tahunTerbit`,`jumlahBukuTersedia`,`idPenerbit`,`idKategori`) values 
('B001','Pemrograman WEB','2000',15,'P001','K011'),
('B002','Panduan Belajar Fisika','2015',29,'P002','K002'),
('B003','Sejarah Indonesia','1995',12,'P003','K004'),
('B004','Pengantar Hukum','2010',10,'P004','K008'),
('B005','Manajemen Keuangan','2021',20,'P005','K005'),
('B006','Seni Lukis Indonesia','2019',29,'P006','K007'),
('B007','Kimia Dasar','2018',15,'P007','K009'),
('B008','Pendidikan Anak','2005',29,'P008','K008'),
('B009','Biografi Soekarno','1998',29,'P009','K006'),
('B010','Olahraga Sepak Bola','2012',10,'P010','K010'),
('B011','Teknologi Komputer','2020',18,'P001','K011'),
('B012','Cerita Rakyat Jawa','2002',11,'P003','K004'),
('B013','Hidup Sehat','2014',14,'P007','K009'),
('B014','Manajemen Proyek','2017',13,'P005','K005'),
('B015','Fisika Modern','2016',29,'P002','K003'),
('B016','Sastra Indonesia Modern','2011',29,'P006','K006'),
('B017','Buku Agama','2007',29,'P008','K009'),
('B018','Kimia Organik','2009',29,'P007','K009'),
('B019','Budaya Jawa','2003',29,'P006','K007'),
('B020','Pengantar Sosiologi','2001',10,'P008','K008');

/*Table structure for table `jurusan` */

DROP TABLE IF EXISTS `jurusan`;

CREATE TABLE `jurusan` (
  `idJurusan` char(10) NOT NULL,
  `namaJurusan` varchar(25) NOT NULL,
  PRIMARY KEY (`idJurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `jurusan` */

insert  into `jurusan`(`idJurusan`,`namaJurusan`) values 
('J001','Ilmu Komputer'),
('J002','Teknik Elektro'),
('J003','Teknik Mesin'),
('J004','Ilmu Hukum'),
('J005','Manajemen Bisnis'),
('J006','Sastra Indonesia'),
('J007','Ilmu Kesehatan'),
('J008','Sosiologi'),
('J009','Ilmu Kimia'),
('J010','Fisika');

/*Table structure for table `kategoribuku` */

DROP TABLE IF EXISTS `kategoribuku`;

CREATE TABLE `kategoribuku` (
  `idKategori` char(10) NOT NULL,
  `kategori` varchar(25) NOT NULL,
  PRIMARY KEY (`idKategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kategoribuku` */

insert  into `kategoribuku`(`idKategori`,`kategori`) values 
('K001','Fiksi'),
('K002','Non-Fiksi'),
('K003','Sains'),
('K004','Sejarah'),
('K005','Teknologi'),
('K006','Biografi'),
('K007','Seni'),
('K008','Pendidikan'),
('K009','Agama'),
('K010','Olahraga'),
('K011','Komputer');

/*Table structure for table `members` */

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `idAnggota` char(10) NOT NULL,
  `namaAnggota` varchar(25) NOT NULL,
  `npm` varchar(13) NOT NULL,
  `alamatAnggota` varchar(100) DEFAULT NULL,
  `noTelepon` varchar(15) NOT NULL,
  `idJurusan` char(10) NOT NULL,
  PRIMARY KEY (`idAnggota`),
  KEY `fk_anggota_jurusan` (`idJurusan`),
  CONSTRAINT `fk_anggota_jurusan` FOREIGN KEY (`idJurusan`) REFERENCES `jurusan` (`idJurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `members` */

insert  into `members`(`idAnggota`,`namaAnggota`,`npm`,`alamatAnggota`,`noTelepon`,`idJurusan`) values 
('A001','Adi Nugroho','2009304','Jl. Merdeka 123','081234567890','J001'),
('A002','Budi Raharjo','0987654321','Jl. Jenderal Sudirman 45','081987654321','J002'),
('A003','Citra Wijaya','1122334455','Jl. Surya Kencana 7','0851122334455','J003'),
('A004','Dewi Lestari','9876543210','Jl. Cempaka 56','081234567890','J001'),
('A005','Eko Prasetyo','5678901234','Jl. Pahlawan 89','0855678901234','J004'),
('A006','Fita Susanti','1112223334','Jl. Teratai 12','0811112223334','J005'),
('A007','Gunawan Setiawan','5556667778','Jl. Merpati 34','0815556667778','J006'),
('A008','Hari Wibowo','1122334456','Jl. Raya 1','0851122334456','J007'),
('A009','Ika Purnama','1231231230','Jl. Sari 5','0811231231230','J008'),
('A010','Joko Susanto','4445556667','Jl. Sinar 78','0814445556667','J009'),
('A011','Krisna Surya','9090909090','Jl. Sakti 23','0859090909090','J010'),
('A012','Lia Permata','7778889990','Jl. Gunung 90','0817778889990','J001'),
('A013','Mulyono Budiman','3334445556','Jl. Indah 45','0853334445556','J002'),
('A014','Nia Putri','2223334445','Jl. Maju 67','0812223334445','J003'),
('A015','Oscar Tirta','6667778889','Jl. Jaya 32','0816667778889','J004'),
('A016','Prita Kusuma','8889990001','Jl. Harapan 78','0858889990001','J005'),
('A017','Qori Hasan','5556667779','Jl. Sejahtera 5','0815556667779','J006'),
('A018','Rizki Saputra','6667778880','Jl. Damai 90','0816667778880','J007'),
('A019','Siti Rahayu','8889990002','Jl. Sukses 12','0858889990002','J008'),
('A020','Tono Nugroho','7778889991','Jl. Terang 3','0817778889991','J009');

/*Table structure for table `peminjam` */

DROP TABLE IF EXISTS `peminjam`;

CREATE TABLE `peminjam` (
  `idPeminjam` char(10) NOT NULL,
  `tglPinjam` date NOT NULL,
  `tglKembali` date NOT NULL,
  `denda` int(11) NOT NULL,
  `idBuku` char(10) NOT NULL,
  `jumlahPinjam` int(11) NOT NULL,
  `idAnggota` char(10) NOT NULL,
  PRIMARY KEY (`idPeminjam`),
  KEY `fk_peminjam_anggota` (`idAnggota`),
  KEY `fk_peminjam_buku` (`idBuku`),
  CONSTRAINT `fk_peminjam_buku` FOREIGN KEY (`idBuku`) REFERENCES `buku` (`idBuku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `peminjam` */

insert  into `peminjam`(`idPeminjam`,`tglPinjam`,`tglKembali`,`denda`,`idBuku`,`jumlahPinjam`,`idAnggota`) values 
('P001','2023-09-01','2023-09-15',0,'B001',2,'A001'),
('P002','2023-09-02','2023-09-16',0,'B002',1,'A002'),
('P003','2023-09-03','2023-09-17',0,'B003',3,'A003'),
('P004','2023-09-04','2023-09-18',0,'B004',2,'A004'),
('P005','2023-09-05','2023-09-19',0,'B005',1,'A005'),
('P006','2023-09-06','2023-09-20',0,'B006',2,'A006'),
('P007','2023-09-07','2023-09-21',0,'B007',1,'A007'),
('P008','2023-09-08','2023-09-22',0,'B008',3,'A008'),
('P009','2023-09-09','2023-09-23',0,'B009',2,'A009'),
('P010','2023-09-10','2023-09-24',0,'B010',1,'A010'),
('P011','2023-09-11','2023-09-25',0,'B011',3,'A011'),
('P012','2023-09-12','2023-09-26',0,'B012',2,'A012'),
('P013','2023-09-13','2023-09-27',0,'B013',1,'A013'),
('P014','2023-09-14','2023-09-28',0,'B014',3,'A014'),
('P015','2023-09-15','2023-09-29',0,'B015',2,'A015'),
('P016','2023-09-16','2023-09-30',0,'B016',1,'A016'),
('P017','2023-09-17','2023-10-01',0,'B017',3,'A017'),
('P018','2023-09-18','2023-10-02',0,'B018',2,'A018'),
('P019','2023-09-19','2023-10-03',0,'B019',1,'A019'),
('P020','2023-09-20','2023-10-04',0,'B020',3,'A020');

/*Table structure for table `penerbit` */

DROP TABLE IF EXISTS `penerbit`;

CREATE TABLE `penerbit` (
  `idPenerbit` char(10) NOT NULL,
  `namaPenerbit` char(50) NOT NULL,
  `lokasiPenerbit` char(50) NOT NULL,
  PRIMARY KEY (`idPenerbit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `penerbit` */

insert  into `penerbit`(`idPenerbit`,`namaPenerbit`,`lokasiPenerbit`) values 
('P001','Penerbit A','Jakarta'),
('P002','Penerbit B','Bandung'),
('P003','Erlangga','Surabaya'),
('P004','Penerbit D','Yogyakarta'),
('P005','Penerbit E','Semarang'),
('P006','Penerbit F','Malang'),
('P007','Penerbit G','Makassar'),
('P008','Penerbit H','Palembang'),
('P009','Penerbit I','Medan'),
('P010','Penerbit J','Denpasar'),
('P011','Penerbit K','Balikpapan'),
('P012','Penerbit L','Pekanbaru'),
('P013','Penerbit M','Manado'),
('P014','Penerbit N','Padang'),
('P015','Penerbit O','Banjarmasin'),
('P016','Penerbit P','Samarinda'),
('P017','Penerbit Q','Pontianak'),
('P018','Penerbit R','Ambon'),
('P019','Penerbit S','Jayapura'),
('P020','Penerbit T','Kupang');

/*Table structure for table `suplaibuku` */

DROP TABLE IF EXISTS `suplaibuku`;

CREATE TABLE `suplaibuku` (
  `idSuplai` char(10) NOT NULL,
  `idBuku` char(10) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`idSuplai`),
  KEY `fk_suplaibuku_buku` (`idBuku`),
  CONSTRAINT `fk_suplaibuku_buku` FOREIGN KEY (`idBuku`) REFERENCES `buku` (`idBuku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `suplaibuku` */

insert  into `suplaibuku`(`idSuplai`,`idBuku`,`tanggal`,`jumlah`) values 
('S001','B001','2023-08-15',20),
('S002','B002','2023-08-20',10),
('S003','B003','2023-08-25',15),
('S004','B004','2023-08-30',18),
('S005','B005','2023-09-05',25),
('S006','B006','2023-09-10',12),
('S007','B007','2023-09-15',9),
('S008','B008','2023-09-20',14),
('S009','B009','2023-09-25',17),
('S010','B010','2023-09-30',10),
('S011','B011','2023-10-05',22),
('S012','B012','2023-10-10',13),
('S013','B013','2023-10-15',8),
('S014','B014','2023-10-20',16),
('S015','B015','2023-10-25',11),
('S016','B016','2023-10-30',7),
('S017','B017','2023-11-05',19),
('S018','B018','2023-11-10',12),
('S019','B019','2023-11-15',9),
('S020','B020','2023-11-20',15);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
