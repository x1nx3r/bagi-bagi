-- Create anggota table with its own attributes and primary key
CREATE TABLE anggota
(
    idAnggota CHAR(10) NOT NULL,
    namaAnggota VARCHAR(25) NOT NULL,
    npm VARCHAR(13) NOT NULL,
    alamatAnggota VARCHAR(50) NOT NULL,
    noTelepon VARCHAR(15) NOT NULL,
    idJurusan CHAR(10) NOT NULL,
    CONSTRAINT anggota_pk PRIMARY KEY (idAnggota)
);

-- Create jurusan table with its own attributes and primary key
CREATE TABLE jurusan
(
    idJurusan CHAR(10) NOT NULL,
    namaJurusan VARCHAR(25) NOT NULL,
    CONSTRAINT jurusan_pk PRIMARY KEY (idJurusan)
);

-- Create peminjam table with its own attributes and primary key
CREATE TABLE peminjam
(
    idPeminjam CHAR(10) NOT NULL,
    tglPinjam DATE NOT NULL,
    tglKembali DATE NOT NULL,
    denda INT NOT NULL,
    idBuku CHAR(10) NOT NULL,
    jumlahPinjam INT NOT NULL,
    idAnggota CHAR(10) NOT NULL,
    CONSTRAINT peminjam_pk PRIMARY KEY (idPeminjam)
);

-- Create buku table with its own attributes and primary key
CREATE TABLE buku
(
    idBuku CHAR(10) NOT NULL,
    judulBuku VARCHAR(25) NOT NULL,
    tahunTerbit VARCHAR(13) NOT NULL,
    jumlahBukuTersedia INT NOT NULL,
    idPenerbit CHAR(10) NOT NULL,
    idKategori CHAR(10) NOT NULL,
    CONSTRAINT buku_pk PRIMARY KEY (idBuku)
);

-- Create kategoribuku table with its own attributes and primary key
CREATE TABLE kategoribuku
(
    idKategori CHAR(10) NOT NULL,
    kategori VARCHAR(25) NOT NULL,
    CONSTRAINT kategoribuku_pk PRIMARY KEY (idKategori)
);

-- Create suplaibuku table with its own attributes and primary key
CREATE TABLE suplaibuku
(
    idSuplai CHAR(10) NOT NULL,
    idBuku CHAR(10) NOT NULL,
    tanggal DATE NOT NULL,
    jumlah INT NOT NULL,
    CONSTRAINT suplaibuku_pk PRIMARY KEY (idSuplai)
);

-- Create penerbit table with its own attributes and primary key
CREATE TABLE penerbit
(
    idPenerbit CHAR(10) NOT NULL,
    namaPenerbit CHAR (50) NOT NULL,
    lokasiPenerbit CHAR (50) NOT NULL,
    CONSTRAINT penerbit_pk PRIMARY KEY (idPenerbit)
);

-- Add foreign key constraints using ALTER TABLE statements
ALTER TABLE anggota
ADD CONSTRAINT fk_anggota_jurusan FOREIGN KEY (idJurusan) REFERENCES jurusan(idJurusan);

ALTER TABLE peminjam
ADD CONSTRAINT fk_peminjam_anggota FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota);

ALTER TABLE peminjam
ADD CONSTRAINT fk_peminjam_buku FOREIGN KEY (idBuku) REFERENCES buku(idBuku);

ALTER TABLE buku
ADD CONSTRAINT fk_buku_penerbit FOREIGN KEY (idPenerbit) REFERENCES penerbit(idPenerbit);

ALTER TABLE buku
ADD CONSTRAINT fk_buku_kategori FOREIGN KEY (idKategori) REFERENCES kategoribuku(idKategori);

ALTER TABLE suplaibuku
ADD CONSTRAINT fk_suplaibuku_buku FOREIGN KEY (idBuku) REFERENCES buku(idBuku);

ALTER TABLE TABLE_NAME
DROP CONSTRAINT CONSTRAINT_NAME;

-- Insert dummy data into the jurusan table
INSERT INTO jurusan (idJurusan, namaJurusan)
VALUES
    ('J001', 'Ilmu Komputer'),
    ('J002', 'Teknik Elektro'),
    ('J003', 'Teknik Mesin'),
    ('J004', 'Ilmu Hukum'),
    ('J005', 'Manajemen Bisnis'),
    ('J006', 'Sastra Indonesia'),
    ('J007', 'Ilmu Kesehatan'),
    ('J008', 'Sosiologi'),
    ('J009', 'Ilmu Kimia'),
    ('J010', 'Fisika');

-- Insert dummy data into the kategoribuku table
INSERT INTO kategoribuku (idKategori, kategori)
VALUES
    ('K001', 'Fiksi'),
    ('K002', 'Non-Fiksi'),
    ('K003', 'Sains'),
    ('K004', 'Sejarah'),
    ('K005', 'Teknologi'),
    ('K006', 'Biografi'),
    ('K007', 'Seni'),
    ('K008', 'Pendidikan'),
    ('K009', 'Agama'),
    ('K010', 'Olahraga');

