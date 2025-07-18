create database DBRentalMobil;

create table TBMobil (
    KodeMobil int not null primary key,
    NamaMobil varchar(50),
    JenisMobil varchar(50),
    HargaSewa int,
    StatusMobil varchar(50)
);

select * from TBMobil

insert into TBMobil (KodeMobil, NamaMobil, JenisMobil, HargaSewa, StatusMobil)
values (101, 'Toyota Avanza', 'MPV', 400000, 'Tersedia');
insert into TBMobil (KodeMobil, NamaMobil, JenisMobil, HargaSewa, StatusMobil)
values (102, 'Honda Brio', 'Hatchback', 300000, 'Tersedia');
insert into TBMobil (KodeMobil, NamaMobil, JenisMobil, HargaSewa, StatusMobil)
values (103, 'Suzuki Ertiga', 'MPV', 350000, 'Disewa');
insert into TBMobil (KodeMobil, NamaMobil, JenisMobil, HargaSewa, StatusMobil)
values (104, 'Daihatsu Xenia', 'MPV', 380000, 'Tersedia');
insert into TBMobil (KodeMobil, NamaMobil, JenisMobil, HargaSewa, StatusMobil)
values (105, 'Mitsubishi Xpander', 'MPV', 450000, 'Disewa');

select * from TBTransaksi

create table TBTransaksi (
    KodeTransaksi int not null primary key,
    KodeMobil int,
    NamaPenyewa varchar(50),
    LamaSewa int,
    TotalBayar int
   
);


insert into TBTransaksi (KodeTransaksi, KodeMobil, NamaPenyewa, LamaSewa, TotalBayar)
values (201, 103, 'Aliffa', 2, 700000);
insert into TBTransaksi (KodeTransaksi, KodeMobil, NamaPenyewa, LamaSewa, TotalBayar)
values (202, 105, 'Elisa', 3, 1370000);
insert into TBTransaksi (KodeTransaksi, KodeMobil, NamaPenyewa, LamaSewa, TotalBayar)
values (203, 102, 'Fika', 1, 300000);
insert into TBTransaksi (KodeTransaksi, KodeMobil, NamaPenyewa, LamaSewa, TotalBayar)
values (204, 101, 'Demalyana', 4, 1600000);
insert into TBTransaksi (KodeTransaksi, KodeMobil, NamaPenyewa, LamaSewa, TotalBayar)
values (205, 104, 'Triandini', 2, 760000);

alter table TBMobil add TahunProduksi int;
alter table TBTransaksi add Diskon int;

update TBMobil set TahunProduksi = 2022 where KodeMobil = 101;
update TBMobil set TahunProduksi = 2021 where KodeMobil = 102;
update TBMobil set TahunProduksi = 2022 where KodeMobil = 103;
update TBMobil set TahunProduksi = 2020 where KodeMobil = 104;
update TBMobil set TahunProduksi = 2023 where KodeMobil = 105;

update TBTransaksi set Diskon = 0 where KodeTransaksi in (201, 203, 205);
update TBTransaksi set Diskon = 100000 where KodeTransaksi in (202, 204);

update TBMobil set StatusMobil = 'Disewa' where KodeMobil = 101;

update TBMobil set HargaSewa = 420000 where KodeMobil = 104;

UPDATE TBMobil
SET StatusMobil = 'Disewa'
WHERE KodeMobil = 102;

select * from TBMobil where KodeMobil = 102;

alter table TBTransaksi
add constraint fk_mobil foreign key (KodeMobil) references TBMobil(KodeMobil);

select avg(HargaSewa) from TBMobil;
select sum(TotalBayar) from TBTransaksi;

select KodeMobil, HargaSewa, HargaSewa + 50000 from TBMobil;
select KodeTransaksi, TotalBayar - Diskon from TBTransaksi;

create user TimRental with password '1234';
grant all on TBMobil to TimRental;
revoke all on TBMobil from TimRental; 

SELECT 
    T.KodeTransaksi,
    T.NamaPenyewa,
    M.NamaMobil,
    M.JenisMobil,
    T.LamaSewa,
    T.TotalBayar
FROM TBTransaksi T
INNER JOIN TBMobil M ON T.KodeMobil = M.KodeMobil;

SELECT 
    T.KodeTransaksi,
    T.NamaPenyewa,
    M.NamaMobil,
    M.JenisMobil,
    T.LamaSewa,
    T.TotalBayar
FROM TBTransaksi T
LEFT JOIN TBMobil M ON T.KodeMobil = M.KodeMobil;

SELECT 
    M.KodeMobil,
    M.NamaMobil,
    T.NamaPenyewa,
    T.LamaSewa,
    T.TotalBayar
FROM TBTransaksi T
RIGHT JOIN TBMobil M ON T.KodeMobil = M.KodeMobil;

SELECT 
    M.KodeMobil,
    M.NamaMobil,
    T.KodeTransaksi,
    T.NamaPenyewa
FROM TBMobil M
CROSS JOIN TBTransaksi T;


