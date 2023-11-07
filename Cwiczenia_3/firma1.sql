
CREATE TABLE IF NOT EXISTS rozliczenia.godziny
(
    id_godziny integer,
    data1 date,
    liczba_godzin integer,
    id_pracownika integer NOT NULL,
    CONSTRAINT godziny_pkey PRIMARY KEY (id_pracownika)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS rozliczenia.godziny
    OWNER to postgres;
	
	CREATE TABLE IF NOT EXISTS rozliczenia.pensje
(
    id_pensji integer,
    stanowisko character varying COLLATE pg_catalog."default",
    kwota money,
    id_premii integer
)

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
)

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
	
	INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) 
	VALUES('11', 'Jan', 'Kowalski', 'Sloneczna 5', '111222333'),
	('12', 'Jakub', 'Nowak', 'Lesna 14', '232324245'),
	('13', 'Agata', 'Chmiel', 'Wesola 15/3', '789789789'),
	('14', 'Krystyna', 'Krzak', 'Miodowa 70', '123000111'),
	('15', 'Bogusław', 'Miły', 'Mickiewicza 8', '721721111');
	
	
	INSERT INTO rozliczenia.godziny(id_godziny, data1, liczba_godzin, id_pracownika) 
	VALUES('1', '10.11.2022', '140', '11'),
	('2', '07.05.2022', '100', '11'),
	('3', '01.12.2022', '120', '14'),
	('4', '22.10.2022', '110', '14'),
	('5', '24.03.2022', '120', '12');
	
	
	INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii) 
	VALUES('101', 'ksiegowy', '3000', '111'),
	('102', 'analityk', '5000', '111'),
	('103', 'administrator', '4500', '112'),
	('104', 'recepcjonista', '3500', '114'),
	('105', 'sekretarz', '4000', '112');
	

	
	INSERT INTO rozliczenia.premie(id_premii, rodzaj) 
	VALUES('111', 'pracownik roku'),
('112', 'wieloletnia wspolpraca'),
('113', 'najlepszy projekt'),
('114', 'podwyzka'),
('115', 'nowe stanowisko');

	
	SELECT naziwsko, adres FROM rozliczenia.pracownicy;
	
	
	SELECT date_part('month', data1) FROM rozliczenia.godziny;
	SELECT date_part('dow', data1) FROM rozliczenia.godziny;
	
	DATEPART(MONTH, data1) AS Miesiac FROM rozliczenia.godziny;
	DATEPART(DOW, data1) AS DzienTygodnia FROM rozliczenia.godziny;
	
	ALTER TABLE rozliczenia.pensje 
	RENAME COLUMN kwota TO kwota_brutto;
	
	ALTER TABLE rozliczenia.pensje
	ADD COLUMN kwota_netto INT;
	
	SELECT 
	kwota_brutto
	kwota_brutto*(1-8/100) AS kwota_netto
	FROM rozliczenia.pensje
	
	
