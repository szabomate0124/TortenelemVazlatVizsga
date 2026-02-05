-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Feb 06. 00:40
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

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
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `topics`
--

INSERT INTO `topics` (`id`, `title`, `category_id`, `content`) VALUES
(1, 'Az Őskor', 1, 'A világ keletkezése:\n\n- Az emberiség legősibb kérdése.\n\nVálaszok:\n\nmitológiai,\nvallásos,\nfilozófiai,\ntudományos tények (ősrobbanás elmélete, evolúció).\n\nAz emberré válás:\n\n- Az ember az állatvilágból alakult ki biológiai fejlődés útján. Kialakulásához hozzájárult még:\n\na gondolkodás,\naz eszközhasználat és készítés,\na beszéd,\na tűz használata.\n- Az ember kialakulása:\n\nhosszú fejlődés eredménye:\n\nfőemlősök – emberszabásúak – előember – ősember – mai ember\n\n \n\nDe:\n\nkevés a tárgyi lelet,\nnincs egyértelmű válasz.\n- Az emberiség egyik „bölcsője” Afrika keleti része lehetett, ahonnét szétvándoroltak, ezért emberi alfajok, ún. rasszok alakultak ki:\n\neuropid,\nmongoloid,\nnegrid,\nausztraloid.\n\n\nAz őskor szakaszai: \n\n(Őskor = az emberré válás és az írást ismerő kultúrák közötti időszak)\n\n- Paleolitikum: őskőkorszak – pattintott kőkor (kb. i. e. 3 millió év - i. e.   12.000 év):\n\nhordaközösségekben éltek,\nkialakult a nemek közti munkamegosztás:\nnők – gyűjtögetés (biztosabb megélhetés + szülés, ezért matriarchátus alakult ki),\nférfiak – vadászat, halászat,\neszközkészítés és használat (kő, csont, fa),\ntűz használata.\n\n- Mezolitikum: átmeneti kőkorszak (i.e. 12.000 - i. e. 10.000):\n\nMegindult az élelemtermelés:\nállattenyésztés - háziasítás (domesztikáció) útján,\nföldművelés,\nhelyszíne: „termékeny félhold” = Közel-Kelet.\n- Neolitikum: újkőkorszak – csiszolt kőkor (i. e. 10.000 - i. e. 3.000):\n\n\nAz élelemtermelés megindulása lehetővé tette a letelepedést (falvak és városok megjelenése)\nPrecízebb eszközök készültek csiszolás, fúrás, faragás, őrlés segítségével.\nMegjelentek az első mesterségek:\nfonás, szövés,\nfazekasság.\nTechnikai újítások terjedtek el, pl.:\nfazekaskorong,\nagyagedények,\nszövőszék,\neke,\nvitorla,\nkerék,\ntégla,\nfelfedezték a fémeket:\nrézkor (i. e. 4.000 - i. e. 3.000)\nbronzkor (i. e. 3.000 - i. e. 2.000)\nvaskor (i.e. 2.000 - i. e. 1.000).\n\nA változások következményei:\na felesleg kialakulása lehetővé tette a cserekereskedelmet,\nnépességrobbanás (demográfiai robbanás) ment végbe,\nmegnőtt a férfiak jelentősége (patriarchátus kialakulása),\nmegjelent a magántulajdon, ezért felbomlott az ősközösségi társadalom.\n\n \n\nAz őskor művészete:\n\n-  A paleolitikum emberének hiedelemvilágában meghatározó szerepe volt a természetfeletti erőkbe vetet hitnek.\n\n-  A természetfeletti lényekkel a varázslók (sámánok) tartották a kapcsolatot varázslás (mágia) segítségével, hogy bő termést és sikeres vadászatot érjenek el.\n\nEzekhez a mágikus szertartásokhoz köthetők az őskőkori alkotások:\n\nbarlangfestmények, karcolatok:\náltalában állatábrázolások,\nvadászmágiához, szaporító hiedelemhez kapcsolódhattak,\na leghíresebb lelőhelyek: Lascaux (Franciaország), Altamira (Spanyolország).\nszobrocskák és kis domborművek:\nelsősorban állatábrázolások,\n„női ideálok” szobrai is előkerültek (a termékenység szimbólumai),\nA leghíresebb lelőhely: Willendorf (Ausztria).\n \n\n- Az újkőkorból ránk maradt kőépítmények a megalitok („megalit” ógörög: „nagy kő”) nagy faragatlan kőtömbökből és kövekből készültek:\n\ndolmenek:\ntöbb tonnás sziklatömböket állítottak szabályos alakzatba,\nma sem tudjuk biztosan mi célból építették őket (templom vagy csillagvizsgáló is lehetett).\nmenhirek:\nfüggőlegesen felállított köve,\nszoros kapcsolatban voltak a temetkezésekkel,\nszimbolikus jelek voltak.\nösszetett kőépítmények:\negyenletes távolságban felállított hatalmas kövek,\na kultikus cselekedetek szolgálatában állt,\na legismertebb építmény az angliai Stonehenge'),
(2, 'Az ókori Kelet', 1, '- Az első államok az i. e. 4. és 3. évezredben a nagy folyók völgyében alakultak ki a Közel-Kelet („termékeny félhold” térsége), India és Kína területén.\r\n\r\n- Jellemzőik:\r\n\r\nelterjedt az öntözéses földművelés és az állattartás,\r\nhatalmi központok emelkedtek ki,\r\nkialakult az írás,\r\nlétrejött az állam , amely biztosította az:\r\nirányítást,\r\naz elosztást (csere),\r\nés a védelmet.\r\n- Az ókori keleti állam és társadalom működése:\r\n\r\naz állam élén az uralkodó állt (király, főpap, fáraó, császár stb.),\r\naz arisztokrácia tagjai a papok, hivatalnokok és a katonai vezetők voltak, akik az uralkodó hatalmát védték és segítették az állam és a hadsereg irányítását,\r\na közrendű szabadok (parasztok, kézművesek stb.), végezték a termelést,\r\na társadalom alján álló rabszolgák átmenetileg (adós rabszolgák) vagy örökre elveszítették szabadságukat.\r\n   \r\n\r\nJelentős földművelő civilizációk:\r\n\r\n\r\n- Egyiptom (\"a Nílus ajándéka\"):  \r\n\r\n \r\n\r\n- Földrajzi jellemzői:\r\nAfrikában a Nílus folyó mentén alakult ki.\r\n\r\nA rendszeres áradások termékennyé tették a földeket, ami lehetővé tette az öntözéses földművelést.\r\n\r\nTermészeti határai (sivatagok, tenger) miatt területe könnyen védhető.\r\n\r\n   - Története:\r\n\r\na Nílus völgyében két állam alakult ki: Alsó,- és Felső-Egyiptom, \r\nAha-Ménész fáraó egyesítette i. e. 2950 körül (Archaikus kor),\r\naz Óbirodalom korában a fáraók korlátlan hatalommal rendelkeztek (templom, palota és piramisépítkezések),\r\na Középbirodalom korában megnőtt az Ámon papság befolyása,\r\naz Újbirodalom fáraói hódításokat folytattak, ami jelentős gazdasági fellendüléssel járt,\r\naz 1. évezredben külső, pl. asszír majd perzsa hódítások hatására az állam összeomlott.\r\n- Az egyiptomi állam és társadalom:\r\n\r\nA fáraót isteni eredetű uralkodónak tartották, aki korlátlan hatalommal rendelkezett (vallási, katonai, politikai vezető egy személyben).\r\n\r\nA központi irányítást írnokok, hivatalnokréteg, papság, és a katonaság végezték.\r\n\r\nA termelés nagy része állami tulajdon: templomgazdaság és uralkodói birtokok.\r\n\r\nTársadalmát piramisszerű felépítés jellemezte:\r\n\r\n \r\n\r\nFáraó\r\n\r\nFőpapok és hivatalnokok\r\n\r\nK       a       t       o       n       á       k\r\n\r\nK é z m ű v e s e k  és  f ö l d m ű v e s e k\r\n\r\nRabszolgák (háborús foglyok; nem meghatározó mennyiségben). \r\n\r\n \r\n\r\n - Az egyiptomi kultura:\r\n\r\nHieroglifikus írás – képírás → csak a papi és hivatalnoki réteg használta.\r\n\r\nÍrás anyaga: papirusz.\r\n\r\nTudomány:\r\n\r\nmatematika (törtek, területmérés),\r\n\r\ncsillagászat (naptár),\r\n\r\norvostudomány (sebészet, gyógyítás, mumifikálás).\r\n\r\nIrodalom: bölcsességirodalom, himnuszok, halotti szövegek.\r\n\r\nMonumentális építmények:\r\n\r\npiramisok (Kheopsz, Kefrén, Mükerinosz),\r\n\r\ntemplomok (Luxor, Karnak),\r\n\r\nszfinx.\r\n\r\nMűvészetének jellemzői:\r\n\r\noldalnézet → szigorú szabályrendszer,\r\n\r\narany használata,\r\n\r\nidealizált ábrázolás.\r\n\r\n \r\n\r\n- Mezopotámia (folyóköz):   \r\n\r\n\r\n \r\n\r\na Tigris és Eufrátesz folyók völgye,\r\nélelemben bővelkedik, de ásványkincsekben szegény, ezért élénk kereskedelem alakult ki,\r\na termelést és az elosztást a templomgazdaság irányítja, melynek a toronytemplom (zikkurat) a központja.\r\n- Története:\r\n\r\na Sumer városállamok Mezopotámia déli részén alakultak ki az i. e.  4. évezredben,\r\njelentős találmányok: eke, kerék, iskola, \r\na városállamok rivalizáltak egymással, ezért könnyen hódították meg őket.\r\naz akkádok I. Sarrukin vezetésével egyesítették dél- és közép-Mezopotámiát a 3. évezredben,\r\naz Óbabiloni Birodalom Hammurapi uralma alatt az i. e. 18. században központosított államot hozott létre (törvénynyűjtemény).\r\n- A mezopotámiai kultura:\r\n\r\nÍrás: ékírás, agyagtáblák.\r\n\r\nTudomány: csillagászat, matematika (60-as számrendszer), naptár.\r\n\r\nVallás: sokistenhit, templomgazdaság.\r\n\r\nJogrendszer: Hammurapi törvényei.\r\n\r\nMűvészet: domborművek, paloták, mitológiai motívumok.\r\n\r\n \r\n\r\n- India:\r\n\r\n \r\n\r\n- Földrajzi keretek:\r\nIndiai-félsziget,\r\n\r\nIndus és Gangesz folyók,\r\n\r\ntermékeny völgyek, monszun klíma.\r\n\r\n -Története:\r\n\r\na dravida civilizáció az Indus-folyó völgyében hatalmas városokat épített (pl. Harappa, Mohendzsodaro),\r\na 2. évezred közepén az indoeurópai árják hódítása után kialakult a kasztrendszer,\r\na brahmanizmus tanításaira (lélekvándorlás) a buddhizmus megjelenése adott választ\r\nlegnagyobb területű állama a Maurja Birodalom volt Asóka király uralkodása idején.\r\n - Kulturája:\r\n\r\nvédikus irodalom\r\n\r\nmatematika: tízes számrendszer előzményei\r\n\r\norvostudomány, csillagászat\r\n\r\nművészet: sztúpák, elefántszobrok, oszlopfők (Asóka-oszlopok)\r\n\r\n \r\n\r\n- Kína:\r\n\r\n-Története:\r\n\r\na 4. évezredben földművelő civilizáció alakult ki a Sárga-, majd a Kék-folyó völgyében,\r\naz első állam a 2. évezredben jött létre a Sang- dinasztia uralma alatt,\r\nKínát az i. e. 3. században uralkodó Cin-si Huang-ti (első császár) egyesítette:\r\nszigorú törvények,\r\nhatalmas méretű építkezések: Nagy Fal, Nagy Csatorna,\r\negységes mértékrendszer,\r\nutak, posta,\r\ntechnikai találmányok: selyem, porcelán, iránytű, papír, könyvnyomtatás, puskapor, stb;\r\n(De az i. u. 3. századtól Kína befelé fordult, ezért elzárta magát a világtól - Nagy Fal),\r\nvallás:\r\nuniverzizmus: harmónia az ég, a föld és az ember között (jin-jang),\r\nkonfucianizmus: Kung Fu-ce – rend és hagyománytisztelet,\r\ntaoizmus: Lao-ce – összhangba kerülni a természettel.\r\n\r\nHódító népek:\r\n\r\n- Asszíria:\r\n\r\naz Asszír nép Észak Mezopotámiában élt (Assur, Ninive),\r\ntúlnépesedés és élelemhiány miatt hódításra kényszerültek és egyesítették a Közel-Kelet nagy részét,\r\na meghódított népekkel rosszul bántak, ezért fellázadtak ellenük.\r\n- Újbabiloni Birodalom:\r\n\r\naz i. e. 7-6. században egyesítették Mezopotámiát,\r\nközpontja Babilon volt (a Bibliai szerint ekkor épült \"Bábel tornya\" ).\r\n- Médek:\r\n\r\na Zagrosz-hegységben éltek,\r\nAsszíria legyőzése után építették ki birodalmukat Közép-Ázsiában.\r\n- Perzsa Birodalom:\r\n\r\nKürosz alapította az i. e. 6. sz. közepén a médek és babiloniak legyőzésével,\r\nI. Dareiosz Indiától Európáig terjesztette ki hatalmát,\r\na meghódított népekkel jól bántak,\r\na perzsa állam:\r\ntartományokból állt, élükön satrapák – kormányzók,\r\nkiépített úthálózat - királyi út,\r\negységes pénz - aranypénz (dareikos) és adórendszer,\r\nposta.\r\nvallási dualizmus jellemezte: Zarathusztra vallása (a jó és a rossz  küzdelme).\r\n \r\n\r\nKözvetítő népek:\r\n\r\n- Hettiták (\"a vas népe\"):\r\n\r\n Kis-Ázsiában éltek (indoeurópai nyelv),\r\n elkezdték feldolgozni a vasat az 1. évezredben,\r\nhódításokat indítottak délfelé (Egyiptom), de belső harcok miatt összeomlott a birodalmuk.\r\n- Föníciaiak:\r\n\r\na Libanon-hegység és a Földközi-tenger közötti városokban éltek Pl.: Türosz, Büblosz, Szidón,\r\negymással versengtek a tengeri kereskedelemben, ezért nem jött létre egység,\r\na partok mentén telepeket hoztak létre, Pl.: Karthágó (Türosz alapította i. e. 814-ben),\r\nfő termékeik: cédrusfa, tölgyfa, bíborkelme és festék, üveg, fémáruk),\r\nkialakították a 22 jelből álló mássalhangzóírást (az első hangjelölő írás).\r\n- Palesztina - a zsidó nép:\r\n\r\na Holt-tenger és a Jordán-folyó térsége,\r\nőslakóival a kánaáni népekkel keveredtek össze a keletről (a hagyomán szerint Ábrahám vezetésével) és délről (Mózes vezetésével) bevándorló héber törzsek az i. e. 13. században,\r\naz 1. évezred elején alakult ki az állam Saul király vezetésével,\r\nDávid és fia Salamon erős királyságot szerveztek és hódításokat folytattak.\r\nDe: hatalmi harcok miatt kettészakadt az állam (Izrael és Judea), ezért lakóit a hódító népek leigázták és kitelepítették,\r\na viszontagságok (Pl.: babiloni fogság) hatására kialakult az egyistenhit,\r\na zsidó nép történetét beszéli el az Ószövetség (Biblia).'),
(3, 'Az ókori Hellász', 1, '- Az ókori görög civilizáció a Balkán-félsziget déli részén, az Égei-tenger szigetvilágában, és Kis-Ázsia nyugati partvidékén alakult ki. A görögök később benépesítették a Földközi,- a Márvány,- és a Fekete-tenger partvidékeit is.\n\n \n\nA görög táj földrajzi jellemzői:\n\n\n- mediterrán éghajlat:\n\ngabona, szőlő, olajbogyó, gyümölcsök,\n juh, kecske,\n- tagolt partvidék:\n\nkikötőkben gazdag,\nfejlett hajózás és kereskedelem,\n- felszíne hegyvidéki jellegű:\n\násványkincsekben gazdag,\nfolyókban szegény.\n \n\nElső civilizációk:\n\n- Krétai civilizáció:\n\n \n\n\n\nA knószoszi palota\n\nKréta szigetén és a körülötte lévő szigetvilágban jött létre\nvároslakó civilizáció, amely fénykorát az i. e. 2. évezred elején élte, (jelentős városok, pl. Knósszosz, Mallia)\naz ókori keleti típusú államok központja a palotagazdaság volt, amely irányította a :\ntermelést\nelosztást\ncserét\nlakói békében éltek egymással és a tengeren kereskedtek\ntermészeti katasztrófák és a görög akháj törzsek támadásai miatt az i. e. 2. évezred közepén összeomlott.\n \n\n- Mükénéi civilizáció:\n\n\n\nA mükénéi fellegvár\n\na bronzfegyverekkel rendelkező akhájok hozták létre\nállandó harcot vívtak egymással a földekért\nhatalmas erődöket építettek, pl. Mükéné, Argosz\naz i. e. 13. században lerombolták Tróját (Iliász)\naz egymás ellen vívott harcokban meggyengültek és központjaik elpusztultak.\n \n\nA poliszok kialakulása:\n\n- Az i. e. 13. században újabb görög törzsek a dórok, ionok és aiolok vándoroltak be a Balkán-félszigetre, akik az i. e. 8. századig letelepültek.\n\n- Létrejött a polisz, a városközpontú állam.\n\n- A királyságot felváltotta a köztársaság:\n\naz államok élén az arisztokrácia (földbirtokosok) állt (arisztokratikus köztársaság),\na démosz (nép) nem rendelkezett politikai jogokkal.\n \n\nA görög gyarmatosítás:\n\n- Az i. e. 8. és 6. század között a görög poliszok gyarmatvárosokat hoztak létre a tengerpartok mentén. \n\n- Okai:\n\ntúlnépesedés\nkevés termőföld\npolitikai ellentétek\nkereskedelmi haszon.\n- Az anyavárosok és a gyarmatvárosok között élénk kereskedelmi kapcsolat alakult ki:\n\nanyaváros: kerámia, fémáru, textiláru\ngyarmatváros: gabona, nyersanyag, rabszolga.\n- A gyarmatvárosokon keresztül kapcsolatot tartottak a barbár (nem görög) népekkel.\n\n- Eredménye: gyors gazdasági fellendülés.\n\n \n\nA spártai állam:\n\n- Spártát a vasfegyverekkel rendelkező dórok alapították a Peloponnészosz-félsziget déli részén (Lakedaimon-Lakónia).\n\n- A túlnépesedés hatására leigázta szomszédjait (pl. Messzénia).\n\n- Társadalma:\n\nspártai polgárok\nperioikoszok – körüllakók,  a Spárta körül élő népek, kézművesek\nhelóták, Meszénia leigázott lakói, a spártai földeket művelték\n- A spártai állam működése:\n\n2 király: fővezéri és katonai feladatok\nvének tanácsa (gerúszia): bíráskodás, törvények előkészítése\nfelügyelők (ephoroszok): vétójog\nnépgyűlés (apella): tagja minden 30 év feletti spártai férfi, közfelkiáltással dönt a törvényekről és tisztviselőkről.\n- A Spártai nevelés:\n\na gyermekeket 7 éves kortól az állam nevelte\na fiúkból jó harcost\na lányokból jó anyát neveltek.\n \n\nAz athéni demokrácia kialakulása:\n\n- Athén helyzete:\n\naz ionok (ejtsd: jónok) alapították az Attikai-félszigeten,\nnem gyarmatosított, de fejlett kereskedelemmel és kézműiparral rendelkezett,\nkezdetben királyok uralkodtak, de az arisztokrácia a démosz (nép) segítségével elűzte őket,\naz államot az arkhónok irányították (a legfontosabb hivatali tisztség),\nállamforma: arisztokratikus köztársaság,\na démosz (nép) nem rendelkezik politikai jogokkal, ezért a meggazdagodott kereskedők és iparosok harcot indítottak a politikai hatalomért, melynek eredményeként kialakult a demokrácia (népuralom).\n- A demokrácia kialakulásának folyamata:\n\n i. e. 621-ben Drakón (sárkány) arkhón írásba foglalta a szokásjogot → „drákói szigor”\ni. e. 594-ben Szolón arkhón a nép számára hozott kedvező döntéseket:\neltörölte az adósrabszolgaságot,\nelengedte az adósságokat,\na politikai jogok alapja a származás helyett a vagyon lett, így többen katonáskodhattak és szólhattak bele a politikába. 4 vagyoni csoport:\n500 mérősök (500 mérő gabona, olaj, bor),\n300 mérősök,\n200 mérősök,\n200 mérő alattiak,\nkialakult a timokrácia = a vagyon uralma, ami meghatározta a jogokat és kötelességeket,\ni. e. 560-527 között Peiszisztratosz türannoszként (zsarnok) létrehozta a türanniszt (zsarnokság). Intézkedései:\naz ellenálló arisztokraták földjeit kiosztotta a démosz között\népítkezéseket indított, amivel munkát teremtett\nutazó bíróságot hozott létre\ni. e. 508-ban Kleiszthenész a területi besorolást tette a tisztségek betöltésének alapjává:\nterületi alapon – phülékre (= kerület, törzs) osztotta fel Athén lakosságát, és ezzel biztosította a démosz vezető szerepét\nelkülönítették a törvényhozást, a végrehajtást és a bíráskodást (ekklészia, bulé, Areioszpagosz, sztratégoszok, heliaia)\nbevezette a cserépszavazást (osztrakiszmosz) az egyeduralom kialakulása ellen.\n- Athén politikai intézményei:\n\nEklészia = népgyűlés:\na legfőbb hatalom\ntagja minden 20 év feletti athéni férfi polgár\nminden fontos ügyben dönt\nBulé = ötszázak tanácsa:\ntagjait területi alapon sorsolták\ntörvényjavaslatokat tett a népgyűlésnek\nHeliaia = esküdtbíróság:\n6000 fő, sorsolással választották\nfellebbviteli bíróság\naz arkhóni ítéleteket vizsgálta felül\nAreioszpagosz = Arész domb tanácsa:\na volt arkhónok tanácsának feladata a tisztviselők ellenőrzése\nSztratégosz = katonai vezető:\nnem sorsolták, hanem választották\naz állam tényleges vezetői (10 fő)\n1 éves hivatali idejük többször meghosszabbítható\n- Athén társadalma:\n\nteljes jogú athéni polgárok:\narisztokraták: nagybirtokosok\ndémosz: kereskedők, kézművesek, hajósok, parasztok\nmetoikoszok (idegenek): külföldről betelepültek\nrabszolgák\n \n\nA görög-perzsa háborúk:\n\n- Okai:\n\na Perzsa Birodalom a 6. század végén elérte és befolyása alá vonta a Kis-ázsiai görög gyarmatvárosokat\nMilétosz vezetésével a ion gyarmatvárosok fellázadtak\nAthén és szövetségesei segítették a lázadókat\na perzsák leverték a lázadást és bosszút esküdtek\n- Eseményei: \n\ni. e. 492-ben a perzsák szárazföldön és tengeren indított támadásai kudarccal végződtek\ni. e. 490-ben az Attikát támadó perzsa hadsereget a Marathóni csatában Miltiádész vezette görögök legyőzték\na győzelem után Athénban politikai küzdelem bontakozott ki háború folytatásáról \nA vitát cserépszavazás döntötte el és Athén hajóflottát épített\ni. e. 480-ban újabb perzsa támadás indult Xerxész vezetésével:\nLeonidász spártai király a thermopülai csatában feltartóztatta a perzsa hadsereget,\na szalamiszi tengeri csatában Themisztoklész vezetésével győztek a görögök,\ni. e. 479-ben a görögök újabb győzelmet értek el Plataia-nál és a Mükalé–félszigetnél.\ni. e. 478-ban Athén létrehozta a déloszi szövetséget\ni. e. 449-ben a Kalliász-féle béke zárta le a küzdelmeket.\n \n\nAthén fénykora és bukása:\n\n-  Athén fénykora:\n\na perzsák legyőzése után az i. e. 5. század közepén élte fénykorát az athéni állam Periklész vezetésével.\nJelentősen nőttek a bevételek:\nadókból,\nhadisarcból,\nezüstbányák jövedelmei,\ndéloszi szövetségesek adói,\nkereskedelemből,\na bevételekből:\nújjáépítették a várost (akropolisz, agora),\nnapidíjat fizettek a szegényeknek politikai jogaik gyakorlásáért, ezért tovább szélesedett a demokrácia.\n- Athén bukása:\n\nAthén megnövekedett katonai hatalma miatt Spárta felújította a peloponnészoszi szövetséget\na két hatalom ellentétei miatt kitört a Peloponnészoszi háború:\ni. e. 431-404 között zajlott\nkezdetben Athén tengeri, Spárta szárazföldi fölénye érvényesült\nAthén kockáztatott (megtámadta Szicíliát) és veszített, ezért megszűnt nagyhatalomnak lenni.\n \n\nMakedónia felemelkedése:\n\n- II. Fülöp uralkodása:\n\na görögökkel rokon nyelvű makedón nép a Balkán – félszigeten a görög poliszoktól északra élt\na görög poliszok meggyengülése után az i. e. 4. század közepén II. Fülöp uralma alatt gyors fellendülés ment végbe:\nhadseregreform  - makedón falanx\nhódítások (Trákia, Tesszália)\naranypénz\ni. e 338-ban a kaironeiai csatában legyőzte a görög poliszokat, akikkel közösen perzsa ellenes szövetséget hozott létre.\n \n\n- Nagy Sándor hódításai:\n\nII. Fülöp halála után fia III. Alexandrosz (Nagy Sándor) helyreállította a makedón-görög szövetséget és megtámadta a Perzsa Birodalmat\nkatonai sikerei:\na Granikosz—folyónál legyőzte a perzsa szatrapákat\nfelszabadította a kis-ázsiai görögöket\ni. e. 333-ban győzelmet aratott Isszosznál III. Dareiosz felett\nelfoglalta a Föníciát, Palesztinát és Egyiptomot\ni. e. 331-ben döntő győzelmet aratott Gaugamélánál a perzsákon\nmeghódította Belső-Ázsiát és az Indus vidékét\neredményei:\negyesítette a görög és a keleti kultúrákat = hellénizmus (görögösítés)\negységes mértékrendszert vezetett be\negységes pénzt veretett\núj utakat épített\nvárosokat alapított és görögökkel népesítette be őket (Alexandriák).\n- A hellenisztikus utódállamok:\n\nNagy Sándor halála után a makedón birodalom részekre szakadt:\nMakedónia (Antigonidák)\nEgyiptom (Ptolemaidák)\nSzíria (Szeleukidák)\nPergamon (Attalidák) tartománya.\nA görög és a keleti kultúra egyesítéséből alakult ki a hellenizmus művészete és tudománya, amely az i. e. 4-1. századbban terjedt el a volt Perzsa Birodalom területén.\n \n\nA görög életmód, művészetek és tudományok\n\nÉletmód:\n\n- Az élet az emberek otthonában és közterületeken zajlott.\n\n- A házak ablaktalanok, belső udvaruk volt, a nők és a férfiak helyiségei elkülönültek:\n\nkevés bútort használtak, pl.: kereveteket és ládákat,\nmozaikpadló, kerámiadíszek.\n- Étkezés: kása, kenyér, hal, sajt, gyümölcsök, olajbogyó, hús. \n\n- Ruházat: khitón, bőrsaru, bőrcsizma.\n\n \n\nMűvészetek:\n\nÉpítészet:\n\nközépületek: színházak, templomok, stadionok építése, (üzleti, vallási, politikai élet keretei),\nagora: a város piaca, a polisz központja,\na görög építészet jellegzetes eleme az oszlop, oszloprendek:\ndór,\njón,\nkorinthoszi,\njellegzetességei:\ndíszítő domborműsor: fríz,\nháromszög alakú timpanon,\noszlopsorok (sztoa),\nSzobrászat:\n\népületek díszítése szobrokkal, frízzel,\nszobrászatban kiemelkedő alkotások születtek:\nmozgalmas,\nélethű,\nérzelmeket kifejező szobrok, főként a Kr.e. V-VI. században.\nJelentős szobrászok:\nMüron,\nPheidiasz,\nLüszipposz,\nSzínház:\n\nDionüszosz tiszteletére előadott szertartások:\npolitikai,\nvallási és\nkulturális célzat.\n- Kezdetben az agorán adták elő a műveket, majd szabadtéri színházakat építettek.\n\n- Az előadásokon való részvételért később napidíjat fizettek (pl. Periklész korában Athénban).\n\nJelentős szerzők:\n\n- Aiszkhülosz,\n\n- Szophoklész,\n\n- Euripidész.\n\nMitológia:\n\n- Az ókori görögök több istenben hittek (politeizmus). Az istenek és az emberek kapcsolatát beszéli el a görög mitológia:\n\nisteneik emberszerűek voltak,\nállandó kapcsolatot tartottak velük:\náldozatok, szertartások (pl. Delphoi és Dodonai jósda),\nsport (pl. olympiai játékok),\nművészetek útján.\nFilozófia:\n\n- Kezdetben a tudományágak még nem váltak szét:\n\na természetet,\npolitikát,\nművészeteket egységben vizsgálták.\n- A filozófia irányzatai:\n\na naiv materialisták (Pl.: Thalész) az őselemekre (föld, víz, tűz, levegő) vezették vissza a világ keletkezését (naiv természetfilozófia).\na szofisták a társadalom törvényeit kezdték vizsgálni:\nSzókratész:\nvannak örök érvényű értékek: igazság, szeretet.\nNem az egyén határozza meg őket, ezek önmagukban is léteznek.\nPlatón:\ncsak a fogalmak állandóak, a tapasztalati világ változik.\nezek az ideák világában léteznek, a tapasztalati megvalósulások csak ezeknek az árnyképe.\nArisztotelész:\nanyagi és a szellemi világ valósan létező dolgok,\na szellem magasabb rendű, az ad formát az anyagnak.\n - Történetírás:\n\nönálló tudománnyá vált,\nhíres görög történetírók: Hérodotosz („a történetírás atyja” - a görög-perzsa háborúk leírása) és Thuküdidész (a peloponnészoszi háború leírása).\n - A szaktudományok elváltak a filozófiától és gyors fejlődésnek indultak a hellenizmus korában:\n\ncsillagászat,\nmatematika,\nfizika,\ngeológia,\norvoslás.'),
(4, 'A magyar nép őstörténete', 2, 'A magyar nép őstörténetének kutatása:  \r\n\r\n\r\nRégészet (archeológia), embertan (antropológia), földrajz, (geológia) történeti földrajz, nyelvészet (lingvisztika), genetika, íratlan (tárgyi emlékek) és írott források (Pl.: krónikák, évkönyvek, nyelvi emlékek) stb.\r\n\r\nA magyar nép eredete:\r\n\r\nŐshaza: Adott nép számára az a hely, ahol kialakult azonosságtudata, nyelve és szokásai.\r\n\r\nMagyar őshaza elméletek: - finn-ugor, szvidéri, belső-ázsiai, sumer, Volga – Káma vidéki, stb.\r\n\r\nFeltételezett első szálláshely: Aral-tó felső vidéke, az Ob mellék-folyói mentén alakulhatott ki a magyar elnevezés (mog-eri = beszélő ember).\r\n\r\nA magyar nép a szálláshelyétől északra élő obi ugor manysi (vogul) és chanti (osztják), valamint a délebbre élő ó-iráni, óperzsa ún. türk (török) népek keveredéséből jöhetett létre (Pl.: törzsek nevei).\r\n\r\n \r\n\r\nA magyar nép vándorlása:\r\n\r\n- Magna Hungária (régi Magyarország) vagy Baskíria:\r\n\r\n- A Kr. e. 1. évezred végétől a Volga - Káma folyók és az Ural – hegység közötti terület. (Bizonyíték: Julianus barát útjai 1235 – 40 között.)\r\n\r\n-         Kr. u. 600 körül a magyarság egy része tovább vándorol délnyugati irányban \r\n\r\n- Levédia (Levedi földje):\r\n\r\na Kazár Birodalom feletti terület, a Fekete – tenger északi részén (Azovi – tenger vidéke,\r\nezen a helyen játszódik a Csodaszarvas története: Hunor s Magor, Meotisz mocsarai),\r\na kazároktól átvették a kettős fejedelemség szokását:\r\nkende (kündü = fényes Nap): a szakrális fejedelem       -\r\ngyula (tsula = fényes Hold): katonai vezető volt.\r\n(Lásd pl. Erdély címere, székely címer.)                \r\n- Etelköz:\r\n\r\n840-850 körül a magyarok és a hozzájuk szegődő katonai segédtörzsek, pl.: kavarok(hibásan: kabarok) a Kazár Birodalomban kitört lázadás miatt tovább vándoroltak nyugat felé és letelepedtek a Kárpátoktól keletre a Dnyeper és a Dnyeszter folyók között lévő pusztákon (Etelköz - Itil-küzü = folyóköz),\r\naz etelközi szállásokon élő magyarok szomszédságában jól szervezett államok voltak (Pl.: Kijevi Nagyfejedelemség, Bolgár és Bizánci Birodalom), ezért a magyar törzsek szorosabbá fűzték kapcsolataikat (vérszerződést kötöttek egymással).\r\n \r\n\r\nA honfoglalás előzményei:\r\n\r\n- Az Etelközben élő magyarok 894-ben beavatkoztak a bolgár-bizánci viszályba a bizánciak oldalán, ezért a vesztes bolgárok a magyarok etelközi szállásai mögött lévő besenyőktől kértek segítséget.\r\n\r\n- A besenyők megtámadták a magyarok szállásait, ezért a magyarok 895 tavaszán átmenekültek a Kárpátok hágóin keresztül a Kárpát-medencébe Erdély hegyei közé(turul legenda ).\r\n\r\n- Vezetőjük: Álmos majd fia Árpád és Kurszán volt.         \r\n\r\n\r\nA honfoglalás (895-907):\r\n\r\n- A magyar törzsek a Kárpát–medencét szakaszosan foglalták el:\r\n\r\n895-től Erdély és a Tiszántúl,\r\n900-ban Dunántúl,\r\n902-ben  Morvák legyőzése,\r\n904. Kurszán halála után megszűnt a kettős fejedelemség,\r\n907 győzelem a bajorok felett Pozsonynál = honfoglalás befejezése.      \r\n\r\nA honfoglaló magyarság élete:\r\n\r\n- Letelepedés: A magyar nép letelepedése törzsenként történt (földrajzi nevek):\r\n\r\nNyék,\r\nMegyer,\r\nKürt-Gyarmat,\r\nTarján,\r\nJenő,\r\nKér,\r\nKeszi\r\n + katonai segédtörzsek, pl.: kabar, varsány, székely(?).\r\n- Társadalom:\r\n\r\nbők (urak = törzsfők és nemzetségfők)\r\nvitézek( a bők fegyveres kísérete, pl.: kalandozások során)\r\ninek (közszabadok: pásztorok földművesek és szolgáló népek)\r\n\r\nA kalandozások kora ( 907-968 között):\r\n\r\n- A kárpát-medencei szállásterület elfoglalása után a törzsfők (bők) és fegyveres kíséretük (vitézek) rabló, zsákmányszerző hadjáratokat indítottak dél-, és nyugat-Európa irányában.\r\n\r\n- Okai: felbomló ősközösségi társadalom, nyugat európai uralkodók viszályai (feudális anarchia), balkáni uralkodók küzdelmei.\r\n\r\n- Európa válasza: - „A magyarok nyilaitól ments meg uram minket!” –  kezdetű imádság.\r\n\r\n- Leggyakoribb helyszínei:\r\n\r\nDél: Észak-és Dél-Itália\r\nNyugat: Bajorország, Szászország, Franciaország,\r\nKelet: Bulgária és Bizánc.\r\n- A 10. század közepére helyreállt a feudális rend Európában  a magyarok vereséget szenvedtek pl.:\r\n\r\n933-ban Merseburgnál,\r\n955-ben Augsburgnál,\r\n968-ban a Bizánci Birodalomban\r\n- A vereségek miatt változásra volt szükség, ezért megkezdődött az államalapítás előkészítése.'),
(5, 'A magyar államalapítás kora', 2, 'Az államalapítás előkészítése:\r\n\r\n- A 10. század közepére helyreállt a feudális rend Európában, ezért a magyarok katonai vereséget szenvedtek:\r\n\r\nnyugaton 933-ban Merseburgnál és 955-ben Augsburgnál, \r\na Bizánci Birodalomban 968-ban.\r\n- A fejedelmek felismerték a változtatás szükségességét. Intézkedéseik:\r\n\r\n \r\n\r\nTaksony fejedelem (955-972):\r\nleállította a kalandozásokat\r\nbékére törekedett a szomszédos népekkel (házasságpolitika)\r\nmegkezdődött a bizánci kereszténység felvétele.\r\nGéza fejedelem (972-997):\r\nfelismerte, hogy a magyarság körül megváltoztak a külpolitikai viszonyok:\r\nnyugaton I. Ottó 962-ben megalapította a Német-római Császárságot,\r\ndélen a Bizánci Birodalom kapott új erőre.\r\nmegtörte a törzs- és nemzetségfők ellenállását,\r\n973 húsvétján hittérítő papokat kért I. Ottó császártól, ezzel megkezdődött a katolikus kereszténység felvétele,\r\nfia István (Vajk) számára bajorországi Gizellát kérte feleségül, akivel lovagok érkeztek,\r\núj öröklési rendet fogadtatott el (seniorátus helyett primogenitúra),\r\nadományokat tett az egyháznak, pl.: Szt. Márton hegyi bencés apátság (Pannonhalma) megalapítása 996-ban.\r\nA királyi hatalom létrejötte:\r\n\r\n- Géza fiának, Istvánnak (997-1000 vagy 1001-ig fejedelem) le kellett győzni a hatalma ellen lázadó vezéreket:\r\n\r\n997-ben Koppány fellázadt az új öröklési rend miatt,\r\n1003-ban az erdélyi Gyula, majd\r\n1028 körül Ajtony hatalmát törte meg.\r\n- Koppány legyőzése után II. Szilveszter pápa koronát adományozott Istvánnak (koronázás 1000. vagy 1001.)\r\n\r\nIstván király államszervező tevékenysége:\r\n\r\n- Királyi vármegyéket szervezett:\r\n\r\n Élükön a királyi hatalom kihelyezett képviselője az ispán (latin: \"comes\") állt:\r\nvégrehajtotta a törvényeket,\r\nbíráskodott,\r\nbeszedette az adókat,\r\nigazgatta a várföldeket,\r\nparancsolt a katonáskodó várjobbágyoknak.\r\nAz ország összes udvarnépének közös elöljárója a nádorispán (latinul: palatinus) volt:\r\ngondoskodott az udvar ellátásáról,\r\nkezelte az udvarbirtokok javait,\r\nő volt a királyi vitézek parancsnoka és az udvari népek bírája.\r\n- A királyi udvar (latinul curia) udvarháztól udvarházig vándorolt és felélte annak jövedelmeit.\r\n\r\n- A királyi székhely Esztergom, majd Székesfehérvár lett.\r\n\r\n- Törvényeket adott ki (I. és II. TVK):\r\n\r\nintézkedett az egyház működéséről és a vallásgyakorlás biztosításáról,\r\nvédte a magántulajdont.\r\n- Pénzt veretett (dénár, két alkalom).\r\n\r\n- Okleveleket adott ki.\r\n\r\n \r\n\r\nIstván király egyházszervező tevékenysége:\r\n\r\n- Tíz egyházmegyét alapított:\r\n\r\nnyolc püspökség\r\nkét érseki tartomány (Esztergomit és Kalocsa),\r\n- A magyar egyház feje az esztergomi prímás-érsek lett.\r\n\r\n- Az egyház jövedelme kettős eredetű volt:\r\n\r\na püspökségek földadományokat kaptak a királytól,\r\na tized (decima = dézsma) is az egyházat gyarapította.\r\nA trónutódlás kérdése:\r\n\r\n- István király fia Imre herceg vadászbalesetben meghalt. Lehetséges örökösök:\r\n\r\nVazul (Géza testvérének Mihálynak a fia lehetett),\r\nOrseolo Péter (Orseolo Ottó velencei dózse és István nővérének fia)  \r\n- István Pétert jelölte utódjául, ezért:\r\n\r\nVazul összeesküvést szőtt István ellen, ezért a király megvakíttatta.\r\nVazul fiai – András, Béla és Levente – Lengyelországba menekültek.\r\nIstván ezzel a jelöléssel kizárta az Árpád-ház fiágát az öröklésből, ezért halála után (1038) trónharcok kezdődtek az országban.\r\n\r\nSzent István történelmi érdeme:\r\n\r\n- Szent István a magyar történelem egyik legkimagaslóbb egyénisége.\r\n\r\n- Nevéhez fűződik:\r\n\r\na keresztény Magyar Királyság megalapítása,\r\na független magyar egyházszervezet kiépítése,\r\naz első törvények kibocsátása.\r\n- Uralkodása alatt Magyarország a keresztény Európa része lett.\r\n\r\n- Tevékenységéért 1083-ban szentté avatták.'),
(6, 'Magyarország története az Árpád-korban', 2, 'Az új rend válsága:\r\n\r\n- Szent István halála után válságba került az „új rend”. Okai:\r\n\r\nfolyamatos trónharcok (1038-1074 között)\r\npogánylázadások (Vata 1046, Vata fia János 1061)\r\nkülső támadások (német és bizánci előretörés).\r\n \r\n\r\nA királyi hatalom megerősödése a 11. század végén:\r\n\r\n- A 11. század végén I. Géza (1074-77) sikeresen hárította el a bizánci veszélyt.\r\n\r\n- Öccse I. (Szent) László (1077-1095) VII. Gergely pártjára állt az invesztitúra harcokban, ezért a pápa elismerte magyar királynak. Intézkedései:\r\n\r\n három törvénykönyvet adott ki:\r\nvédte a magántulajdont,\r\nkorlátozta a szabadok („kóborlók”) mozgását,\r\nmegerősítette az egyházat:\r\njavadalmakkal (pl.: Somogyvár 1091-ben),\r\n1083-ban szentté avattatta I. Istvánt, Gellértet és Imre herceget,\r\nvisszaverte a kunok támadását,\r\nhódító hadjáratokat folytatott délre (horvát – szlavón területek),\r\n1091-ben elfoglalta Horvátországot.\r\n- I. (Könyves) Kálmán (1095 – 1116) állandó harcot vívott testvére, Álmos ellen (Álmost és fiát, Bélát megvakíttatta). Intézkedései:\r\n\r\n5 törvénykönyvet adott ki:\r\nvédte a magántulajdont (enyhít a szigoron),\r\nerőszakos letelepítések (kóborlók ellen),\r\ntiltotta a pogány szokásokat,\r\na férfiágon kihaló nemzetségek birtokai visszaszállnak a királyra,\r\npáncélos katona kiállítására kötelezi a nagybirtokosokat,\r\nhódító hadjáratokat folytatott délre (Dalmácia meghódítása 1102-ben) és keletre (halicsi hadjáratok).\r\n \r\n\r\nA küzdelmes 12. század:\r\n\r\n- Kálmán halála után a királyi hatalom ismét meggyengült. Okai:\r\n\r\ntrónviszályok 1116-1172 között,\r\nhadjáratok kudarcai (Halics - Dalmácia),\r\nösszetűzés Bizánccal (Mánuel császár beavatkozik a magyar belügyekbe).\r\n- A királyi hatalom megerősödése III. Béla (1172 – 1196) uralkodása idején ment végbe. Intézkedései:\r\n\r\nleverte a hatalma ellen lázadókat,\r\nvisszafoglalta Dalmáciát és a Szerémséget Bizánctól,\r\nösszeíratta a királyi birtokok jövedelmeit,\r\nlétrehozta a királyi kancelláriát (írásbeliség központja: oklevél kiadás, hiteleshelyek létrejötte),\r\nszentté avattatta I. Lászlót.\r\n(Nyelvi emlékünk III. Béla korából:\r\n\r\nAnonymus – Gesta Hungarorum,\r\nHalotti beszéd).\r\n \r\n\r\nA 12. század gazdasága:\r\n\r\n-  A mezőgazdaságban elterjedt a legelőváltó gazdálkodás, a szőlő-, és gyümölcstermesztés, a marha, ló, juh, sertés és a baromfi tartása.\r\n\r\n- A kézművesek önállósodtak, függetlenedtek.\r\n\r\n- Nyugati bevándorlók, hospesek (vendégek) települtek be, pl. szászok (németek) a Szepességbe és Dél-Erdélybe. Hatásukra megindult a városiasodás, és fellendült a bányászat (só, arany).\r\n\r\n \r\n\r\nA 12. század társadalma:\r\n\r\n- A királyi adományozások jelentős hatással voltak a társadalomra:\r\n\r\nnagybirtokosok:\r\n fontos tisztségeket töltöttek be (ispánok és katonai vezetők),\r\nbandériumot tartottak (magánhadsereg),\r\nközépréteg (szabad lakosság),\r\nserviensek (serviens regis = királyi szolgáló):\r\nfölddel rendelkeztek,\r\nkatonáskodtak,\r\nhospesek:\r\nszabad költözési joguk volt,\r\nfölddel rendelkeztek,\r\nszolgák:\r\na földesurak földjén élnek,\r\na földesúr szerszámaival dolgoznak.\r\n \r\n\r\nAz Aranybulla mozgalom és a magyar rendiség kialakulása:\r\n\r\n- III. Béla halála után fiai I. Imre (1196-1204) és András herceg között hatalmi harcok kezdődtek, akik támogatóiknak birtokokat adományoztak, ezért a királyi hatalom ereje jelentősen meggyengült. \r\n\r\n- II. András uralkodása idején (1205-35) a királyi földek aránya jelentősen csökkent (80-ról 30 %-ra), ezért új alapokra kívánta helyezni a gazdaságot. Intézkedései:\r\n\r\nregálék (adók, vámok-révek növelése),\r\npénzrontás (a kamara haszna növelése miatt),\r\npénzváltás bérbe adása (zsidók, arabok).\r\n- Felesége családja jelentős ajándékokban részesült, ezért 1213-ban Bánk bán és Péter ispán megölték Gertrúd királynét. (Katona József: Bánk bán).\r\n\r\n- Az adományozásból kimaradt urak, az egyház és a serviensek (királyi szolgálók) 1222-ben az Aranybulla kiadására kényszerítették a II. Andrást. (bulla: függőpecsétes oklevél)\r\n\r\nFőbb pontjai: (31 cikk)\r\n\r\nadómentesség a servienseknek,\r\nbírói ítélet nélkül tilos elítélni őket,\r\ncsak az ország védelmére köteles hadba vonulni,\r\negész vármegyét tilos adományozni,\r\nmegtiltja a pénzrontást és a mértéktelen birtokadományozást,\r\nmegtiltja az idegenek birtokviselését,\r\nellenállási záradék (király ellen való fellépés).\r\n- A király nem tartotta be a bullát, ezért 1231-ben az Aranybulla megújítása kényszerítették az egyház vezetésével:\r\n\r\nbővült az egyház bírói szerepe és ellenállási joga,\r\ncsökkent a kiváltságolt serviensek köre.\r\n \r\n\r\nAz egységes nemesség létrejötte:\r\n\r\n- 1222-ben a serviensek, várjobbágyok, bárók kiadatják az Aranybullát: megfogalmazódik az adómentesség\r\n\r\n- 1232-ben a Kehidai oklevélben a serviensek jogot kapnak helyi szinten érdekeik közös védelmére a vármegye keretein belül (nemesi vármegye kezdete, alispán, szolgabírák).\r\n\r\n- 1267-ben IV. Béla a tatárjárás után már nemesnek nevezi a servienseket is\r\n\r\n- 1351-ben Nagy Lajos kimondja az egy, és ugyanazon nemesi szabadság elvét.\r\n\r\n \r\n\r\nIV. Béla tatárjárás előtti politikája:\r\n\r\n- IV. Béla (1235-70) célja a királyi hatalom tekintélyének visszaállítása volt:\r\n\r\naz ellenszegülő főurakkal leszámolt,\r\nújravizsgálta abirtokadományozástt, és indokolt esetben birtokelkobzásokat folytatott,\r\n1235-ben Julianus barátot (domonkos szerzetes) a Magna Hungáriában lévő magyarok felkutatására küldte,\r\n1240-ben befogadta az országba a kunokat (katonai segítségként a tatár (mongol) támadás ellen)\r\na kunok nomád életmódja miatt ellentétek alkultak ki, ezért kiűzték őket.\r\n \r\n\r\nA Tatárjárás (1241márc. - 1242márc.):\r\n\r\n- 1241 márciusában Batu kán serege 2 irányból támadta meg az országot:\r\n\r\n1241. április 11-12-én a muhi csatában a magyar sereg megsemmisítő vereséget szenvedett, ezért\r\nIV. Béla Dalmáciába menekült (Trau).\r\n- A mongolok megszállták az egész országot:\r\n\r\nóriási pusztítást végeztek (a lakosság 25-30%-a meghalt),\r\nkiépítették saját adó és irányító rendszerüket,\r\n1242 tavaszán váratlanul kivonultak az országból.\r\n \r\n\r\nIV. Béla tatárjárás utáni politikája: a „második honalapítás”:\r\n\r\n- A tatárjárás után a király hozzáfogott az ország modernizálásához. Intézkedései:\r\n\r\naz ország védelmének növelése:\r\nkővárakat építtetett (Visegrád, Buda),\r\na birtokadományokat páncélos lovas haderő kiállításához kötötte,\r\nkunok-jászok befogadása és letelepítése (Kunság, Jászság),\r\naz elnéptelenedett területek újranépesítése:\r\nbetelepítések (hospesek nyugat felől),\r\nmegindult a belső vándorlás (migráció),\r\ntudatos várospolitika:\r\nvárosalapítások kiváltságokkal (cserébe kőfalak),\r\nvárosi önkormányzati jogok megadása (fehérvári jog).\r\n- 1267-ben megújította az Aranybullát:\r\n\r\nmegerősíti a serviensek jogait,\r\na serviens megszólítás helyett már nemesi megszólítást használ (ettől kezdve a nagybirtokosok neve báró lett).\r\n \r\n\r\nAz egységes jobbágyság létrejötte:\r\n\r\n- A 13. századra a volt rabszolgák és közrendű szabadok egységesedtek, földművelő paraszti csoporttá váltak.\r\n\r\n- A nyugati hospesek legfontosabb kiváltsága a szabad költözési jog volt, ezt tekinti mintának mindenki.\r\n\r\n- A 2 réteg összeolvadásából, egységesüléséből jött létre a jogilag egységes, szabad költözésű jobbágyság a 13. század végén.\r\n\r\n \r\n\r\nA tartományúri hatalom kiépülése az utolsó Árpád házi királyok idején:\r\n\r\n- Az utolsó Árpád házi királyok\r\n\r\nV. István (1270-72),\r\n\r\nIV. (Kun) László (1272-1290),\r\n\r\nIII. András (1290-1301)\r\n\r\nuralkodása idején az ország anarchiába süllyedt. Oka:\r\n\r\na  bárók a váraikba zárkózva egész tartományok felett uralkodtak (kiskirályok),\r\nudvartartást vezettek,\r\npénzt verettek,\r\nokleveleket adtak ki,\r\nháborúztak egymás és a király ellen,\r\nhatalmukat a familiáris rendszer biztosította.\r\n(A familiaritás a hűbéri rendszer magyar formája volt, melynek központjában a katonai szolgálat fejében való védelem állt, ezért nem érintette a nemesi birtokot.)\r\n\r\n- 1301-ben III. András halálával férfiágon kihalttá nyilvánították az Árpád-házat.');

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
  ADD KEY `update_id` (`topics_id`),
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
