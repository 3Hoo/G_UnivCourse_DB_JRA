DROP TABLE Major_Win;
DROP TABLE Race;
DROP TABLE Racecourse;
DROP TABLE Horse;
DROP TABLE Farm;
DROP TABLE Users;


CREATE TABLE Farm(Farm varchar(25), Location varchar(50), primary key (Farm));
CREATE TABLE Horse(Horse varchar(25), Farm varchar(25), Birth char(20), Death char(20), Gender varchar(10), Sire varchar(25), Dam varchar(25), Record varchar(10), Earnings integer, primary key (Horse), foreign key (Farm) references Farm);
CREATE TABLE Racecourse(Racecourse varchar(15), Location varchar(100), Established char(4), primary key (Racecourse));
CREATE TABLE Race(Title varchar(30), Grade char(2), Racecourse varchar(15), Track varchar(15), Distance varchar(10), Prize integer, primary key (Title, Grade, Racecourse), foreign key (Racecourse) references Racecourse);
CREATE TABLE Major_Win(Horse varchar(25), Title varchar(30), Grade char(2), Racecourse varchar(15), Year char(4), foreign key (Horse) references Horse, foreign key (Title, Grade, Racecourse) references Race);
CREATE TABLE Users(ID varchar(25), PW varchar(25), primary key (ID, PW));



INSERT INTO Farm values ('Symboli Stud', 'Hidaka-Cho, Hokkaido, Japan, JPN');
INSERT INTO Farm values ('Shadai Farm', 'Abira, Hokkaido, JPN');
INSERT INTO Farm values ('Deguchi Bokujo', 'Hidaka, Hokkaido, JPN');
INSERT INTO Farm values ('Nagahama Bokujo', 'Niikappu, Hokkaido, JPN');
INSERT INTO Farm values ('Katashi Yoshida', 'null');
INSERT INTO Farm values ('Inahara Bokujo', 'Biratori, Hokkaido, JPN');
INSERT INTO Farm values ('Hidaka Taiyo Bokujo', 'Hidaka-Cho, Hokkaido, JPN');
INSERT INTO Farm values ('Utopia Bokujo', 'Noboribetsu-Shi, Hokkaido, JPN');
INSERT INTO Farm values ('Nobuta Bokujo', 'null');
INSERT INTO Farm values ('Toshihiro Fukuoka', 'null');



INSERT INTO Horse values ('Symboli Rudolf', 'Symboli Stud', '1981_03_13', '2011_10_04', 'male', 'Partholon', 'Sweet Luna', '16_13', 684824200);
INSERT INTO Horse values ('Air Groove', 'Shadai Farm', '1993_04_06', '2013_04_23', 'female', 'Tony Bin', 'Dyna Kal', '19_9', 821966000);
INSERT INTO Horse values ('Gold Ship', 'Deguchi Bokujo', '2009_03_06', 'still_alive', 'male', 'Stay Gold', 'Point Flag', '27_13', 1397767000);
INSERT INTO Horse values ('Tokai Teio', 'Nagahama Bokujo', '1988_04_20', '2013_08_30', 'male', 'Symboli Rudolf', 'Tokai Natural', '12_9', 625633500);
INSERT INTO Horse values ('Mejiro McQueen', 'Katashi Yoshida', '1987_04_03', '2006_04_03', 'male', 'Mejiro Titan', 'Mejiro Aurora', '21_12', 1014657700);
INSERT INTO Horse values ('Silence Suzuka', 'Inahara Bokujo', '1994_05_01', '1998_11_01', 'male', 'Sunday Silence', 'Wakia', '16_9', 455984000);
INSERT INTO Horse values ('Special Week', 'Hidaka Taiyo Bokujo', '1995_05_02', '2018_04_27', 'male', 'Sunday Silence', 'Campaign Girl', '17_10', 1092623000);
INSERT INTO Horse values ('Agnes Tachyon', 'Shadai Farm', '1998_04_13', '2009_06_22', 'male', 'Sunday Silence', 'Agnes Flora', '4_4', 222082000);
INSERT INTO Horse values ('Rice Shower', 'Utopia Bokujo', '1989_03_05', '1995_06_04', 'male', 'Real Shadai', 'Lilac Point', '25_6', 729497200);
INSERT INTO Horse values ('Haru Urara', 'Nobuta Bokujo', '1996_02_27', 'still_alive', 'female', 'Nippo Teio', 'Heroine', '113_0', 1129000);
INSERT INTO Horse values ('Twin Turbo', 'Toshihiro Fukuoka', '1988_04_13', '1998_01_15', 'male', 'Lyra Ridge', 'Racing Jin', '35_6', 183980000);



