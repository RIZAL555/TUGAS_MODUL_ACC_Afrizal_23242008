CREATE TABLE `pelanggan` (
  `id_pelanggan` int PRIMARY KEY,
  `nama` varchar(255),
  `alamat` varchar(255),
  `id_nomor_tlp` int,
  `id_email` int
);

CREATE TABLE `obat` (
  `id_obat` int PRIMARY KEY,
  `nama` varchar(255),
  `id_kategori` int,
  `jumlah_stok` int,
  `tgl_kadaluarsa` date,
  `id_obat_a` int,
  `id_obat_b` int,
  `id_pelanggan` int,
  `id_supplier` int
);

CREATE TABLE `supplier` (
  `id_supplier` int PRIMARY KEY,
  `nama` varchar(255),
  `alamat` varchar(255),
  `id_nomor_tlp` int
);

CREATE TABLE `spr_id_obat` (
  `id_obat_a` int,
  `id_obat_b` int,
  PRIMARY KEY (`id_obat_a`, `id_obat_b`)
);

CREATE TABLE `nmr_tlp_plgn` (
  `id_nomor_tlp` int PRIMARY KEY,
  `nomor_1` int,
  `nomor_2` int
);

CREATE TABLE `email` (
  `id_email` int PRIMARY KEY,
  `email_1` varchar(255),
  `email_2` varchar(255)
);

CREATE TABLE `kategori` (
  `id_kategori` int PRIMARY KEY,
  `manfaat` varchar(255)
);

CREATE TABLE `nmr_tlp_supp` (
  `id_nomor_tlp` int PRIMARY KEY,
  `nomor_1` int,
  `nomor_2` int
);

ALTER TABLE `nmr_tlp_plgn` ADD FOREIGN KEY (`id_nomor_tlp`) REFERENCES `pelanggan` (`id_nomor_tlp`);

ALTER TABLE `email` ADD FOREIGN KEY (`id_email`) REFERENCES `pelanggan` (`id_email`);

ALTER TABLE `kategori` ADD FOREIGN KEY (`id_kategori`) REFERENCES `obat` (`id_kategori`);

ALTER TABLE `obat` ADD FOREIGN KEY (`id_obat_a`) REFERENCES `spr_id_obat` (`id_obat_a`);

ALTER TABLE `obat` ADD FOREIGN KEY (`id_obat_b`) REFERENCES `spr_id_obat` (`id_obat_b`);

ALTER TABLE `obat` ADD FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

ALTER TABLE `obat` ADD FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

ALTER TABLE `nmr_tlp_supp` ADD FOREIGN KEY (`id_nomor_tlp`) REFERENCES `supplier` (`id_nomor_tlp`);