-- Insert dummy data into the anggota table
INSERT INTO anggota (idAnggota, namaAnggota, npm, alamatAnggota, noTelepon, idJurusan)
VALUES
    ('A001', 'Adi Nugroho', '1234567890', 'Jl. Merdeka 123', '081234567890', 'J001'),
    ('A002', 'Budi Raharjo', '0987654321', 'Jl. Jenderal Sudirman 45', '081987654321', 'J002'),
    ('A003', 'Citra Wijaya', '1122334455', 'Jl. Surya Kencana 7', '0851122334455', 'J003'),
    ('A004', 'Dewi Lestari', '9876543210', 'Jl. Cempaka 56', '081234567890', 'J001'),
    ('A005', 'Eko Prasetyo', '5678901234', 'Jl. Pahlawan 89', '0855678901234', 'J004'),
    ('A006', 'Fita Susanti', '1112223334', 'Jl. Teratai 12', '0811112223334', 'J005'),
    ('A007', 'Gunawan Setiawan', '5556667778', 'Jl. Merpati 34', '0815556667778', 'J006'),
    ('A008', 'Hari Wibowo', '1122334456', 'Jl. Raya 1', '0851122334456', 'J007'),
    ('A009', 'Ika Purnama', '1231231230', 'Jl. Sari 5', '0811231231230', 'J008'),
    ('A010', 'Joko Susanto', '4445556667', 'Jl. Sinar 78', '0814445556667', 'J009'),
    ('A011', 'Krisna Surya', '9090909090', 'Jl. Sakti 23', '0859090909090', 'J010'),
    ('A012', 'Lia Permata', '7778889990', 'Jl. Gunung 90', '0817778889990', 'J001'),
    ('A013', 'Mulyono Budiman', '3334445556', 'Jl. Indah 45', '0853334445556', 'J002'),
    ('A014', 'Nia Putri', '2223334445', 'Jl. Maju 67', '0812223334445', 'J003'),
    ('A015', 'Oscar Tirta', '6667778889', 'Jl. Jaya 32', '0816667778889', 'J004'),
    ('A016', 'Prita Kusuma', '8889990001', 'Jl. Harapan 78', '0858889990001', 'J005'),
    ('A017', 'Qori Hasan', '5556667779', 'Jl. Sejahtera 5', '0815556667779', 'J006'),
    ('A018', 'Rizki Saputra', '6667778880', 'Jl. Damai 90', '0816667778880', 'J007'),
    ('A019', 'Siti Rahayu', '8889990002', 'Jl. Sukses 12', '0858889990002', 'J008'),
    ('A020', 'Tono Nugroho', '7778889991', 'Jl. Terang 3', '0817778889991', 'J009');

-- Insert dummy data into the buku table
INSERT INTO buku (idBuku, judulBuku, tahunTerbit, jumlahBukuTersedia, idPenerbit, idKategori)
VALUES
    ('B001', 'Matahari Terbit', '2000', 15, 'P001', 'K001'),
    ('B002', 'Panduan Belajar Fisika', '2015', 8, 'P002', 'K002'),
    ('B003', 'Sejarah Indonesia', '1995', 12, 'P003', 'K004'),
    ('B004', 'Pengantar Hukum', '2010', 10, 'P004', 'K008'),
    ('B005', 'Manajemen Keuangan', '2021', 20, 'P005', 'K005'),
    ('B006', 'Seni Lukis Indonesia', '2019', 7, 'P006', 'K007'),
    ('B007', 'Kimia Dasar', '2018', 9, 'P007', 'K009'),
    ('B008', 'Pendidikan Anak', '2005', 6, 'P008', 'K008'),
    ('B009', 'Biografi Soekarno', '1998', 5, 'P009', 'K006'),
    ('B010', 'Olahraga Sepak Bola', '2012', 10, 'P010', 'K010'),
    ('B011', 'Teknologi Komputer', '2020', 18, 'P001', 'K005'),
    ('B012', 'Cerita Rakyat Jawa', '2002', 11, 'P003', 'K004'),
    ('B013', 'Hidup Sehat', '2014', 14, 'P007', 'K009'),
    ('B014', 'Manajemen Proyek', '2017', 13, 'P005', 'K005'),
    ('B015', 'Fisika Modern', '2016', 7, 'P002', 'K003'),
    ('B016', 'Sastra Indonesia Modern', '2011', 9, 'P006', 'K006'),
    ('B017', 'Buku Agama', '2007', 8, 'P008', 'K009'),
    ('B018', 'Kimia Organik', '2009', 6, 'P007', 'K009'),
    ('B019', 'Budaya Jawa', '2003', 7, 'P006', 'K007'),
    ('B020', 'Pengantar Sosiologi', '2001', 10, 'P008', 'K008');