INSERT INTO Racecourse values ('Tokyo', 'Japan 183-0024 Tokyo, Fuchu, Hiyoshicho, １−1', '1933');
INSERT INTO Racecourse values ('Kyoto', '612-8265 Kyoto, Fushimi Ward, Yoshijima Watashibajimacho, 32', '1925');
INSERT INTO Racecourse values ('Nakayama', '1 Chome-1-1 Kosaku, Funabashi, Chiba 273-0037 Japan', '1907');
INSERT INTO Racecourse values ('Hanshin', '1-1 Komanocho, Takarazuka, Hyogo 665-0053 Japan', '1949');
INSERT INTO Racecourse values ('Sapporo', '16 Chome-1-1 Kita 16 Jonishi, Chuo Ward, Sapporo, Hokkaido 060-0016 Japan', '1907');
INSERT INTO Racecourse values ('Hakodate', '12-2 Komabacho, Hakodate, Hokkaido 042-0935 Japan', '1896');
INSERT INTO Racecourse values ('Fukushima', '9-23 Matsunamicho, Fukushima, 960-8114 Japan', '1918');
INSERT INTO Racecourse values ('Niigata', '3490 Sasayama, Kita Ward, Niigata, 950-3301 Japan', '1965');
INSERT INTO Racecourse values ('Chukyo', 'Shikita-1225 Magomecho, Toyoake, Aichi 470-1132 Japan', '1994');
INSERT INTO Racecourse values ('Kokura', '4 Chome-5-1 Kitagata, Kokuraminami Ward, Kitakyushu, Fukuoka 802-0841 Japan', '1994');



