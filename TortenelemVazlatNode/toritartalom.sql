-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Már 06. 11:48
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `toritartalom`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `authority`
--

CREATE TABLE `authority` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `authority`
--

INSERT INTO `authority` (`id`, `name`, `desc`) VALUES
(1, 'admin', 'Teljes jogosultság, tartalom és felhasználók kezelése'),
(2, 'user', 'Tartalom megtekintése');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Egyetemes történelem'),
(6, 'Érdekességek'),
(3, 'Érettségi felkészülés'),
(5, 'Források'),
(2, 'Magyar történelem'),
(4, 'Segédanyagok');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `loginlog`
--

CREATE TABLE `loginlog` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time_stamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `loginlog`
--

INSERT INTO `loginlog` (`id`, `users_id`, `ip_address`, `time_stamp`) VALUES
(1, 1, '192.168.1.10', '2026-02-01 08:12:33'),
(2, 2, '192.168.1.20', '2026-02-01 09:05:11'),
(3, 3, '192.168.1.30', '2026-02-01 10:42:55');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `topics`
--

INSERT INTO `topics` (`id`, `title`, `category_id`, `content`, `img`) VALUES
(1, 'Az Őskor', 1, '<h2>A világ keletkezése</h2>\n\n<p>\nA világ keletkezése az emberiség legősibb kérdései közé tartozik. Az ember mindig kereste a választ arra, \nhogyan jött létre a világegyetem, a Föld és maga az ember. A különböző korok és kultúrák eltérő magyarázatokat \nadtak erre a kérdésre, amelyek lehettek mitológiai, vallásos, filozófiai vagy tudományos jellegűek.\n</p>\n\n<h3>Mitológiai és vallásos magyarázatok</h3>\n\n<p>\nAz ókori népek teremtésmítoszai istenekhez és természetfeletti erőkhöz kötötték a világ létrejöttét. \nA vallásos magyarázatok szerint a világ egy felsőbb hatalom akaratából jött létre.\n</p>\n\n<blockquote>\n„Kezdetben teremté Isten az eget és a földet.”\n</blockquote>\n\n<h3>Filozófiai és tudományos magyarázatok</h3>\n\n<p>\nA filozófusok már az ókorban megpróbálták racionálisan értelmezni a világ eredetét. \nA modern tudomány szerint a világegyetem az ősrobbanás (Big Bang) következtében jött létre körülbelül 13,8 milliárd évvel ezelőtt.\nAz élővilág kialakulását az evolúció elmélete magyarázza, amely szerint az élőlények hosszú biológiai fejlődés eredményeként alakultak ki.\n</p>\n\n<div class=\"image-section\">\n  <img src=\"/uploads/osrobbanas.jpg\" alt=\"Az ősrobbanás szemléltetése\">\n  <small>Az ősrobbanás elméletének illusztrációja</small>\n</div>\n\n<hr>\n\n<h2>Az emberré válás</h2>\n\n<p>\nAz ember az állatvilágból alakult ki hosszú biológiai fejlődés útján. Az emberré válás nem egyik napról a másikra történt, \nhanem több millió éves folyamat eredménye volt.\n</p>\n\n<h3>Az ember kialakulásának fő állomásai</h3>\n\n<ul>\n  <li>Főemlősök</li>\n  <li>Emberszabásúak</li>\n  <li>Előember</li>\n  <li>Ősember</li>\n  <li>Mai ember</li>\n</ul>\n\n<p>\nAz emberré váláshoz hozzájárult a gondolkodás fejlődése, az eszközhasználat és eszközkészítés képessége, \na beszéd kialakulása és a tűz használatának felfedezése.\n</p>\n\n<blockquote>\nAz ember kialakulása hosszú fejlődés eredménye, amelynek részleteit ma sem ismerjük teljes bizonyossággal.\n</blockquote>\n\n<p>\nKevés tárgyi lelet áll rendelkezésünkre, ezért nincs minden kérdésre egyértelmű válasz.\nAz emberiség egyik „bölcsője” Afrika keleti része lehetett, ahonnan az emberek szétvándoroltak.\n</p>\n\n<h3>Az emberi rasszok kialakulása</h3>\n\n<ul>\n  <li>Europid</li>\n  <li>Mongoloid</li>\n  <li>Negrid</li>\n  <li>Ausztraloid</li>\n</ul>\n\n<div class=\"image-section\">\n  <img src=\"/uploads/africa_osember.jpg\" alt=\"Ősember Afrikában\">\n  <small>Az emberiség egyik bölcsője Kelet-Afrika lehetett</small>\n</div>\n\n<hr>\n\n<h2>Az őskor szakaszai</h2>\n\n<p>\nAz őskor az emberré válás és az írást ismerő kultúrák közötti időszak.\n</p>\n\n<h3>Paleolitikum – őskőkorszak (i. e. 3 millió – i. e. 12.000)</h3>\n\n<p>\nAz emberek hordaközösségekben éltek. Kialakult a nemek közti munkamegosztás.\n</p>\n\n<ul>\n  <li>Nők: gyűjtögetés (biztosabb megélhetés), gyermeknevelés → matriarchátus</li>\n  <li>Férfiak: vadászat, halászat, eszközkészítés</li>\n  <li>Eszközök: kő, csont, fa</li>\n  <li>A tűz használata</li>\n</ul>\n\n<h3>Mezolitikum – átmeneti kőkorszak (i. e. 12.000 – i. e. 10.000)</h3>\n\n<p>\nMegindult az élelemtermelés. Elkezdődött az állatok háziasítása (domesztikáció) és a földművelés.\nFő helyszíne a „Termékeny Félhold” területe volt a Közel-Keleten.\n</p>\n\n<h3>Neolitikum – újkőkorszak (i. e. 10.000 – i. e. 3.000)</h3>\n\n<p>\nAz élelemtermelés lehetővé tette a letelepedést, falvak és városok kialakulását.\nMegjelentek az első mesterségek: fonás, szövés, fazekasság.\n</p>\n\n<ul>\n  <li>Fazekaskorong</li>\n  <li>Agyagedények</li>\n  <li>Szövőszék</li>\n  <li>Eke</li>\n  <li>Vitorla</li>\n  <li>Kerék</li>\n  <li>Tégla</li>\n</ul>\n\n<h3>A fémek kora</h3>\n\n<table>\n  <thead>\n    <tr>\n      <th>Korszak</th>\n      <th>Időszak</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>Rézkor</td>\n      <td>i. e. 4.000 – i. e. 3.000</td>\n    </tr>\n    <tr>\n      <td>Bronzkor</td>\n      <td>i. e. 3.000 – i. e. 2.000</td>\n    </tr>\n    <tr>\n      <td>Vaskor</td>\n      <td>i. e. 2.000 – i. e. 1.000</td>\n    </tr>\n  </tbody>\n</table>\n\n<h3>A változások következményei</h3>\n\n<ul>\n  <li>Felesleg kialakulása → cserekereskedelem</li>\n  <li>Népességrobbanás</li>\n  <li>Patriarchátus kialakulása</li>\n  <li>Magántulajdon megjelenése</li>\n  <li>Ősközösségi társadalom felbomlása</li>\n</ul>\n\n<hr>\n\n<h2>Az őskor művészete</h2>\n\n<p>\nA paleolitikum emberének hiedelemvilágában meghatározó volt a természetfeletti erőkbe vetett hit.\nA varázslók (sámánok) mágikus szertartások segítségével próbálták befolyásolni a természetet.\n</p>\n\n<h3>Barlangfestmények és szobrok</h3>\n\n<p>\nAz őskőkori alkotások közé tartoznak a barlangfestmények és karcolatok, amelyek gyakran állatábrázolásokat mutatnak.\n</p>\n\n<div class=\"image-section\">\n  <img src=\"/uploads/lascaux.jpg\" alt=\"Lascaux barlangfestmény\">\n  <small>Barlangfestmény a Lascaux-barlangból</small>\n</div>\n\n<p>\nHíres lelőhelyek:\n</p>\n\n<ul>\n  <li>Lascaux (Franciaország)</li>\n  <li>Altamira (Spanyolország)</li>\n  <li>Willendorf (Ausztria)</li>\n</ul>\n\n<h3>Megalitikus építmények</h3>\n\n<p>\nAz újkőkorból fennmaradt megalitok („nagy kövek”) hatalmas faragatlan kőtömbökből készültek.\n</p>\n\n<ul>\n  <li>Dolmenek – több tonnás kövek szabályos alakzatban</li>\n  <li>Menhirek – függőlegesen felállított kövek</li>\n  <li>Összetett kőépítmények – kultikus célokra</li>\n</ul>\n\n<div class=\"image-section\">\n  <img src=\"/uploads/stonehenge.jpg\" alt=\"Stonehenge Angliában\">\n  <small>Stonehenge – az egyik legismertebb megalitikus építmény</small>\n</div>\n\n<blockquote>\nA legismertebb megalitikus építmény az angliai Stonehenge.\n</blockquote>', 'Egyetemestortenelem/oskor.png'),
(2, 'Az ókori Kelet', 1, '<h2>Az első államok kialakulása</h2>\n\n<p>\nAz első államok az i. e. 4. és 3. évezredben a nagy folyók völgyében alakultak ki\na Közel-Kelet („Termékeny Félhold” térsége), India és Kína területén.\n</p>\n\n<div class=\"image-section\">\n  <img src=\"/uploads/termekeny_felhold.jpg\" alt=\"Termékeny Félhold térsége\">\n  <small>A nagy folyóvölgyi civilizációk területe</small>\n</div>\n\n<h3>Az első államok jellemzői</h3>\n\n<ul>\n  <li>Elterjedt az öntözéses földművelés</li>\n  <li>Állattartás fejlődése</li>\n  <li>Hatalmi központok emelkedtek ki</li>\n  <li>Kialakult az írás</li>\n  <li>Létrejött az állam</li>\n</ul>\n\n<p>\nAz állam biztosította az:\n</p>\n\n<ul>\n  <li>Irányítást</li>\n  <li>Elosztást (cserekereskedelem)</li>\n  <li>Védelmet</li>\n</ul>\n\n<blockquote>\nAz állam megszervezte a termelést, biztosította a rendet és a külső támadások elleni védelmet.\n</blockquote>\n\n<hr>\n\n<h2>Az ókori keleti állam és társadalom működése</h2>\n\n<p>\nAz állam élén az uralkodó állt (király, főpap, fáraó, császár stb.).\nAz arisztokrácia tagjai a papok, hivatalnokok és a katonai vezetők voltak,\nakik az uralkodó hatalmát védték és segítették az állam és a hadsereg irányítását.\n</p>\n\n<p>\nA közrendű szabadok (parasztok, kézművesek stb.) végezték a termelést.\nA társadalom alján álló rabszolgák átmenetileg (adós rabszolgák)\nvagy örökre elveszítették szabadságukat.\n</p>\n\n<table>\n  <thead>\n    <tr>\n      <th>Társadalmi réteg</th>\n      <th>Szerepe</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>Uralkodó</td>\n      <td>Teljhatalmú vezető</td>\n    </tr>\n    <tr>\n      <td>Arisztokrácia</td>\n      <td>Állam és hadsereg irányítása</td>\n    </tr>\n    <tr>\n      <td>Közrendű szabadok</td>\n      <td>Termelés</td>\n    </tr>\n    <tr>\n      <td>Rabszolgák</td>\n      <td>Kényszermunka</td>\n    </tr>\n  </tbody>\n</table>\n\n<hr>\n\n<h2>Egyiptom – „a Nílus ajándéka”</h2>\n\n<h3>Földrajzi jellemzői</h3>\n\n<p>\nAfrikában a Nílus folyó mentén alakult ki.\nA rendszeres áradások termékennyé tették a földeket,\nami lehetővé tette az öntözéses földművelést.\nTermészeti határai (sivatagok, tenger) miatt területe könnyen védhető volt.\n</p>\n\n<div class=\"image-section\">\n  <img src=\"/uploads/nilus.jpg\" alt=\"Nílus folyó\">\n  <small>A Nílus áradása biztosította a termékenységet</small>\n</div>\n\n<h3>Története</h3>\n\n<p>\nA Nílus völgyében két állam alakult ki: Alsó- és Felső-Egyiptom.\nAha-Ménész fáraó egyesítette őket i. e. 2950 körül (Archaikus kor).\n</p>\n\n<ul>\n  <li>Óbirodalom: a fáraók korlátlan hatalommal rendelkeztek, piramisépítkezések</li>\n  <li>Középbirodalom: megnőtt az Ámon-papság befolyása</li>\n  <li>Újbirodalom: hódítások, gazdasági fellendülés</li>\n  <li>Az 1. évezredben asszír majd perzsa hódítások → összeomlás</li>\n</ul>\n\n<h3>Az egyiptomi állam és társadalom</h3>\n\n<p>\nA fáraót isteni eredetű uralkodónak tartották,\naki vallási, katonai és politikai vezető volt egy személyben.\n</p>\n\n<p>\nA központi irányítást írnokok, hivatalnokok, papság és katonaság végezte.\nA termelés nagy része állami tulajdonban volt: templomgazdaság és uralkodói birtokok.\n</p>\n\n<h3>Társadalmi piramis</h3>\n\n<ul>\n  <li>Fáraó</li>\n  <li>Főpapok és hivatalnokok</li>\n  <li>Katonák</li>\n  <li>Kézművesek és földművesek</li>\n  <li>Rabszolgák (háborús foglyok; nem meghatározó mennyiségben)</li>\n</ul>\n\n<h3>Az egyiptomi kultúra</h3>\n\n<ul>\n  <li>Hieroglifikus írás – papirusz</li>\n  <li>Matematika (törtek, területmérés)</li>\n  <li>Csillagászat (naptár)</li>\n  <li>Orvostudomány (sebészet, gyógyítás, mumifikálás)</li>\n  <li>Irodalom: bölcsességirodalom, himnuszok, halotti szövegek</li>\n</ul>\n\n<p>\nMonumentális építmények:\n</p>\n\n<ul>\n  <li>Piramisok (Kheopsz, Kefrén, Mükerinosz)</li>\n  <li>Templomok (Luxor, Karnak)</li>\n  <li>Szfinx</li>\n</ul>\n\n<blockquote>\nAz egyiptomi művészetre az oldalnézet, a szigorú szabályrendszer,\naz arany használata és az idealizált ábrázolás volt jellemző.\n</blockquote>\n\n<hr>\n\n<h2>Mezopotámia – a folyóköz</h2>\n\n<p>\nA Tigris és az Eufrátesz folyók völgye.\nÉlelemben bővelkedett, de ásványkincsekben szegény volt,\nezért élénk kereskedelem alakult ki.\n</p>\n\n<p>\nA termelést és az elosztást a templomgazdaság irányította,\nközpontja a toronytemplom (zikkurat) volt.\n</p>\n\n<h3>Története</h3>\n\n<ul>\n  <li>Sumer városállamok az i. e. 4. évezredben</li>\n  <li>Találmányok: eke, kerék, iskola</li>\n  <li>Akkádok I. Sarrukin vezetésével egyesítés</li>\n  <li>Óbabiloni Birodalom – Hammurapi törvényei</li>\n</ul>\n\n<h3>Kultúra</h3>\n\n<ul>\n  <li>Ékírás – agyagtáblák</li>\n  <li>60-as számrendszer</li>\n  <li>Naptár</li>\n  <li>Sokistenhit</li>\n  <li>Domborművek és paloták</li>\n</ul>\n\n<hr>\n\n<h2>India</h2>\n\n<p>\nAz Indiai-félsziget, az Indus és a Gangesz folyók völgye,\ntermékeny területek, monszun éghajlat.\n</p>\n\n<ul>\n  <li>Dravida civilizáció (Harappa, Mohendzsodaro)</li>\n  <li>Árják hódítása → kasztrendszer</li>\n  <li>Brahmanizmus → lélekvándorlás</li>\n  <li>Buddhizmus megjelenése</li>\n  <li>Maurja Birodalom – Asóka király</li>\n</ul>\n\n<hr>\n\n<h2>Kína</h2>\n\n<p>\nA 4. évezredben földművelő civilizáció alakult ki\na Sárga- és Kék-folyó völgyében.\n</p>\n\n<ul>\n  <li>Sang-dinasztia – első állam</li>\n  <li>Cin-si Huang-ti – Kína egyesítése</li>\n  <li>Nagy Fal, Nagy Csatorna</li>\n  <li>Egységes mértékrendszer, úthálózat, posta</li>\n  <li>Találmányok: selyem, porcelán, iránytű, papír, könyvnyomtatás, puskapor</li>\n</ul>\n\n<blockquote>\nA kínai vallásban fontos a jin és jang harmóniája.\n</blockquote>\n\n<hr>\n\n<h2>Hódító népek</h2>\n\n<ul>\n  <li>Asszíria – Assur, Ninive</li>\n  <li>Újbabiloni Birodalom – Babilon</li>\n  <li>Médek – Zagrosz-hegység</li>\n  <li>Perzsa Birodalom – Kürosz, I. Dareiosz</li>\n</ul>\n\n<h3>A perzsa állam jellemzői</h3>\n\n<ul>\n  <li>Tartományok (szatrapiák)</li>\n  <li>Királyi út</li>\n  <li>Aranypénz (dareikos)</li>\n  <li>Adórendszer</li>\n  <li>Posta</li>\n  <li>Zarathusztra vallása – jó és rossz küzdelme</li>\n</ul>\n\n<hr>\n\n<h2>Közvetítő népek</h2>\n\n<ul>\n  <li>Hettiták – vas feldolgozása</li>\n  <li>Föníciaiak – tengeri kereskedelem, Karthágó (i. e. 814)</li>\n  <li>22 betűs mássalhangzóírás</li>\n  <li>Palesztina – zsidó nép, Saul, Dávid, Salamon</li>\n  <li>Izrael és Judea kettészakadása</li>\n  <li>Babiloni fogság</li>\n  <li>Egyistenhit kialakulása</li>\n</ul>\n\n<blockquote>\nA zsidó nép történetét az Ószövetség (Biblia) beszéli el.\n</blockquote>', 'Egyetemestortenelem/okorikelet.png'),
(3, 'Az ókori Hellász', 1, '<h2>Az ókori görög civilizáció</h2>\n\n<p>\nAz ókori görög civilizáció a Balkán-félsziget déli részén, az Égei-tenger szigetvilágában, \nés Kis-Ázsia nyugati partvidékén alakult ki. A görögök később benépesítették a \nFöldközi-, a Márvány- és a Fekete-tenger partvidékeit is.\n</p>\n\n<h3>A görög táj földrajzi jellemzői</h3>\n\n<ul>\n<li>Mediterrán éghajlat: gabona, szőlő, olajbogyó, gyümölcsök, juh, kecske.</li>\n<li>Tagolt partvidék: kikötőkben gazdag, fejlett hajózás és kereskedelem.</li>\n<li>Hegyvidéki felszín: ásványkincsekben gazdag, folyókban szegény.</li>\n</ul>\n\n<hr>\n\n<h2>Első civilizációk</h2>\n\n<h3>Krétai civilizáció</h3>\n\n<p>\nA knószoszi palota Kréta szigetén és a körülötte lévő szigetvilágban jött létre \nvároslakó civilizáció, amely fénykorát az i. e. 2. évezred elején élte.\nJelentős városok: Knósszosz, Mallia.\n</p>\n\n<p>\nAz ókori keleti típusú államok központja a palotagazdaság volt, amely irányította:\n</p>\n\n<ul>\n<li>Termelést</li>\n<li>Elosztást</li>\n<li>Cserét</li>\n</ul>\n\n<p>\nLakói békében éltek egymással és a tengeren kereskedtek.\nTermészeti katasztrófák és a görög akháj törzsek támadásai miatt \naz i. e. 2. évezred közepén összeomlott.\n</p>\n\n<h3>Mükénéi civilizáció</h3>\n\n<p>\nA mükénéi fellegvárat a bronzfegyverekkel rendelkező akhájok hozták létre.\nÁllandó harcot vívtak egymással a földekért.\n</p>\n\n<ul>\n<li>Hatalmas erődöket építettek: Mükéné, Argosz.</li>\n<li>Az i. e. 13. században lerombolták Tróját (Iliász).</li>\n<li>Az egymás ellen vívott harcokban meggyengültek és központjaik elpusztultak.</li>\n</ul>\n\n<hr>\n\n<h2>A poliszok kialakulása</h2>\n\n<ul>\n<li>Az i. e. 13. században dórok, ionok és aiolok vándoroltak be a Balkán-félszigetre.</li>\n<li>Az i. e. 8. századig letelepedtek.</li>\n<li>Létrejött a polisz (városközpontú állam).</li>\n<li>A királyságot felváltotta a köztársaság.</li>\n<li>Az államok élén az arisztokrácia állt (arisztokratikus köztársaság).</li>\n<li>A démosz nem rendelkezett politikai jogokkal.</li>\n</ul>\n\n<hr>\n\n<h2>A görög gyarmatosítás</h2>\n\n<ul>\n<li>Az i. e. 8–6. század között gyarmatvárosokat hoztak létre.</li>\n<li>Okai: túlnépesedés, kevés termőföld, politikai ellentétek, kereskedelmi haszon.</li>\n<li>Anyaváros: kerámia, fémáru, textiláru.</li>\n<li>Gyarmatváros: gabona, nyersanyag, rabszolga.</li>\n<li>Kapcsolat a barbár (nem görög) népekkel.</li>\n<li>Eredmény: gyors gazdasági fellendülés.</li>\n</ul>\n\n<hr>\n\n<h2>A spártai állam</h2>\n\n<p>\nSpártát a vasfegyverekkel rendelkező dórok alapították \na Peloponnészosz déli részén (Lakedaimon–Lakónia).\n</p>\n\n<ul>\n<li>Leigázta szomszédjait (pl. Messzénia).</li>\n</ul>\n\n<h3>Társadalma</h3>\n\n<ul>\n<li>Spártai polgárok</li>\n<li>Perioikoszok (körüllakók, kézművesek)</li>\n<li>Helóták (Meszénia leigázott lakói)</li>\n</ul>\n\n<h3>Államszervezet</h3>\n\n<ul>\n<li>2 király (katonai vezetők)</li>\n<li>Gerúszia (vének tanácsa)</li>\n<li>Ephoroszok (felügyelők, vétójog)</li>\n<li>Apella (népgyűlés, 30 év feletti férfiak)</li>\n</ul>\n\n<h3>Spártai nevelés</h3>\n\n<ul>\n<li>7 éves kortól állami nevelés</li>\n<li>Fiúkból harcost</li>\n<li>Lányokból jó anyát neveltek</li>\n</ul>\n\n<hr>\n\n<h2>Az athéni demokrácia kialakulása</h2>\n\n<h3>Alapok</h3>\n\n<ul>\n<li>Ionok alapították Attikában.</li>\n<li>Arkhónok irányították.</li>\n<li>Államforma: arisztokratikus köztársaság.</li>\n<li>A démosz politikai jogokért harcolt.</li>\n</ul>\n\n<h3>Fontos reformok</h3>\n\n<ul>\n<li>Drakón (i. e. 621) – írott törvények („drákói szigor”).</li>\n<li>Szolón (i. e. 594): adósrabszolgaság eltörlése, timokrácia (4 vagyoni csoport).</li>\n<li>Peiszisztratosz (i. e. 560–527) – türannisz.</li>\n<li>Kleiszthenész (i. e. 508) – phülék, hatalmi ágak elkülönítése, osztrakiszmosz.</li>\n</ul>\n\n<h3>Politikai intézmények</h3>\n\n<ul>\n<li>Eklészia (népgyűlés)</li>\n<li>Bulé (ötszázak tanácsa)</li>\n<li>Heliaia (esküdtbíróság)</li>\n<li>Areioszpagosz</li>\n<li>Sztratégoszok (10 fő)</li>\n</ul>\n\n<h3>Társadalom</h3>\n\n<ul>\n<li>Arisztokraták</li>\n<li>Démosz</li>\n<li>Metoikoszok</li>\n<li>Rabszolgák</li>\n</ul>\n\n<hr>\n\n<h2>A görög–perzsa háborúk</h2>\n\n<ul>\n<li>Ion felkelés Milétosz vezetésével.</li>\n<li>Marathón (i. e. 490) – Miltiádész.</li>\n<li>Thermopülai (Leonidász).</li>\n<li>Szalamisz (Themisztoklész).</li>\n<li>Plataia, Mükalé (i. e. 479).</li>\n<li>Déloszi szövetség (i. e. 478).</li>\n<li>Kalliász-féle béke (i. e. 449).</li>\n</ul>\n\n<hr>\n\n<h2>Athén fénykora és bukása</h2>\n\n<h3>Periklész kora</h3>\n\n<ul>\n<li>Akropolisz, agora újjáépítése</li>\n<li>Napidíj a politikai részvételért</li>\n<li>Bevételek: adók, hadisarcból, ezüstbányák, kereskedelem</li>\n</ul>\n\n<h3>Peloponnészoszi háború (i. e. 431–404)</h3>\n\n<ul>\n<li>Athén tengeri fölény</li>\n<li>Spárta szárazföldi fölény</li>\n<li>Szicíliai hadjárat → vereség</li>\n<li>Athén bukása</li>\n</ul>\n\n<hr>\n\n<h2>Makedónia felemelkedése</h2>\n\n<h3>II. Fülöp</h3>\n\n<ul>\n<li>Makedón falanx</li>\n<li>Hódítások: Trákia, Tesszália</li>\n<li>Kaironeia (i. e. 338)</li>\n</ul>\n\n<h3>Nagy Sándor</h3>\n\n<ul>\n<li>Granikosz, Isszosz, Gaugaméla</li>\n<li>Fönícia, Palesztina, Egyiptom</li>\n<li>Belső-Ázsia, Indus</li>\n<li>Hellenizmus</li>\n<li>Alexandriák alapítása</li>\n</ul>\n\n<h3>Utódállamok</h3>\n\n<ul>\n<li>Makedónia (Antigonidák)</li>\n<li>Egyiptom (Ptolemaidák)</li>\n<li>Szíria (Szeleukidák)</li>\n<li>Pergamon (Attalidák)</li>\n</ul>\n\n<hr>\n\n<h2>Görög életmód, művészet, tudomány</h2>\n\n<h3>Életmód</h3>\n\n<ul>\n<li>Ablaktalan házak, belső udvar</li>\n<li>Kerevet, láda, mozaikpadló</li>\n<li>Ételek: kása, kenyér, hal, sajt, gyümölcs, olajbogyó</li>\n<li>Ruházat: khitón, bőrsaru</li>\n</ul>\n\n<h3>Művészet</h3>\n\n<ul>\n<li>Oszloprendek: dór, jón, korinthoszi</li>\n<li>Fríz, timpanon, sztoa</li>\n<li>Szobrászok: Müron, Pheidiasz, Lüszipposz</li>\n<li>Színház: Dionüszosz tisztelete</li>\n<li>Szerzők: Aiszkhülosz, Szophoklész, Euripidész</li>\n</ul>\n\n<h3>Mitológia</h3>\n\n<ul>\n<li>Politeizmus</li>\n<li>Delphoi és Dodonai jósda</li>\n<li>Olympiai játékok</li>\n</ul>\n\n<h3>Filozófia</h3>\n\n<ul>\n<li>Thalész – őselemek</li>\n<li>Szókratész – örök értékek</li>\n<li>Platón – ideák világa</li>\n<li>Arisztotelész – anyag és forma</li>\n</ul>\n\n<h3>Történetírás</h3>\n\n<ul>\n<li>Hérodotosz – görög–perzsa háborúk</li>\n<li>Thuküdidész – peloponnészoszi háború</li>\n</ul>\n\n<h3>Szaktudományok</h3>\n\n<ul>\n<li>Csillagászat</li>\n<li>Matematika</li>\n<li>Fizika</li>\n<li>Geológia</li>\n<li>Orvoslás</li>\n</ul>', 'Egyetemestortenelem/okorihellasz.png'),
(4, 'A magyar nép őstörténete', 2, 'A magyar nép őstörténetének kutatása:  \r\n\r\n\r\nRégészet (archeológia), embertan (antropológia), földrajz, (geológia) történeti földrajz, nyelvészet (lingvisztika), genetika, íratlan (tárgyi emlékek) és írott források (Pl.: krónikák, évkönyvek, nyelvi emlékek) stb.\r\n\r\nA magyar nép eredete:\r\n\r\nŐshaza: Adott nép számára az a hely, ahol kialakult azonosságtudata, nyelve és szokásai.\r\n\r\nMagyar őshaza elméletek: - finn-ugor, szvidéri, belső-ázsiai, sumer, Volga – Káma vidéki, stb.\r\n\r\nFeltételezett első szálláshely: Aral-tó felső vidéke, az Ob mellék-folyói mentén alakulhatott ki a magyar elnevezés (mog-eri = beszélő ember).\r\n\r\nA magyar nép a szálláshelyétől északra élő obi ugor manysi (vogul) és chanti (osztják), valamint a délebbre élő ó-iráni, óperzsa ún. türk (török) népek keveredéséből jöhetett létre (Pl.: törzsek nevei).\r\n\r\n \r\n\r\nA magyar nép vándorlása:\r\n\r\n- Magna Hungária (régi Magyarország) vagy Baskíria:\r\n\r\n- A Kr. e. 1. évezred végétől a Volga - Káma folyók és az Ural – hegység közötti terület. (Bizonyíték: Julianus barát útjai 1235 – 40 között.)\r\n\r\n-         Kr. u. 600 körül a magyarság egy része tovább vándorol délnyugati irányban \r\n\r\n- Levédia (Levedi földje):\r\n\r\na Kazár Birodalom feletti terület, a Fekete – tenger északi részén (Azovi – tenger vidéke,\r\nezen a helyen játszódik a Csodaszarvas története: Hunor s Magor, Meotisz mocsarai),\r\na kazároktól átvették a kettős fejedelemség szokását:\r\nkende (kündü = fényes Nap): a szakrális fejedelem       -\r\ngyula (tsula = fényes Hold): katonai vezető volt.\r\n(Lásd pl. Erdély címere, székely címer.)                \r\n- Etelköz:\r\n\r\n840-850 körül a magyarok és a hozzájuk szegődő katonai segédtörzsek, pl.: kavarok(hibásan: kabarok) a Kazár Birodalomban kitört lázadás miatt tovább vándoroltak nyugat felé és letelepedtek a Kárpátoktól keletre a Dnyeper és a Dnyeszter folyók között lévő pusztákon (Etelköz - Itil-küzü = folyóköz),\r\naz etelközi szállásokon élő magyarok szomszédságában jól szervezett államok voltak (Pl.: Kijevi Nagyfejedelemség, Bolgár és Bizánci Birodalom), ezért a magyar törzsek szorosabbá fűzték kapcsolataikat (vérszerződést kötöttek egymással).\r\n \r\n\r\nA honfoglalás előzményei:\r\n\r\n- Az Etelközben élő magyarok 894-ben beavatkoztak a bolgár-bizánci viszályba a bizánciak oldalán, ezért a vesztes bolgárok a magyarok etelközi szállásai mögött lévő besenyőktől kértek segítséget.\r\n\r\n- A besenyők megtámadták a magyarok szállásait, ezért a magyarok 895 tavaszán átmenekültek a Kárpátok hágóin keresztül a Kárpát-medencébe Erdély hegyei közé(turul legenda ).\r\n\r\n- Vezetőjük: Álmos majd fia Árpád és Kurszán volt.         \r\n\r\n\r\nA honfoglalás (895-907):\r\n\r\n- A magyar törzsek a Kárpát–medencét szakaszosan foglalták el:\r\n\r\n895-től Erdély és a Tiszántúl,\r\n900-ban Dunántúl,\r\n902-ben  Morvák legyőzése,\r\n904. Kurszán halála után megszűnt a kettős fejedelemség,\r\n907 győzelem a bajorok felett Pozsonynál = honfoglalás befejezése.      \r\n\r\nA honfoglaló magyarság élete:\r\n\r\n- Letelepedés: A magyar nép letelepedése törzsenként történt (földrajzi nevek):\r\n\r\nNyék,\r\nMegyer,\r\nKürt-Gyarmat,\r\nTarján,\r\nJenő,\r\nKér,\r\nKeszi\r\n + katonai segédtörzsek, pl.: kabar, varsány, székely(?).\r\n- Társadalom:\r\n\r\nbők (urak = törzsfők és nemzetségfők)\r\nvitézek( a bők fegyveres kísérete, pl.: kalandozások során)\r\ninek (közszabadok: pásztorok földművesek és szolgáló népek)\r\n\r\nA kalandozások kora ( 907-968 között):\r\n\r\n- A kárpát-medencei szállásterület elfoglalása után a törzsfők (bők) és fegyveres kíséretük (vitézek) rabló, zsákmányszerző hadjáratokat indítottak dél-, és nyugat-Európa irányában.\r\n\r\n- Okai: felbomló ősközösségi társadalom, nyugat európai uralkodók viszályai (feudális anarchia), balkáni uralkodók küzdelmei.\r\n\r\n- Európa válasza: - „A magyarok nyilaitól ments meg uram minket!” –  kezdetű imádság.\r\n\r\n- Leggyakoribb helyszínei:\r\n\r\nDél: Észak-és Dél-Itália\r\nNyugat: Bajorország, Szászország, Franciaország,\r\nKelet: Bulgária és Bizánc.\r\n- A 10. század közepére helyreállt a feudális rend Európában  a magyarok vereséget szenvedtek pl.:\r\n\r\n933-ban Merseburgnál,\r\n955-ben Augsburgnál,\r\n968-ban a Bizánci Birodalomban\r\n- A vereségek miatt változásra volt szükség, ezért megkezdődött az államalapítás előkészítése.', 'Magyartortenelem/Amagyarnepostortenete.jpeg'),
(5, 'A magyar államalapítás kora', 2, 'Az államalapítás előkészítése:\r\n\r\n- A 10. század közepére helyreállt a feudális rend Európában, ezért a magyarok katonai vereséget szenvedtek:\r\n\r\nnyugaton 933-ban Merseburgnál és 955-ben Augsburgnál, \r\na Bizánci Birodalomban 968-ban.\r\n- A fejedelmek felismerték a változtatás szükségességét. Intézkedéseik:\r\n\r\n \r\n\r\nTaksony fejedelem (955-972):\r\nleállította a kalandozásokat\r\nbékére törekedett a szomszédos népekkel (házasságpolitika)\r\nmegkezdődött a bizánci kereszténység felvétele.\r\nGéza fejedelem (972-997):\r\nfelismerte, hogy a magyarság körül megváltoztak a külpolitikai viszonyok:\r\nnyugaton I. Ottó 962-ben megalapította a Német-római Császárságot,\r\ndélen a Bizánci Birodalom kapott új erőre.\r\nmegtörte a törzs- és nemzetségfők ellenállását,\r\n973 húsvétján hittérítő papokat kért I. Ottó császártól, ezzel megkezdődött a katolikus kereszténység felvétele,\r\nfia István (Vajk) számára bajorországi Gizellát kérte feleségül, akivel lovagok érkeztek,\r\núj öröklési rendet fogadtatott el (seniorátus helyett primogenitúra),\r\nadományokat tett az egyháznak, pl.: Szt. Márton hegyi bencés apátság (Pannonhalma) megalapítása 996-ban.\r\nA királyi hatalom létrejötte:\r\n\r\n- Géza fiának, Istvánnak (997-1000 vagy 1001-ig fejedelem) le kellett győzni a hatalma ellen lázadó vezéreket:\r\n\r\n997-ben Koppány fellázadt az új öröklési rend miatt,\r\n1003-ban az erdélyi Gyula, majd\r\n1028 körül Ajtony hatalmát törte meg.\r\n- Koppány legyőzése után II. Szilveszter pápa koronát adományozott Istvánnak (koronázás 1000. vagy 1001.)\r\n\r\nIstván király államszervező tevékenysége:\r\n\r\n- Királyi vármegyéket szervezett:\r\n\r\n Élükön a királyi hatalom kihelyezett képviselője az ispán (latin: \"comes\") állt:\r\nvégrehajtotta a törvényeket,\r\nbíráskodott,\r\nbeszedette az adókat,\r\nigazgatta a várföldeket,\r\nparancsolt a katonáskodó várjobbágyoknak.\r\nAz ország összes udvarnépének közös elöljárója a nádorispán (latinul: palatinus) volt:\r\ngondoskodott az udvar ellátásáról,\r\nkezelte az udvarbirtokok javait,\r\nő volt a királyi vitézek parancsnoka és az udvari népek bírája.\r\n- A királyi udvar (latinul curia) udvarháztól udvarházig vándorolt és felélte annak jövedelmeit.\r\n\r\n- A királyi székhely Esztergom, majd Székesfehérvár lett.\r\n\r\n- Törvényeket adott ki (I. és II. TVK):\r\n\r\nintézkedett az egyház működéséről és a vallásgyakorlás biztosításáról,\r\nvédte a magántulajdont.\r\n- Pénzt veretett (dénár, két alkalom).\r\n\r\n- Okleveleket adott ki.\r\n\r\n \r\n\r\nIstván király egyházszervező tevékenysége:\r\n\r\n- Tíz egyházmegyét alapított:\r\n\r\nnyolc püspökség\r\nkét érseki tartomány (Esztergomit és Kalocsa),\r\n- A magyar egyház feje az esztergomi prímás-érsek lett.\r\n\r\n- Az egyház jövedelme kettős eredetű volt:\r\n\r\na püspökségek földadományokat kaptak a királytól,\r\na tized (decima = dézsma) is az egyházat gyarapította.\r\nA trónutódlás kérdése:\r\n\r\n- István király fia Imre herceg vadászbalesetben meghalt. Lehetséges örökösök:\r\n\r\nVazul (Géza testvérének Mihálynak a fia lehetett),\r\nOrseolo Péter (Orseolo Ottó velencei dózse és István nővérének fia)  \r\n- István Pétert jelölte utódjául, ezért:\r\n\r\nVazul összeesküvést szőtt István ellen, ezért a király megvakíttatta.\r\nVazul fiai – András, Béla és Levente – Lengyelországba menekültek.\r\nIstván ezzel a jelöléssel kizárta az Árpád-ház fiágát az öröklésből, ezért halála után (1038) trónharcok kezdődtek az országban.\r\n\r\nSzent István történelmi érdeme:\r\n\r\n- Szent István a magyar történelem egyik legkimagaslóbb egyénisége.\r\n\r\n- Nevéhez fűződik:\r\n\r\na keresztény Magyar Királyság megalapítása,\r\na független magyar egyházszervezet kiépítése,\r\naz első törvények kibocsátása.\r\n- Uralkodása alatt Magyarország a keresztény Európa része lett.\r\n\r\n- Tevékenységéért 1083-ban szentté avatták.', 'Magyartortenelem/Amagyarallamalapitaskora.jpeg'),
(6, 'Magyarország története az Árpád-korban', 2, 'Az új rend válsága:\r\n\r\n- Szent István halála után válságba került az „új rend”. Okai:\r\n\r\nfolyamatos trónharcok (1038-1074 között)\r\npogánylázadások (Vata 1046, Vata fia János 1061)\r\nkülső támadások (német és bizánci előretörés).\r\n \r\n\r\nA királyi hatalom megerősödése a 11. század végén:\r\n\r\n- A 11. század végén I. Géza (1074-77) sikeresen hárította el a bizánci veszélyt.\r\n\r\n- Öccse I. (Szent) László (1077-1095) VII. Gergely pártjára állt az invesztitúra harcokban, ezért a pápa elismerte magyar királynak. Intézkedései:\r\n\r\n három törvénykönyvet adott ki:\r\nvédte a magántulajdont,\r\nkorlátozta a szabadok („kóborlók”) mozgását,\r\nmegerősítette az egyházat:\r\njavadalmakkal (pl.: Somogyvár 1091-ben),\r\n1083-ban szentté avattatta I. Istvánt, Gellértet és Imre herceget,\r\nvisszaverte a kunok támadását,\r\nhódító hadjáratokat folytatott délre (horvát – szlavón területek),\r\n1091-ben elfoglalta Horvátországot.\r\n- I. (Könyves) Kálmán (1095 – 1116) állandó harcot vívott testvére, Álmos ellen (Álmost és fiát, Bélát megvakíttatta). Intézkedései:\r\n\r\n5 törvénykönyvet adott ki:\r\nvédte a magántulajdont (enyhít a szigoron),\r\nerőszakos letelepítések (kóborlók ellen),\r\ntiltotta a pogány szokásokat,\r\na férfiágon kihaló nemzetségek birtokai visszaszállnak a királyra,\r\npáncélos katona kiállítására kötelezi a nagybirtokosokat,\r\nhódító hadjáratokat folytatott délre (Dalmácia meghódítása 1102-ben) és keletre (halicsi hadjáratok).\r\n \r\n\r\nA küzdelmes 12. század:\r\n\r\n- Kálmán halála után a királyi hatalom ismét meggyengült. Okai:\r\n\r\ntrónviszályok 1116-1172 között,\r\nhadjáratok kudarcai (Halics - Dalmácia),\r\nösszetűzés Bizánccal (Mánuel császár beavatkozik a magyar belügyekbe).\r\n- A királyi hatalom megerősödése III. Béla (1172 – 1196) uralkodása idején ment végbe. Intézkedései:\r\n\r\nleverte a hatalma ellen lázadókat,\r\nvisszafoglalta Dalmáciát és a Szerémséget Bizánctól,\r\nösszeíratta a királyi birtokok jövedelmeit,\r\nlétrehozta a királyi kancelláriát (írásbeliség központja: oklevél kiadás, hiteleshelyek létrejötte),\r\nszentté avattatta I. Lászlót.\r\n(Nyelvi emlékünk III. Béla korából:\r\n\r\nAnonymus – Gesta Hungarorum,\r\nHalotti beszéd).\r\n \r\n\r\nA 12. század gazdasága:\r\n\r\n-  A mezőgazdaságban elterjedt a legelőváltó gazdálkodás, a szőlő-, és gyümölcstermesztés, a marha, ló, juh, sertés és a baromfi tartása.\r\n\r\n- A kézművesek önállósodtak, függetlenedtek.\r\n\r\n- Nyugati bevándorlók, hospesek (vendégek) települtek be, pl. szászok (németek) a Szepességbe és Dél-Erdélybe. Hatásukra megindult a városiasodás, és fellendült a bányászat (só, arany).\r\n\r\n \r\n\r\nA 12. század társadalma:\r\n\r\n- A királyi adományozások jelentős hatással voltak a társadalomra:\r\n\r\nnagybirtokosok:\r\n fontos tisztségeket töltöttek be (ispánok és katonai vezetők),\r\nbandériumot tartottak (magánhadsereg),\r\nközépréteg (szabad lakosság),\r\nserviensek (serviens regis = királyi szolgáló):\r\nfölddel rendelkeztek,\r\nkatonáskodtak,\r\nhospesek:\r\nszabad költözési joguk volt,\r\nfölddel rendelkeztek,\r\nszolgák:\r\na földesurak földjén élnek,\r\na földesúr szerszámaival dolgoznak.\r\n \r\n\r\nAz Aranybulla mozgalom és a magyar rendiség kialakulása:\r\n\r\n- III. Béla halála után fiai I. Imre (1196-1204) és András herceg között hatalmi harcok kezdődtek, akik támogatóiknak birtokokat adományoztak, ezért a királyi hatalom ereje jelentősen meggyengült. \r\n\r\n- II. András uralkodása idején (1205-35) a királyi földek aránya jelentősen csökkent (80-ról 30 %-ra), ezért új alapokra kívánta helyezni a gazdaságot. Intézkedései:\r\n\r\nregálék (adók, vámok-révek növelése),\r\npénzrontás (a kamara haszna növelése miatt),\r\npénzváltás bérbe adása (zsidók, arabok).\r\n- Felesége családja jelentős ajándékokban részesült, ezért 1213-ban Bánk bán és Péter ispán megölték Gertrúd királynét. (Katona József: Bánk bán).\r\n\r\n- Az adományozásból kimaradt urak, az egyház és a serviensek (királyi szolgálók) 1222-ben az Aranybulla kiadására kényszerítették a II. Andrást. (bulla: függőpecsétes oklevél)\r\n\r\nFőbb pontjai: (31 cikk)\r\n\r\nadómentesség a servienseknek,\r\nbírói ítélet nélkül tilos elítélni őket,\r\ncsak az ország védelmére köteles hadba vonulni,\r\negész vármegyét tilos adományozni,\r\nmegtiltja a pénzrontást és a mértéktelen birtokadományozást,\r\nmegtiltja az idegenek birtokviselését,\r\nellenállási záradék (király ellen való fellépés).\r\n- A király nem tartotta be a bullát, ezért 1231-ben az Aranybulla megújítása kényszerítették az egyház vezetésével:\r\n\r\nbővült az egyház bírói szerepe és ellenállási joga,\r\ncsökkent a kiváltságolt serviensek köre.\r\n \r\n\r\nAz egységes nemesség létrejötte:\r\n\r\n- 1222-ben a serviensek, várjobbágyok, bárók kiadatják az Aranybullát: megfogalmazódik az adómentesség\r\n\r\n- 1232-ben a Kehidai oklevélben a serviensek jogot kapnak helyi szinten érdekeik közös védelmére a vármegye keretein belül (nemesi vármegye kezdete, alispán, szolgabírák).\r\n\r\n- 1267-ben IV. Béla a tatárjárás után már nemesnek nevezi a servienseket is\r\n\r\n- 1351-ben Nagy Lajos kimondja az egy, és ugyanazon nemesi szabadság elvét.\r\n\r\n \r\n\r\nIV. Béla tatárjárás előtti politikája:\r\n\r\n- IV. Béla (1235-70) célja a királyi hatalom tekintélyének visszaállítása volt:\r\n\r\naz ellenszegülő főurakkal leszámolt,\r\nújravizsgálta abirtokadományozástt, és indokolt esetben birtokelkobzásokat folytatott,\r\n1235-ben Julianus barátot (domonkos szerzetes) a Magna Hungáriában lévő magyarok felkutatására küldte,\r\n1240-ben befogadta az országba a kunokat (katonai segítségként a tatár (mongol) támadás ellen)\r\na kunok nomád életmódja miatt ellentétek alkultak ki, ezért kiűzték őket.\r\n \r\n\r\nA Tatárjárás (1241márc. - 1242márc.):\r\n\r\n- 1241 márciusában Batu kán serege 2 irányból támadta meg az országot:\r\n\r\n1241. április 11-12-én a muhi csatában a magyar sereg megsemmisítő vereséget szenvedett, ezért\r\nIV. Béla Dalmáciába menekült (Trau).\r\n- A mongolok megszállták az egész országot:\r\n\r\nóriási pusztítást végeztek (a lakosság 25-30%-a meghalt),\r\nkiépítették saját adó és irányító rendszerüket,\r\n1242 tavaszán váratlanul kivonultak az országból.\r\n \r\n\r\nIV. Béla tatárjárás utáni politikája: a „második honalapítás”:\r\n\r\n- A tatárjárás után a király hozzáfogott az ország modernizálásához. Intézkedései:\r\n\r\naz ország védelmének növelése:\r\nkővárakat építtetett (Visegrád, Buda),\r\na birtokadományokat páncélos lovas haderő kiállításához kötötte,\r\nkunok-jászok befogadása és letelepítése (Kunság, Jászság),\r\naz elnéptelenedett területek újranépesítése:\r\nbetelepítések (hospesek nyugat felől),\r\nmegindult a belső vándorlás (migráció),\r\ntudatos várospolitika:\r\nvárosalapítások kiváltságokkal (cserébe kőfalak),\r\nvárosi önkormányzati jogok megadása (fehérvári jog).\r\n- 1267-ben megújította az Aranybullát:\r\n\r\nmegerősíti a serviensek jogait,\r\na serviens megszólítás helyett már nemesi megszólítást használ (ettől kezdve a nagybirtokosok neve báró lett).\r\n \r\n\r\nAz egységes jobbágyság létrejötte:\r\n\r\n- A 13. századra a volt rabszolgák és közrendű szabadok egységesedtek, földművelő paraszti csoporttá váltak.\r\n\r\n- A nyugati hospesek legfontosabb kiváltsága a szabad költözési jog volt, ezt tekinti mintának mindenki.\r\n\r\n- A 2 réteg összeolvadásából, egységesüléséből jött létre a jogilag egységes, szabad költözésű jobbágyság a 13. század végén.\r\n\r\n \r\n\r\nA tartományúri hatalom kiépülése az utolsó Árpád házi királyok idején:\r\n\r\n- Az utolsó Árpád házi királyok\r\n\r\nV. István (1270-72),\r\n\r\nIV. (Kun) László (1272-1290),\r\n\r\nIII. András (1290-1301)\r\n\r\nuralkodása idején az ország anarchiába süllyedt. Oka:\r\n\r\na  bárók a váraikba zárkózva egész tartományok felett uralkodtak (kiskirályok),\r\nudvartartást vezettek,\r\npénzt verettek,\r\nokleveleket adtak ki,\r\nháborúztak egymás és a király ellen,\r\nhatalmukat a familiáris rendszer biztosította.\r\n(A familiaritás a hűbéri rendszer magyar formája volt, melynek központjában a katonai szolgálat fejében való védelem állt, ezért nem érintette a nemesi birtokot.)\r\n\r\n- 1301-ben III. András halálával férfiágon kihalttá nyilvánították az Árpád-házat.', 'Magyartortenelem/Magyarorszagazarpadkorban.jpeg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topic_images`
--

CREATE TABLE `topic_images` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `update`
--

CREATE TABLE `update` (
  `id` int(11) NOT NULL,
  `changes` text NOT NULL,
  `change_time` datetime DEFAULT current_timestamp(),
  `topics_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `auth_id`) VALUES
(1, 'Holczman123', 'admin@torivazlat.hu', 'admin9876', 1),
(2, 'ani87', 'tanar@torivazlat.hu', 'bamba32', 2),
(3, 'nemesadam431', 'diak01@torivazlat.hu', 'nimsz75', 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A tábla indexei `loginlog`
--
ALTER TABLE `loginlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- A tábla indexei `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- A tábla indexei `topic_images`
--
ALTER TABLE `topic_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- A tábla indexei `update`
--
ALTER TABLE `update`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topics_id` (`topics_id`),
  ADD KEY `users_id` (`users_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `auth_id` (`auth_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `authority`
--
ALTER TABLE `authority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `loginlog`
--
ALTER TABLE `loginlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `topic_images`
--
ALTER TABLE `topic_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `update`
--
ALTER TABLE `update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `loginlog`
--
ALTER TABLE `loginlog`
  ADD CONSTRAINT `loginlog_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `topic_images`
--
ALTER TABLE `topic_images`
  ADD CONSTRAINT `topic_images_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);

--
-- Megkötések a táblához `update`
--
ALTER TABLE `update`
  ADD CONSTRAINT `update_ibfk_1` FOREIGN KEY (`topics_id`) REFERENCES `topics` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `update_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`auth_id`) REFERENCES `authority` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