-- Insert dummy data into the peminjam table
INSERT INTO peminjam (idPeminjam, tglPinjam, tglKembali, denda, idBuku, jumlahPinjam, idAnggota)
VALUES
    ('P001', '2023-09-01', '2023-09-15', 0, 'B001', 2, 'A001'),
    ('P002', '2023-09-02', '2023-09-16', 0, 'B002', 1, 'A002'),
    ('P003', '2023-09-03', '2023-09-17', 0, 'B003', 3, 'A003'),
    ('P004', '2023-09-04', '2023-09-18', 0, 'B004', 2, 'A004'),
    ('P005', '2023-09-05', '2023-09-19', 0, 'B005', 1, 'A005'),
    ('P006', '2023-09-06', '2023-09-20', 0, 'B006', 2, 'A006'),
    ('P007', '2023-09-07', '2023-09-21', 0, 'B007', 1, 'A007'),
    ('P008', '2023-09-08', '2023-09-22', 0, 'B008', 3, 'A008'),
    ('P009', '2023-09-09', '2023-09-23', 0, 'B009', 2, 'A009'),
    ('P010', '2023-09-10', '2023-09-24', 0, 'B010', 1, 'A010'),
    ('P011', '2023-09-11', '2023-09-25', 0, 'B011', 3, 'A011'),
    ('P012', '2023-09-12', '2023-09-26', 0, 'B012', 2, 'A012'),
    ('P013', '2023-09-13', '2023-09-27', 0, 'B013', 1, 'A013'),
    ('P014', '2023-09-14', '2023-09-28', 0, 'B014', 3, 'A014'),
    ('P015', '2023-09-15', '2023-09-29', 0, 'B015', 2, 'A015'),
    ('P016', '2023-09-16', '2023-09-30', 0, 'B016', 1, 'A016'),
    ('P017', '2023-09-17', '2023-10-01', 0, 'B017', 3, 'A017'),
    ('P018', '2023-09-18', '2023-10-02', 0, 'B018', 2, 'A018'),
    ('P019', '2023-09-19', '2023-10-03', 0, 'B019', 1, 'A019'),
    ('P020', '2023-09-20', '2023-10-04', 0, 'B020', 3, 'A020');

-- Insert dummy data into the suplaibuku table
INSERT INTO suplaibuku (idSuplai, idBuku, tanggal, jumlah)
VALUES
    ('S001', 'B001', '2023-08-15', 20),
    ('S002', 'B002', '2023-08-20', 10),
    ('S003', 'B003', '2023-08-25', 15),
    ('S004', 'B004', '2023-08-30', 18),
    ('S005', 'B005', '2023-09-05', 25),
    ('S006', 'B006', '2023-09-10', 12),
    ('S007', 'B007', '2023-09-15', 9),
    ('S008', 'B008', '2023-09-20', 14),
    ('S009', 'B009', '2023-09-25', 17),
    ('S010', 'B010', '2023-09-30', 10),
    ('S011', 'B011', '2023-10-05', 22),
    ('S012', 'B012', '2023-10-10', 13),
    ('S013', 'B013', '2023-10-15', 8),
    ('S014', 'B014', '2023-10-20', 16),
    ('S015', 'B015', '2023-10-25', 11),
    ('S016', 'B016', '2023-10-30', 7),
    ('S017', 'B017', '2023-11-05', 19),
    ('S018', 'B018', '2023-11-10', 12),
    ('S019', 'B019', '2023-11-15', 9),
    ('S020', 'B020', '2023-11-20', 15);

-- Insert dummy data into the penerbit table
INSERT INTO penerbit (idPenerbit, namaPenerbit, lokasiPenerbit)
VALUES
    ('P001', 'Penerbit A', 'Jakarta'),
    ('P002', 'Penerbit B', 'Bandung'),
    ('P003', 'Penerbit C', 'Surabaya'),
    ('P004', 'Penerbit D', 'Yogyakarta'),
    ('P005', 'Penerbit E', 'Semarang'),
    ('P006', 'Penerbit F', 'Malang'),
    ('P007', 'Penerbit G', 'Makassar'),
    ('P008', 'Penerbit H', 'Palembang'),
    ('P009', 'Penerbit I', 'Medan'),
    ('P010', 'Penerbit J', 'Denpasar'),
    ('P011', 'Penerbit K', 'Balikpapan'),
    ('P012', 'Penerbit L', 'Pekanbaru'),
    ('P013', 'Penerbit M', 'Manado'),
    ('P014', 'Penerbit N', 'Padang'),
    ('P015', 'Penerbit O', 'Banjarmasin'),
    ('P016', 'Penerbit P', 'Samarinda'),
    ('P017', 'Penerbit Q', 'Pontianak'),
    ('P018', 'Penerbit R', 'Ambon'),
    ('P019', 'Penerbit S', 'Jayapura'),
    ('P020', 'Penerbit T', 'Kupang');