INSERT INTO Race values ('Hanshin Daishoten', 'G2', 'Hanshin', 'Turf', '3000m', 65000000);
INSERT INTO Race values ('Tulip Sho', 'G2', 'Hanshin', 'Turf', '1600m', 52000000);
INSERT INTO Race values ('Tulip Sho', 'G3', 'Hanshin', 'Turf', '1600m', 52000000);
INSERT INTO Race values ('Takarazuka Kinen', 'G1', 'Hanshin', 'Turf', '2200m', 150000000);
INSERT INTO Race values ('Kikka Sho', 'G1', 'Kyoto', 'Turf', '3000m', 120000000);
INSERT INTO Race values ('Kinko Sho', 'G2', 'Chukyo', 'Turf', '2000m', 62000000);
INSERT INTO Race values ('Kisaragi Sho', 'G3', 'Chukyo', 'Turf', '2000m', 38000000);
INSERT INTO Race values ('Kisaragi Sho', 'G3', 'Kyoto', 'Turf', '2000m', 38000000);
INSERT INTO Race values ('Tenno Sho (Spring)', 'G1', 'Kyoto', 'Turf', '3200m', 150000000);
INSERT INTO Race values ('Tenno Sho (Fall)', 'G1', 'Tokyo', 'Turf', '2000m', 150000000);
INSERT INTO Race values ('Japan Cup', 'G1', 'Tokyo', 'Turf', '2400m', 300000000);
INSERT INTO Race values ('Japanese Oaks', 'G1', 'Tokyo', 'Turf', '2400m', 97000000);
INSERT INTO Race values ('Japanese Derby', 'G1', 'Tokyo', 'Turf', '2400m', 200000000);
INSERT INTO Race values ('All Comers', 'G3', 'Nakayama', 'Turf', '2200m', 67000000);
INSERT INTO Race values ('All Comers', 'G2', 'Nakayama', 'Turf', '2200m', 67000000);
INSERT INTO Race values ('Osaka Hai', 'G2', 'Hanshin', 'Turf', '2000m', 135000000);
INSERT INTO Race values ('Osaka Hai', 'G1', 'Hanshin', 'Turf', '2000m', 135000000);
INSERT INTO Race values ('Yayoi Sho', 'G2', 'Nakayama', 'Turf', '2000m', 52000000);
INSERT INTO Race values ('Yayoi Sho', 'G3', 'Nakayama', 'Turf', '2000m', 52000000);
INSERT INTO Race values ('American Jockey Club Cup', 'G2', 'Nakayama', 'Turf', '2200m', 62000000);
INSERT INTO Race values ('Arima Kinen', 'G1', 'Nakayama', 'Turf', '2500m', 300000000);
INSERT INTO Race values ('St Lite Kinen', 'G2', 'Nakayama', 'Turf', '2200m', 52000000);
INSERT INTO Race values ('Sapporo Kinen', 'G2', 'Sapporo', 'Turf', '2000m', 70000000);
INSERT INTO Race values ('Sankei Osaka Hai', 'G2', 'Hanshin', 'Turf', '2000m', 62000000);
INSERT INTO Race values ('Satsuki Sho', 'G1', 'Nakayama', 'Turf', '2000m', 184700000);
INSERT INTO Race values ('Mermaid Stakes', 'G3', 'Hanshin', 'Handicap/Turf', '2000m', 36000000);
INSERT INTO Race values ('Mainichi Okan', 'G2', 'Tokyo', 'Turf', '1800m', 67000000);
INSERT INTO Race values ('Radio Tampa Hai Sansai Stakes', 'G3', 'Hanshin', 'Turf', '2000m', 32000000);
INSERT INTO Race values ('Radio Nikkei Sho', 'G3', 'Fukushima', 'Handicap/Turf', '1800m', 38000000);
INSERT INTO Race values ('Tanabata Sho', 'G3', 'Fukushima', 'Handicap/Turf', '2000m', 41000000);
INSERT INTO Race values ('Nikkei Sho', 'G2', 'Nakayama', 'Turf', '2500m', 67000000);
INSERT INTO Race values ('Nakayama Kinen', 'G1', 'Nakayama', 'Turf', '2000m', 110000000);
INSERT INTO Race values ('Nakayama Kinen', 'G2', 'Nakayama', 'Turf', '1800m', 67000000);
INSERT INTO Race values ('Kyoto Shimbun Hai', 'G2', 'Kyoto', 'Turf', '2200m', 54000000);
INSERT INTO Race values ('Kyoto Daishoten', 'G2', 'Kyoto', 'Turf', '2400m', 67000000);
INSERT INTO Race values ('Kyodo News Service Hai ', 'G3', 'Tokyo', 'Turf', '1800m', 38000000);
INSERT INTO Race values ('Kokura Daishoten', 'G3', 'Kokura', 'Turf', '1800m', 41000000);
INSERT INTO Race values ('Kobe Shimbun Hai', 'G2', 'Hanshin', 'Turf', '2400m', 54000000);



