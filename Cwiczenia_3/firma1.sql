
CREATE TABLE IF NOT EXISTS rozliczenia.godziny
(
    id_godziny integer,
    data date,
    liczba_godzin integer,
    id_pracownika integer NOT NULL,
    CONSTRAINT godziny_pkey PRIMARY KEY (id_godziny)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS rozliczenia.godziny
    OWNER to postgres;
	
	CREATE TABLE IF NOT EXISTS rozliczenia.pensje
(
    id_pensji integer,
    stanowisko character varying COLLATE pg_catalog."default",
    kwota money,
    id_premii integer
);

TABLESPACE pg_default;

ALTER TABLE IF EXISTS rozliczenia.pensje
    OWNER to postgres;
	
	CREATE TABLE IF NOT EXISTS rozliczenia.pracownicy
(
    id_pracownika integer NOT NULL,
    imie character varying(15) COLLATE pg_catalog."default" NOT NULL,
    nazwisko character varying(20) COLLATE pg_catalog."default" NOT NULL,
    adres character varying(30) COLLATE pg_catalog."default",
    telefon character varying(12) COLLATE pg_catalog."default",
    CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownika)
);

TABLESPACE pg_default;

ALTER TABLE IF EXISTS rozliczenia.pracownicy
    OWNER to postgres;
	
	CREATE TABLE IF NOT EXISTS rozliczenia.premie
(
    id_premii integer,
    rodzaj character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS rozliczenia.premie
    OWNER to postgres;
	
	ALTER TABLE rozliczenia.godziny 
	ADD FOREIGN KEY (id_pracownika)
REFERENCES rozliczenia.pracownicy(id_pracownika);
	
	INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) 
	VALUES('11', 'Jan', 'Kowalski', 'Sloneczna 5', '111222333'),
	('12', 'Jakub', 'Nowak', 'Lesna 14', '232324245'),
	('13', 'Agata', 'Chmiel', 'Wesola 15/3', '789789789'),
	('14', 'Krystyna', 'Krzak', 'Miodowa 70', '123000111'),
	('15', 'Bogusław', 'Miły', 'Mickiewicza 8', '721721111'),
	('16', 'Mirosław', 'Kowal', ' Słowackiego 87', '123456789')
	('17', 'Alina', 'Lewandowska', 'Piłsudskiego 23', '000111000')
	('18', 'Monika', 'Wiatr', 'Witosa 39', '721721111')
	('19', 'Adam', 'Małysz', ' Królowej Jadwigi 57 ', '123232311')
	('20', 'Bożena', 'Makłowska', 'Kochanowskiego 7', '101202303')
	;
	
	
	INSERT INTO rozliczenia.godziny(id_godziny, data1, liczba_godzin, id_pracownika) 
	VALUES('1', '10.11.2022', '140', '11'),
	('2', '07.05.2022', '100', '11'),
	('3', '01.12.2022', '120', '14'),
	('4', '22.10.2022', '110', '14'),
	('5', '24.03.2022', '170', '12'),
	('6', '30.04.2022', '120', '15'),
	('7', '19.07.2022', '190', '19'),
	('8', '03.03.2022', '160', '16'),
	('9', '18.03.2022', '190', '13'),
	('10', '21.03.2022', '130', '17');
	
	
	INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) 
	VALUES('1', 'ksiegowy', '3000', '111'),
	('2', 'analityk', '5000', '111'),
	('3', 'administrator', '4500', '112'),
	('4', 'recepcjonista', '3500', '114'),
	('5', 'sekretarz', '4000', '112'),
	('6', 'praktykant', '1000', '113'),
	('7', 'pracownik1', '6000', '112'),
	('8', 'pracownik2', '5500', '115'),
	('9', 'pracownik3', '1100', '113'),
	('10', 'pracownik4', '5400', '114')
	;
	

	
	INSERT INTO rozliczenia.premie(id_premii, rodzaj) 
	VALUES('111', 'pracownik roku'),
('112', 'wieloletnia wspolpraca'),
('113', 'najlepszy projekt'),
('114', 'podwyzka'),
('115', 'nowe stanowisko');

	
	SELECT naziwsko, adres FROM rozliczenia.pracownicy;
	
	
	--postgres tego nie widzi chyba
	DATEPART(MONTH, data) AS Miesiac FROM rozliczenia.godziny;
	DATEPART(WEEKDAY, data) AS DzienTygodnia FROM rozliczenia.godziny;
	--
	
	--inny sposób
	SELECT 
	extract(MONTH from data) FROM rozliczenia.godziny;
	SELECT 
	extract(DOW from data) FROM rozliczenia.godziny;
	
	
	ALTER TABLE rozliczenia.pensje 
	RENAME COLUMN kwota TO kwota_brutto;
	
	ALTER TABLE rozliczenia.pensje
	ADD COLUMN kwota_netto INT;
	
	
	SET kwota_netto = kwota_brutto/1.23
	FROM rozliczenia.pensje
	
	
