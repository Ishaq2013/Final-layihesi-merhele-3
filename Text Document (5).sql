create database final_layihesi;

create table activities (
  id       serial      primary key,
  name     varchar(50) not null,
  category varchar(50) not null
);

create table companions (
  id   serial      primary key,
  name varchar(50) not null unique
);

create table responses (
  id             serial 	  primary key,
  personal_name  integer      not null references personal_info(id),
  age            integer      not null check (age between 6 and 18),
  grade          integer      not null check (grade between 1 and 11),
  free_day       varchar(20)  not null check (free_day in('Bazar ertəsi', 'Çərşənbə axşamı', 'Çərşənbə', 'Cümə axşamı', 'Cümə', 'Şənbə', 'Bazar','Hər gün')),
  activity_id    integer      not null references activities(id),
  companion_id   integer      not null references companions(id),
  hours_per_day  numeric(3,1) not null check (hours_per_day between 0 and 12),
  satisfaction   integer      not null check (satisfaction between 0 and 10),
  created_at     timestamp    default now()
);

create table personal_info (
  id    serial      primary key,
  name  varchar(20) unique,
  email varchar(30) unique not null check (email like'%@%')
);

select * from responses;
select * from activities;
select * from companions;
select * from personal_info;

drop table responses cascade;
drop table personal_info cascade;
drop table activities cascade;
drop table companions cascade;

delete from responses r cascade;
delete from activities a cascade;
delete from companions c cascade;
delete from personal_info p cascade;

