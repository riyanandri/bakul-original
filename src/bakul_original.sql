-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Des 2020 pada 15.15
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

-- Author : Muhammad Riyan Andriyanto
-- Github : github.com/ryanfoxee

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bakul_original`
--

CREATE SCHEMA IF NOT EXISTS `bakul_original` DEFAULT CHARACTER SET utf8 ;
USE `bakul_original` ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` char(5) NOT NULL,
  `nama_karyawan` varchar(30) DEFAULT NULL,
  `jabatan` varchar(15) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `jabatan`, `alamat`) VALUES
('KA012', 'Janu Alfiyanto', 'Kasir', 'Secang'),
('KA066', 'Adrian Maulana', 'Kasir', 'Pucang'),
('KA075', 'Ali Affandi', 'Kasir', 'Tidar Krajan'),
('KA099', 'Muhammad Riyan', 'Admin Gudang', 'Secang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` char(4) NOT NULL,
  `jenis_barang` varchar(20) DEFAULT NULL,
  `brand` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `jenis_barang`, `brand`) VALUES
('BP80', 'Tas', 'Vans'),
('HD66', 'Hoodie', 'Thraser'),
('JT80', 'Jam Tangan', 'Vans'),
('KK59', 'Kaus Kaki', 'Vans'),
('SB77', 'Sabuk', 'Vans'),
('SD90', 'Sandal', 'Nike'),
('SP55', 'Sepatu', 'Vans'),
('SP56', 'Sepatu', 'Converse'),
('TP03', 'Topi', 'Converse'),
('WB75', 'Tas Slempang', 'Abslt Unscrd'),
('ZH88', 'Zip Hoodie', 'Vans');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(10) NOT NULL,
  `nama_pelanggan` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `no_telp`) VALUES
(145123, 'Zidan', 'Salam Kanci', '628863882511'),
(145679, 'Chika', 'Salatiga', '628532766708'),
(145777, 'Papio', 'Salaman', '628973892656');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` char(7) NOT NULL,
  `nama_produk` varchar(35) DEFAULT NULL,
  `id_kategori` char(4) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `id_suplier` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `id_kategori`, `stok`, `harga`, `id_suplier`) VALUES
('AB00769', 'ABSLT UNSCRD Waist Bag', 'WB75', 3, 145000, '001566'),
('CO00847', 'Converse All Star High 70S', 'SP56', 2, 2750000, '009952'),
('NI05811', 'Nike Slide Black Logo', 'SD90', 9, 150000, '000853'),
('TH09788', 'Thraser Hoodie Flame', 'HD66', 1, 699000, '006890'),
('VA07100', 'Sock Vans', 'KK59', 11, 140000, '005389'),
('VA07543', 'Vans Belt Checkerboard', 'SB77', 1, 199000, '005389'),
('VA07665', 'Vans Backpack Logo Skate Board', 'BP80', 2, 399000, '005389'),
('VA07870', 'Vans Old Skool', 'SP55', 5, 1399000, '005389'),
('VA07876', 'Vans Logo Zip Hoodie', 'ZH88', 4, 610000, '005389'),
('VA07893', 'Vans Slip On Checkerboard', 'SP55', 3, 1599000, '005389');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suplier`
--

CREATE TABLE `suplier` (
  `id_suplier` char(6) NOT NULL,
  `vendor` varchar(30) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp` varchar(11) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `suplier`
--

INSERT INTO `suplier` (`id_suplier`, `vendor`, `alamat`, `no_telp`, `email`) VALUES
('000853', 'NIKE.CO', 'Surabaya', '02188956890', 'nikeofficial@gmail.com'),
('001566', 'ABSLT.CO', 'Magelang', '02180536111', 'absltunscrd@gmail.com'),
('005389', 'VANS.CO', 'Jakarta', '02176936790', 'vansofficial@gmail.com'),
('006890', 'THRASER.CO', 'Yogyakarta', '02177736088', 'thraserofficial@gmail.com'),
('009952', 'CONVERSE.CO', 'Jakarta', '02128536875', 'converseoriginal@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_order` char(10) NOT NULL,
  `id_karyawan` char(5) DEFAULT NULL,
  `id_pelanggan` int(10) DEFAULT NULL,
  `id_produk` char(7) DEFAULT NULL,
  `tgl_order` date DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `pembayaran` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_order`, `id_karyawan`, `id_pelanggan`, `id_produk`, `tgl_order`, `jumlah`, `total_harga`, `pembayaran`) VALUES
('0067666321', 'KA012', 145777, 'CO00847', '2020-11-02', 1, 2750000, 'cash'),
('0067812111', 'KA066', 145679, 'VA07870', '2020-12-17', 1, 1399000, 'credit card'),
('0067812112', 'KA075', 145123, 'AB00769', '2020-12-17', 2, 290000, 'cash'),
('0067812679', 'KA075', 145123, 'VA07543', '2020-12-13', 1, 199000, 'cash'),
('0067812777', 'KA066', 145679, 'VA07100', '2020-12-13', 1, 140000, 'credit card');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `fk_id_kategori_idx` (`id_kategori`),
  ADD KEY `fk_id_suplier_idx` (`id_suplier`);

--
-- Indeks untuk tabel `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`id_suplier`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `fk_id_karyawan_idx` (`id_karyawan`),
  ADD KEY `fk_id_pelanggan_idx` (`id_pelanggan`),
  ADD KEY `fk_id_produk_idx` (`id_produk`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_suplier` FOREIGN KEY (`id_suplier`) REFERENCES `suplier` (`id_suplier`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_id_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
