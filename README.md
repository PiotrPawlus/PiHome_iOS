# Apikacja na platformę iOS

**Aplikacja mobilna na platformę iOS do obsługi systemu inteligentnego domu zbudowanego na platformie Raspberry Pi**
**(ang. Smart home mobile application for iOS based devices, with support for Raspberry Pi devices)**

**Politechnika Krakowska im. Tadeusza Kościuszki**
**Wydział Inżynierii Elektrycznej i Komputerowej Politechniki Krakowskiej**

Wykonał: **Piotr Pawluś**

Promotor: **Dr Damian Grela**

Projekt wykonany przez w ramach pracy inżynieryjskiej.

* **Główne założenia**:
  - Połączenie z serwerem REST api umieszczonym na RPi w lokalnej sieci WiFi
  - Podział użytkowników na administrację systemu oraz na użytkoników.
  - Możliwość samodzielnej rejestracji użytkownika w systemie.
  - Akceptacja rejestracji nowych użytkowników przez administratora systemu.
  - Autentykacja użytkownika w aplikacji.
  - Możliwość dodowania przez administratora systemu dwóch typów urządzeń (zasada działania przełącznika i zazada działania przycisku).
  - Możliwość usuwania urządzeń przez administratora.
  - Możliwość zmiany stanu urządzeń przez oba typy użytkowników.
  - Możliwość otrzymania listy wszystkich urządzeń dla obu typów użytkowników.
  - Możliwość otrzymania listy wszystkich użytkowników przez administratora systemu.
  - Możliwość nadawania praw do autentykacji w systemie oraz praw administracyjnych przez administratora systemu.
  - Przyspieszone logowanie do systemu przy użyciu Touch ID
  - Użycie wewnątrz aplikacji 3D Touch
  - Dostosowanie wyglądu aplikacji do wszystkich wielkości dostępnych użądzeń

* **Wykorzystane narzędzia**:
  - Język programowania - Swift
  - System relacyjnej bazy danych - SQLite
  - System - iOS 10 >
  - Główne biblioteki - UIKit, CoreData
  - Dodatkowe biblioteki - [AFNetworking](https://cocoapods.org/pods/AFNetworking), [Keychain](https://cocoapods.org/pods/Keychain), [MagicalRecord](https://cocoapods.org/pods/MagicalRecord), [SideMenu](https://cocoapods.org/pods/SideMenu), [SVProgressHUD](https://cocoapods.org/pods/SVProgressHUD)

Cześć [systemu na platformę Raspberry Pi](https://github.com/PiotrPawlus/PiHome_RPi)