--Responses
INSERT INTO responses (personal_name, age, grade, free_day, activity_id, companion_id, hours_per_day, satisfaction, created_at) VALUES
(14, 15, 9, 'Çərşənbə axşamı', 14, 6, 7.0, 9, '2026-11-01 09:05:33.307'),
(3, 15, 9, 'Hər gün', 3, 2, 3.2, 7, '2026-11-01 10:27:51.638'),
(19, 13, 7, 'Bazar', 19, 6, 6.7, 7, '2026-11-01 11:33:45.872'),
(7, 13, 7, 'Bazar ertəsi', 7, 6, 7.2, 8, '2026-11-01 13:14:36.905'),
(1, 8, 2, 'Bazar', 1, 6, 2.4, 8, '2026-11-01 14:08:19.456'),
(12, 16, 10, 'Bazar', 12, 7, 3.5, 6, '2026-11-01 15:55:12.774'),
(8, 6, 1, 'Çərşənbə', 8, 2, 2.1, 9, '2026-11-01 16:47:16.670'),
(20, 14, 8, 'Çərşənbə', 20, 7, 2.2, 6, '2026-11-01 18:21:47.183'),
(5, 17, 11, 'Çərşənbə axşamı', 5, 1, 6.3, 6, '2026-11-01 19:05:41.219'),
(16, 9, 4, 'Hər gün', 16, 4, 1.5, 5, '2026-11-02 08:29:08.854'),
(2, 12, 6, 'Cümə', 2, 6, 5.6, 9, '2026-11-02 08:42:03.291'),
(10, 11, 5, 'Hər gün', 10, 4, 5.4, 8, '2026-11-02 09:39:05.764'),
(11, 12, 6, 'Şənbə', 11, 6, 6.8, 10, '2026-11-02 10:48:09.562'),
(17, 16, 10, 'Şənbə', 17, 6, 5.3, 9, '2026-11-02 11:14:55.368'),
(9, 14, 8, 'Cümə', 9, 6, 4.8, 7, '2026-11-02 12:33:28.941'),
(15, 10, 5, 'Bazar ertəsi', 15, 1, 4.3, 8, '2026-11-02 14:12:55.328'),
(13, 8, 3, 'Cümə', 13, 2, 2.9, 7, '2026-11-02 15:08:54.126'),
(18, 7, 1, 'Cümə axşamı', 18, 2, 3.0, 8, '2026-11-02 16:02:54.981'),
(4, 9, 3, 'Şənbə', 4, 6, 4.1, 10, '2026-11-02 17:25:33.714'),
(6, 7, 2, 'Cümə axşamı', 6, 4, 1.7, 5, '2026-11-02 18:41:08.257'),
(15, 10, 5, 'Çərşənbə axşamı', 27, 6, 6.2, 8, '2026-11-03 08:33:12.482'),
(9, 14, 8, 'Hər gün', 29, 2, 5.1, 10, '2026-11-03 09:57:28.915'),
(1, 8, 2, 'Hər gün', 22, 6, 7.4, 10, '2026-11-03 11:17:06.829'),
(20, 14, 8, 'Cümə', 28, 7, 4.1, 7, '2026-11-03 12:36:42.573'),
(11, 12, 6, 'Bazar', 12, 7, 3.5, 6, '2026-11-03 13:52:17.853'),
(3, 15, 9, 'Bazar ertəsi', 23, 2, 1.8, 7, '2026-11-03 14:48:19.306'),
(12, 16, 10, 'Hər gün', 29, 2, 5.1, 10, '2026-11-03 16:44:30.678'),
(7, 13, 7, 'Cümə', 21, 4, 4.9, 9, '2026-11-03 18:19:06.942'),
(17, 16, 10, 'Bazar ertəsi', 30, 6, 7.7, 6, '2026-11-03 20:11:19.587'),
(8, 6, 1, 'Çərşənbə axşamı', 27, 6, 6.2, 8, '2026-11-04 08:29:08.854'),
(15, 10, 5, 'Hər gün', 5, 6, 5.5, 8, '2026-11-04 09:53:37.146'),
(9, 14, 8, 'Cümə axşamı', 2, 1, 2.6, 5, '2026-11-04 11:16:22.793'),
(1, 8, 2, 'Şənbə', 12, 5, 1.6, 9, '2026-11-04 12:38:04.512'),
(20, 14, 8, 'Çərşənbə axşamı', 15, 4, 3.2, 6, '2026-11-04 14:22:59.387'),
(11, 12, 6, 'Hər gün', 11, 6, 6.5, 5, '2026-11-04 15:47:13.265'),
(3, 15, 9, 'Cümə axşamı', 25, 6, 3.7, 5, '2026-11-04 17:03:48.901'),
(12, 16, 10, 'Cümə axşamı', 17, 6, 2.8, 7, '2026-11-04 19:11:27.634'),
(7, 13, 7, 'Hər gün', 18, 8, 6.4, 8, '2026-11-05 08:29:55.178'),
(17, 16, 10, 'Bazar', 13, 1, 5.2, 7, '2026-11-05 09:54:31.442'),
(8, 6, 1, 'Cümə', 14, 6, 7.3, 8, '2026-11-05 11:17:06.829'),
(2, 12, 6, 'Hər gün', 22, 6, 7.4, 10, '2026-11-05 12:36:42.573'),
(10, 11, 5, 'Bazar', 19, 6, 6.7, 7, '2026-11-05 14:48:19.306'),
(16, 9, 4, 'Bazar', 4, 2, 6.0, 7, '2026-11-05 16:02:54.981'),
(6, 7, 2, 'Bazar', 4, 2, 6.0, 7, '2026-11-05 17:25:33.714'),
(19, 13, 7, 'Bazar ertəsi', 23, 2, 1.8, 7, '2026-11-05 18:41:08.257'),
(15, 10, 5, 'Şənbə', 19, 3, 5.0, 10, '2026-11-05 20:09:47.639'),
(9, 14, 8, 'Bazar', 20, 9, 1.4, 6, '2026-11-06 08:33:12.482'),
(1, 8, 2, 'Çərşənbə axşamı', 5, 1, 6.3, 6, '2026-11-06 09:57:28.915'),
(20, 14, 8, 'Cümə axşamı', 8, 2, 2.1, 9, '2026-11-06 11:14:55.368'),
(15, 10, 5, 'Bazar', 26, 4, 2.0, 9, '2026-11-06 12:46:21.704');
-- Activities
INSERT INTO activities (name, category) VALUES
('Futbol oynamaq', 'İdman və Fiziki Fəaliyyət'),
('Python öyrənmək', 'Texnologiya və Proqramlaşdırma'),
('Kitab oxumaq', 'Oxumaq və Özünüinkişaf'),
('Şahmat oynamaq', 'İntellektual və Strategiya Oyunları'),
('Gitara çalmaq', 'Musiqi'),
('Valorant oynamaq', 'Kiberidman və Videooyunlar'),
('Lego ilə konstruksiya yığmaq', 'Əl İşləri və Konstruktorlar (DIY)'),
('Basketbol oynamaq', 'İdman və Fiziki Fəaliyyət'),
('İngilis dili öyrənmək', 'Dil Öyrənmə'),
('Photoshop-da şəkil düzəltmək', 'Rəqəmsal Dizayn və Qrafika'),
('Sudoku həll etmək', 'İntellektual və Strategiya Oyunları'),
('Qaçış etmək', 'İdman və Fiziki Fəaliyyət'),
('Məqalə oxumaq', 'Oxumaq və Özünüinkişaf'),
('Minecraft oynamaq', 'Kiberidman və Videooyunlar'),
('Rəsm çəkmək', 'Əl İşləri və Konstruktorlar (DIY)'),
('Piano çalmaq', 'Musiqi'),
('Elm təcrübələri aparmaq', 'Elm və Tədqiqat'),
('Web sayt hazırlamaq', 'Texnologiya və Proqramlaşdırma'),
('Üzgüçülük', 'İdman və Fiziki Fəaliyyət'),
('Canva-da poster hazırlamaq', 'Rəqəmsal Dizayn və Qrafika'),
('Strategiya oyunları oynamaq', 'İntellektual və Strategiya Oyunları'),
('Özünü inkişaf videoları izləmək', 'Oxumaq və Özünüinkişaf'),
('Rus dili öyrənmək', 'Dil Öyrənmə'),
('Riyaziyyat məsələləri həll etmək', 'Elm və Tədqiqat'),
('Voleybol oynamaq', 'İdman və Fiziki Fəaliyyət'),
('Əl işi hazırlamaq', 'Əl İşləri və Konstruktorlar (DIY)'),
('FIFA oynamaq', 'Kiberidman və Videooyunlar'),
('Jurnal oxumaq', 'Oxumaq və Özünüinkişaf'),
('Mahnı oxumaq', 'Musiqi'),
('Təbiət haqqında araşdırma etmək', 'Elm və Tədqiqat');
-- Companions
INSERT INTO companions (name) VALUES
('Tək'),
('Qardaşım'),
('Bacım'),
('Anam'),
('Atam'),
('Dostum'),
('Sinif yoldaşım'),
('Qohumum'),
('Müəllimim');
--Pesonal info
INSERT INTO personal_info (name, email) VALUES
('Aysel', 'aysel@gmail.com'),
('Elvin', 'elvin@outlook.com'),
('Nigar', 'nigar@yahoo.com'),
('Rəşad', 'rashad@proton.me'),
('Leyla', 'leyla@yandex.com'),
('Kamran', 'kamran@icloud.com'),
('Səbinə', 'sabina@zoho.com'),
('Tural', 'tural@aol.com'),
('Aynur', 'aynur@mail.ru'),
('Fərid', 'farid@tuta.com'),
('Günel', 'gunel@gmx.com'),
('Orxan', 'orxan@fastmail.com'),
('Nərgiz', 'nargiz@mailbox.org'),
('Vüsal', 'vusal@rambler.ru'),
('Amina', 'amina@hotmail.com'),
('İlkin', 'ilkin@protonmail.com'),
('Sevinc', 'sevinc@yandex.ru'),
('Rauf', 'rauf@live.com'),
('Lalə', 'lale@bk.ru'),
('Elçin', 'elcin@tutanota.com');
