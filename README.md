# Történelem Vázlat Vizsga
## Vizsgaremek – 2025–2026

A Történelem Vázlat Vizsga projekt célja a korábbi statikus oktatási weboldal teljes modernizálása egy korszerű, adatbázis-alapú full-stack webalkalmazássá.

A rendszer egy hosszú távon fenntartható, bővíthető, oktatási célú történelem lexikon, amely strukturált tartalomkezelést és felhasználói jogosultságokat biztosít.

## Projekt célja

A fejlesztés kiindulási pontja a korábbi:

- statikus
- manuálisan szerkesztett
- adatbázis nélküli

**torivazlat.hupont.hu** weboldal volt.

Az új rendszer célja:

- adatbázis-alapú működés
- felhasználói autentikáció
- adminisztrálható tartalom
- reszponzív modern felület
- strukturált történelmi tudásbázis létrehozása

## Rendszerarchitektúra

A projekt háromrétegű architektúrát alkalmaz:

| Réteg     | Technológia          | Funkció                    |
|-----------|--------------------|---------------------------|
| Frontend  | React (SPA)        | Felhasználói felület       |
| Backend   | Node.js + Express  | REST API                   |
| Adatbázis | MySQL              | Strukturált adattárolás    |

Az adatáramlás:

`React → HTTP kérés → Node API → MySQL → JSON válasz → React UI`

## Frontend

A frontend egy **Single Page Application (SPA)**, modern felhasználói élményt biztosítva.

**Főbb jellemzők:**

- React komponens-alapú architektúra
- React Router alapú navigáció
- Dinamikus kategória- és témamegjelenítés
- TinyMCE WYSIWYG szerkesztő
- Reszponzív Bootstrap grid
- Animált témakártyák
- Egységes CSS design rendszer
- Keresőmező
- Paraméterezett tartalmi oldalak

**A rendszer képes:**

- történelmi témák listázására
- részletes tartalom megjelenítésére
- adminisztrációs szerkesztésre

## Backend

A backend **REST API** alapú Node.js szerver.

**Funkciók:**

- GET végpontok a témák lekérdezésére
- POST alapú felhasználói regisztráció és bejelentkezés
- Middleware alapú jogosultságkezelés
- API-alapú adatkommunikáció

## Adatbázis

**MySQL** alapú strukturált adattárolás:

- Felhasználók
- Történelmi témák
- Kategóriák
- Jogosultsági szintek
- Témákhoz tartozó képek
- Időrendi struktúra

A jelszavak titkosítva kerülnek tárolásra.

## Design koncepció

A vizuális rendszer kialakítása során a cél egy:

- letisztult
- jól olvasható
- oktatásra optimalizált
- modern felület létrehozása volt

A design szemlélet inspirációja a **Moholy-Nagy Művészeti Egyetem** vizuális és tipográfiai megközelítése.

**Főbb elemek:**

- Egységes színrendszer (CSS változók)
- Magas kontraszt
- Strukturált tipográfia
- Modern lábléc ikonokkal
- Mobilbarát elrendezés

## Biztonság

A rendszer tartalmaz:

- Autentikációs mechanizmust
- Titkosított jelszótárolást
- Middleware alapú védelem
- XSS elleni backend validációt

## Bővíthetőség

A moduláris felépítés lehetővé teszi:

- új témák hozzáadását
- új kategóriák létrehozását
- admin felület bővítését
- jövőbeli keresési / szűrési funkciók integrálását

## Fejlesztési idővonal

| Időszak  | Mérföldkő                                   |
|----------|--------------------------------------------|
| 2025.11  | Projektindítás, alap specifikáció          |
| 2025.11  | Adatbázisterv elkészítése                  |
| 2025.12  | Tartalmi és vizuális struktúra stabilizálása |
| 2026.01  | React + Node architektúra kialakítása      |
| 2026.02  | Teljes adatáramlás, autentikáció bevezetése |

## Fejlesztők

- Zsupos Dominik
- Szabó Máté

## Összegzés

A projekt egy teljes értékű modern webalkalmazássá fejlődött, amely:

- React frontenddel
- Node.js backenddel
- MySQL adatbázissal

működik.

A rendszer:

- oktatási célra optimalizált
- skálázható
- fenntartható
- modern webfejlesztési elvek szerint készült