ALTER TABLE anggota
ADD email VARCHAR(50);

ALTER TABLE penerbit
ADD CONSTRAINT penerbit_pk PRIMARY KEY (idPenerbit);

ALTER TABLE anggota
DROP COLUMN email;

ALTER TABLE anggota
DROP COLUMN email;

ALTER TABLE anggota
MODIFY alamatAnggota VARCHAR(100);

ALTER TABLE anggota
RENAME TO members;

UPDATE buku
SET judulBuku = 'New Title'
WHERE idBuku = 'BookID';

SELECT *
FROM buku
WHERE judulBuku = 'My SQL';

SELECT *
FROM buku
WHERE judulBuku LIKE 'R%';

SELECT b.*
FROM buku b
JOIN penerbit p ON b.idPenerbit = p.idPenerbit
WHERE LEFT(p.namaPenerbit, 1) = 'R';

SELECT buku.*
FROM buku
JOIN penerbit ON buku.idPenerbit = penerbit.idPenerbit
WHERE penerbit.namaPenerbit = 'Erlangga';


SELECT buku.*, penerbit.namaPenerbit
FROM buku
JOIN penerbit ON buku.idPenerbit = penerbit.idPenerbit
WHERE penerbit.namaPenerbit = 'Erlangga';


SELECT members.namaAnggota, peminjam.tglPinjam, peminjam.tglKembali
FROM members
JOIN peminjam ON members.idAnggota = peminjam.idAnggota
WHERE DATEDIFF(peminjam.tglKembali, peminjam.tglPinjam) > 13;

SELECT DISTINCT m1.namaAnggota, j.namaJurusan
FROM members m1
JOIN peminjam ON m1.idAnggota = peminjam.idAnggota
JOIN members m2 ON m1.idJurusan = m2.idJurusan
JOIN jurusan j ON m1.idJurusan = j.idJurusan
WHERE DATEDIFF(peminjam.tglKembali, peminjam.tglPinjam) > 7;

SELECT DISTINCT m.namaAnggota, b.judulBuku
FROM members m
JOIN peminjam p ON m.idAnggota = p.idAnggota
JOIN buku b ON p.idBuku = b.idBuku
WHERE DATEDIFF(p.tglKembali, p.tglPinjam) > 7;

SELECT COUNT(*) AS total_books
FROM books;

SELECT SUM(quantity) AS total_quantity
FROM orders;

SELECT AVG(price) AS average_price
FROM products;

SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employees;

SELECT jumlah, judulBuku
FROM suplaibuku
join buku on buku.idBuku = suplaibuku.idBuku;

select b.jumlah - 1 as stok_ready, b.jumlah as stok_total, m.judulBuku, f.namaAnggota
from suplaibuku b
join buku m ON m.idBuku = b.idBuku
join peminjam n on n.idBuku = m.idBuku
join members f on f.idAnggota = n.idAnggota
group by f.namaAnggota
order by f.namaAnggota asc;


SELECT AVG(b.jumlahBukuTersedia) AS rerata_stok, k.kategori
FROM buku b
JOIN kategoribuku k ON b.idKategori = k.idKategori
GROUP BY k.idKategori, k.kategori;

SELECT AVG(b.jumlahBukuTersedia) AS rerata_stok, k.namaKategori
FROM buku b
JOIN kategoribuku k ON b.idKategori = k.idKategori
GROUP BY k.idKategori, k.namaKategori
HAVING AVG(b.jumlahBukuTersedia) > 50;

SELECT CONCAT(namaPenerbit, ' ', lokasiPenerbit) AS penerbit_lengkap
FROM penerbit;

SELECT COUNT(m.idAnggota) AS rerata_anggota, j.namaJurusan
FROM members m
JOIN jurusan j ON m.idJurusan = j.idJurusan
GROUP BY j.idJurusan, j.namaJurusan
HAVING COUNT(m.idAnggota) > 5
ORDER BY rerata_anggota DESC;

SELECT COUNT(*) AS total_rows
FROM members;


INSERT INTO jurusan (idJurusan, namaJurusan)
VALUES
    ('J11', 'Ilmu Sihir'),
    ('J12', 'Ilmu Filsafat'),
    ('J13', 'Statistika Sains'),
    ('J14', 'Statistika Sosial'),
    ('J15', 'Kriminologi'),
    ('J16', 'Olahraga'),
    ('J17', 'Pendidikan Bimbingan Konseling'),
    ('J18', 'Pendidikan Guru SD'),
    ('J19', 'Pendidikan Akuntansi'),
    ('J20', 'Teknik perkeretaapian');