INSERT INTO Major_Win values ('Agnes Tachyon', 'Yayoi Sho', 'G2', 'Nakayama', '2001');
INSERT INTO Major_Win values ('Special Week', 'Yayoi Sho', 'G2', 'Nakayama', '1998');
INSERT INTO Major_Win values ('Symboli Rudolf', 'Yayoi Sho', 'G3', 'Nakayama', '1984');
INSERT INTO Major_Win values ('Air Groove', 'Tulip Sho', 'G3', 'Hanshin', '1996');
INSERT INTO Major_Win values ('Gold Ship', 'Tenno Sho (Spring)', 'G1', 'Kyoto', '2015');
INSERT INTO Major_Win values ('Mejiro McQueen', 'Tenno Sho (Spring)', 'G1', 'Kyoto', '1991');
INSERT INTO Major_Win values ('Mejiro McQueen', 'Tenno Sho (Spring)', 'G1', 'Kyoto', '1992');
INSERT INTO Major_Win values ('Rice Shower', 'Tenno Sho (Spring)', 'G1', 'Kyoto', '1993');
INSERT INTO Major_Win values ('Rice Shower', 'Tenno Sho (Spring)', 'G1', 'Kyoto', '1995');
INSERT INTO Major_Win values ('Special Week', 'Tenno Sho (Spring)', 'G1', 'Kyoto', '1999');
INSERT INTO Major_Win values ('Symboli Rudolf', 'Tenno Sho (Spring)', 'G1', 'Kyoto', '1985');
INSERT INTO Major_Win values ('Air Groove', 'Tenno Sho (Fall)', 'G1', 'Tokyo', '1997');
INSERT INTO Major_Win values ('Special Week', 'Tenno Sho (Fall)', 'G1', 'Tokyo', '1999');
INSERT INTO Major_Win values ('Twin Turbo', 'Tanabata Sho', 'G3', 'Fukushima', '1993');
INSERT INTO Major_Win values ('Gold Ship', 'Takarazuka Kinen', 'G1', 'Hanshin', '2013');
INSERT INTO Major_Win values ('Gold Ship', 'Takarazuka Kinen', 'G1', 'Hanshin', '2014');
INSERT INTO Major_Win values ('Mejiro McQueen', 'Takarazuka Kinen', 'G1', 'Hanshin', '1993');
INSERT INTO Major_Win values ('Silence Suzuka', 'Takarazuka Kinen', 'G1', 'Hanshin', '1998');
INSERT INTO Major_Win values ('Symboli Rudolf', 'St Lite Kinen', 'G2', 'Nakayama', '1984');
INSERT INTO Major_Win values ('Agnes Tachyon', 'Satsuki Sho', 'G1', 'Nakayama', '2001');
INSERT INTO Major_Win values ('Gold Ship', 'Satsuki Sho', 'G1', 'Nakayama', '2012');
INSERT INTO Major_Win values ('Symboli Rudolf', 'Satsuki Sho', 'G1', 'Nakayama', '1984');
INSERT INTO Major_Win values ('Tokai Teio', 'Satsuki Sho', 'G1', 'Nakayama', '1991');
INSERT INTO Major_Win values ('Air Groove', 'Sapporo Kinen', 'G2', 'Sapporo', '1997');
INSERT INTO Major_Win values ('Air Groove', 'Sapporo Kinen', 'G2', 'Sapporo', '1998');
INSERT INTO Major_Win values ('Mejiro McQueen', 'Sankei Osaka Hai', 'G2', 'Hanshin', '1993');
INSERT INTO Major_Win values ('Agnes Tachyon', 'Radio Tampa Hai Sansai Stakes', 'G3', 'Hanshin', '2000');
INSERT INTO Major_Win values ('Twin Turbo', 'Radio Nikkei Sho', 'G3', 'Fukushima', '1991');
INSERT INTO Major_Win values ('Air Groove', 'Osaka Hai', 'G2', 'Hanshin', '1998');
INSERT INTO Major_Win values ('Tokai Teio', 'Osaka Hai', 'G2', 'Hanshin', '1992');
INSERT INTO Major_Win values ('Rice Shower', 'Nikkei Sho', 'G2', 'Nakayama', '1993');
INSERT INTO Major_Win values ('Symboli Rudolf', 'Nikkei Sho', 'G2', 'Nakayama', '1985');
INSERT INTO Major_Win values ('Silence Suzuka', 'Nakayama Kinen', 'G2', 'Nakayama', '1998');
INSERT INTO Major_Win values ('Air Groove', 'Mermaid Stakes', 'G3', 'Hanshin', '1997');
INSERT INTO Major_Win values ('Silence Suzuka', 'Mainichi Okan', 'G2', 'Tokyo', '1998');
INSERT INTO Major_Win values ('Special Week', 'Kyoto Shimbun Hai', 'G2', 'Kyoto', '1998');
INSERT INTO Major_Win values ('Mejiro McQueen', 'Kyoto Daishoten', 'G2', 'Kyoto', '1991');
INSERT INTO Major_Win values ('Mejiro McQueen', 'Kyoto Daishoten', 'G2', 'Kyoto', '1993');
INSERT INTO Major_Win values ('Gold Ship', 'Kyodo News Service Hai ', 'G3', 'Tokyo', '2012');
INSERT INTO Major_Win values ('Silence Suzuka', 'Kokura Daishoten', 'G3', 'Kokura', '1998');
INSERT INTO Major_Win values ('Gold Ship', 'Kobe Shimbun Hai', 'G2', 'Hanshin', '2012');
INSERT INTO Major_Win values ('Special Week', 'Kisaragi Sho', 'G3', 'Kyoto', '1998');
INSERT INTO Major_Win values ('Silence Suzuka', 'Kinko Sho', 'G2', 'Chukyo', '1998');
INSERT INTO Major_Win values ('Gold Ship', 'Kikka Sho', 'G1', 'Kyoto', '2012');
INSERT INTO Major_Win values ('Mejiro McQueen', 'Kikka Sho', 'G1', 'Kyoto', '1990');
INSERT INTO Major_Win values ('Rice Shower', 'Kikka Sho', 'G1', 'Kyoto', '1992');
INSERT INTO Major_Win values ('Symboli Rudolf', 'Kikka Sho', 'G1', 'Kyoto', '1984');
INSERT INTO Major_Win values ('Air Groove', 'Japanese Oaks', 'G1', 'Tokyo', '1996');
INSERT INTO Major_Win values ('Special Week', 'Japanese Derby', 'G1', 'Tokyo', '1998');
INSERT INTO Major_Win values ('Symboli Rudolf', 'Japanese Derby', 'G1', 'Tokyo', '1984');
INSERT INTO Major_Win values ('Tokai Teio', 'Japanese Derby', 'G1', 'Tokyo', '1991');
INSERT INTO Major_Win values ('Special Week', 'Japan Cup', 'G1', 'Tokyo', '1999');
INSERT INTO Major_Win values ('Symboli Rudolf', 'Japan Cup', 'G1', 'Tokyo', '1985');
INSERT INTO Major_Win values ('Tokai Teio', 'Japan Cup', 'G1', 'Tokyo', '1992');
INSERT INTO Major_Win values ('Gold Ship', 'Hanshin Daishoten', 'G2', 'Hanshin', '2013');
INSERT INTO Major_Win values ('Gold Ship', 'Hanshin Daishoten', 'G2', 'Hanshin', '2014');
INSERT INTO Major_Win values ('Gold Ship', 'Hanshin Daishoten', 'G2', 'Hanshin', '2015');
INSERT INTO Major_Win values ('Mejiro McQueen', 'Hanshin Daishoten', 'G2', 'Hanshin', '1991');
INSERT INTO Major_Win values ('Mejiro McQueen', 'Hanshin Daishoten', 'G2', 'Hanshin', '1992');
INSERT INTO Major_Win values ('Special Week', 'Hanshin Daishoten', 'G2', 'Hanshin', '1999');
INSERT INTO Major_Win values ('Gold Ship', 'Arima Kinen', 'G1', 'Nakayama', '2012');
INSERT INTO Major_Win values ('Symboli Rudolf', 'Arima Kinen', 'G1', 'Nakayama', '1984');
INSERT INTO Major_Win values ('Symboli Rudolf', 'Arima Kinen', 'G1', 'Nakayama', '1985');
INSERT INTO Major_Win values ('Tokai Teio', 'Arima Kinen', 'G1', 'Nakayama', '1993');
INSERT INTO Major_Win values ('Special Week', 'American Jockey Club Cup', 'G2', 'Nakayama', '1999');
INSERT INTO Major_Win values ('Twin Turbo', 'All Comers', 'G3', 'Nakayama', '1993');



INSERT INTO Users values ('admin', 'admin');



