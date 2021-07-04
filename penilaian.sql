/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     05/07/2021 01:22:26                          */
/*==============================================================*/


drop table if exists DOSEN;

drop table if exists MAHASISWA;

drop table if exists MATA_KULIAH;

drop table if exists PENILAIAN;

/*==============================================================*/
/* Table: DOSEN                                                 */
/*==============================================================*/
create table DOSEN
(
   KODE_DOSEN           int not null,
   NAMA_DOSEN           varchar(20),
   primary key (KODE_DOSEN)
);

/*==============================================================*/
/* Table: MAHASISWA                                             */
/*==============================================================*/
create table MAHASISWA
(
   NIM                  int not null,
   NAMA_MAHASISWA       char(20),
   ALAMAT               char(50),
   primary key (NIM)
);

/*==============================================================*/
/* Table: MATA_KULIAH                                           */
/*==============================================================*/
create table MATA_KULIAH
(
   SKS                  varchar(5),
   KODE_MK              int not null,
   NAMA_MK              varchar(25),
   primary key (KODE_MK)
);

/*==============================================================*/
/* Table: PENILAIAN                                             */
/*==============================================================*/
create table PENILAIAN
(
   TAHUN                date,
   SEMESTER             int not null,
   KODE_DOSEN           int,
   NIM                  int,
   KODE_MK              int,
   NILAI                varchar(2),
   primary key (SEMESTER)
);

alter table PENILAIAN add constraint FK_RELATIONSHIP_1 foreign key (KODE_DOSEN)
      references DOSEN (KODE_DOSEN) on delete restrict on update restrict;

alter table PENILAIAN add constraint FK_RELATIONSHIP_2 foreign key (KODE_MK)
      references MATA_KULIAH (KODE_MK) on delete restrict on update restrict;

alter table PENILAIAN add constraint FK_RELATIONSHIP_3 foreign key (NIM)
      references MAHASISWA (NIM) on delete restrict on update restrict;

