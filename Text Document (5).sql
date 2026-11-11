create database final_layihesi;

select * from responses;
select * from activities;
select * from companions;
select * from personal_info;

drop table responses;
drop table personal_info cascade;
drop table activities;
drop table companions;

delete from responses;
delete from activities;
delete from companions;
delete from personal_info;

--Reasponses
INSERT INTO responses (personal_name, personal_email, age, grade, free_day, activity_id, companion_id, hours_per_day, satisfaction, created_at) VALUES
(1, 'aysel@gmail.com', 8, 2, 'Bazar', 1, 6, 2.4, 8, '2026-11-01 09:15:22.104'),
(2, 'elvin@outlook.com', 12, 6, 'Cümə', 2, 6, 5.6, 9, '2026-11-01 11:33:45.872'),
(3, 'nigar@yahoo.com', 15, 9, 'Hər gün', 3, 2, 3.2, 7, '2026-11-01 14:08:19.456'),
(4, 'rashad@proton.me', 9, 3, 'Şənbə', 4, 6, 4.1, 10, '2026-11-02 08:42:03.291'),
(5, 'leyla@yandex.com', 17, 11, 'Çərşənbə axşamı', 5, 1, 6.3, 6, '2026-11-02 10:27:51.638'),
(6, 'kamran@icloud.com', 7, 2, 'Cümə axşamı', 6, 4, 1.7, 5, '2026-11-02 13:14:36.905'),
(7, 'sabina@zoho.com', 13, 7, 'Bazar ertəsi', 7, 6, 7.2, 8, '2026-11-02 15:55:12.774'),
(8, 'tural@aol.com', 6, 1, 'Çərşənbə', 8, 2, 2.1, 9, '2026-11-02 18:21:47.183'),
(9, 'aynur@mail.ru', 14, 8, 'Cümə', 9, 6, 4.8, 7, '2026-11-03 09:05:33.307'),
(10, 'farid@tuta.com', 11, 5, 'Hər gün', 10, 4, 5.4, 8, '2026-11-03 10:48:09.562'),
(11, 'gunel@gmx.com', 12, 6, 'Şənbə', 11, 6, 6.8, 10, '2026-11-03 12:33:28.941'),
(12, 'orxan@fastmail.com', 16, 10, 'Bazar', 12, 7, 3.5, 6, '2026-11-03 14:12:55.328'),
(13, 'nargiz@mailbox.org', 8, 3, 'Cümə', 13, 2, 2.9, 7, '2026-11-03 16:47:16.670'),
(14, 'vusal@rambler.ru', 15, 9, 'Çərşənbə axşamı', 14, 6, 7.0, 9, '2026-11-03 19:05:41.219'),
(15, 'amina@hotmail.com', 10, 5, 'Bazar ertəsi', 15, 1, 4.3, 8, '2026-11-04 08:29:08.854'),
(16, 'ilkin@protonmail.com', 9, 4, 'Hər gün', 16, 4, 1.5, 5, '2026-11-04 09:53:37.146'),
(17, 'sevinc@yandex.ru', 16, 10, 'Şənbə', 17, 6, 5.3, 9, '2026-11-04 11:16:22.793'),
(18, 'rauf@live.com', 7, 1, 'Cümə axşamı', 18, 2, 3.0, 8, '2026-11-04 12:38:04.512'),
(19, 'lale@bk.ru', 13, 7, 'Bazar', 19, 6, 6.7, 7, '2026-11-04 14:22:59.387'),
(20, 'elcin@tutanota.com', 14, 8, 'Çərşənbə', 20, 7, 2.2, 6, '2026-11-04 15:47:13.265'),
(21, 'zehra@gmx.de', 11, 5, 'Cümə', 21, 4, 4.9, 9, '2026-11-04 17:03:48.901'),
(22, 'murad@inbox.ru', 12, 6, 'Hər gün', 22, 6, 7.4, 10, '2026-11-04 19:11:27.634'),
(23, 'züleyxa@list.ru', 8, 2, 'Bazar ertəsi', 23, 2, 1.8, 7, '2026-11-05 08:29:55.178'),
(24, 'samir@gmail.com', 17, 11, 'Şənbə', 24, 1, 5.6, 8, '2026-11-05 09:54:31.442'),
(25, 'aygun@outlook.com', 15, 9, 'Cümə axşamı', 25, 6, 3.7, 5, '2026-11-05 11:17:06.829'),
(26, 'cavid@yahoo.com', 6, 1, 'Bazar', 26, 4, 2.0, 9, '2026-11-05 12:36:42.573'),
(27, 'fidan@proton.me', 10, 5, 'Çərşənbə axşamı', 27, 6, 6.2, 8, '2026-11-05 14:48:19.306'),
(28, 'hesen@yandex.com', 13, 7, 'Cümə', 28, 7, 4.1, 7, '2026-11-05 16:02:54.981'),
(29, 'konul@icloud.com', 9, 3, 'Hər gün', 29, 2, 5.1, 10, '2026-11-05 17:25:33.714'),
(30, 'ramil@zoho.com', 16, 10, 'Bazar ertəsi', 30, 6, 7.7, 6, '2026-11-05 18:41:08.257'),
(31, 'saida@aol.com', 11, 5, 'Şənbə', 1, 4, 3.4, 8, '2026-11-05 20:09:47.639'),
(32, 'ulvi@mail.ru', 14, 8, 'Cümə axşamı', 2, 1, 2.6, 5, '2026-11-06 08:33:12.482'),
(33, 'ayan@tuta.com', 8, 3, 'Çərşənbə', 3, 6, 4.4, 9, '2026-11-06 09:57:28.915'),
(34, 'elshan@gmx.com', 12, 6, 'Bazar', 4, 2, 6.0, 7, '2026-11-06 11:14:55.368'),
(35, 'gulnar@fastmail.com', 17, 11, 'Hər gün', 5, 6, 5.5, 8, '2026-11-06 12:46:21.704'),
(36, 'kenan@mailbox.org', 7, 2, 'Cümə', 6, 4, 1.3, 6, '2026-11-06 14:22:37.159'),
(37, 'narmin@rambler.ru', 15, 9, 'Şənbə', 7, 7, 7.1, 9, '2026-11-06 15:58:04.823'),
(38, 'parviz@hotmail.com', 10, 4, 'Bazar ertəsi', 8, 3, 3.8, 7, '2026-11-06 17:31:49.246'),
(39, 'rena@protonmail.com', 9, 3, 'Cümə axşamı', 9, 6, 2.5, 10, '2026-11-06 18:07:16.592'),
(40, 'terlan@yandex.ru', 16, 10, 'Çərşənbə', 10, 2, 4.7, 8, '2026-11-06 19:43:52.037'),
(41, 'ulker@live.com', 13, 7, 'Hər gün', 11, 6, 6.5, 5, '2026-11-06 21:16:28.481'),
(42, 'vafa@bk.ru', 6, 1, 'Şənbə', 12, 5, 1.6, 9, '2026-11-07 09:39:05.764'),
(43, 'xayal@tutanota.com', 14, 8, 'Bazar', 13, 1, 5.2, 7, '2026-11-07 11:25:41.309'),
(44, 'yusif@gmx.de', 11, 5, 'Cümə', 14, 6, 7.3, 8, '2026-11-07 13:52:17.853'),
(45, 'zaur@inbox.ru', 12, 6, 'Çərşənbə axşamı', 15, 4, 3.2, 6, '2026-11-07 15:08:54.126'),
(46, 'aylin@list.ru', 8, 2, 'Bazar ertəsi', 16, 2, 4.0, 9, '2026-11-07 16:44:30.678'),
(47, 'bakhtiyar@gmail.com', 17, 11, 'Cümə axşamı', 17, 6, 2.8, 7, '2026-11-07 18:19:06.942'),
(48, 'jamila@outlook.com', 15, 9, 'Hər gün', 18, 8, 6.4, 8, '2026-11-07 19:35:43.215'),
(49, 'deniz@yahoo.com', 10, 5, 'Şənbə', 19, 3, 5.0, 10, '2026-11-07 20:11:19.587'),
(50, 'elnur@proton.me', 9, 4, 'Bazar', 20, 9, 1.4, 6, '2026-11-07 21:27:56.360');
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
--pesonıar info
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
('Elçin', 'elcin@tutanota.com'),
('Zəhra', 'zehra@gmx.de'),
('Murad', 'murad@inbox.ru'),
('Züleyxa', 'züleyxa@list.ru'),
('Samir', 'samir@gmail.com'),
('Aygün', 'aygun@outlook.com'),
('Cavid', 'cavid@yahoo.com'),
('Fidan', 'fidan@proton.me'),
('Həsən', 'hesen@yandex.com'),
('Könül', 'konul@icloud.com'),
('Ramil', 'ramil@zoho.com'),
('Səidə', 'saida@aol.com'),
('Ülvi', 'ulvi@mail.ru'),
('Ayan', 'ayan@tuta.com'),
('Elşən', 'elshan@gmx.com'),
('Gülnar', 'gulnar@fastmail.com'),
('Kənan', 'kenan@mailbox.org'),
('Nərmin', 'narmin@rambler.ru'),
('Pərviz', 'parviz@hotmail.com'),
('Rəna', 'rena@protonmail.com'),
('Tərlan', 'terlan@yandex.ru'),
('Ülkər', 'ulker@live.com'),
('Vəfa', 'vafa@bk.ru'),
('Xəyal', 'xayal@tutanota.com'),
('Yusif', 'yusif@gmx.de'),
('Zaur', 'zaur@inbox.ru'),
('Aylin', 'aylin@list.ru'),
('Bəxtiyar', 'bakhtiyar@gmail.com'),
('Cəmilə', 'jamila@outlook.com'),
('Dəniz', 'deniz@yahoo.com'),
('Elnur', 'elnur@proton.me');

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
  personal_name  integer      references personal_info(id),
  personal_email varchar(30)  not null references personal_info(email),
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