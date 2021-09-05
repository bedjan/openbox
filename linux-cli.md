<html>
<head>
<base target="_blank">
<title>Linux</title>
</head>
<body>
<meta charset=(UTF-8(>
<meta name=(viewport( content=(width=device-width, initial-scale=1">
<style>
html {color: white;background-color:black;text-align: left;} 
a:link { color: #33adff;}
a:visited {color: #ff9933;}
a:hover {  color: #ffff1a;}
a:active {  color: #33ff33;}
</style>


---
title: "Linux-cli"
output:
  html_document:
    toc: yes
pagetitle: Linux-cli
---


<details open>
<summary>- Menu -</summary>

[Web](index.php)
[Multimedia](mm.php)
[Linux](linux.php)
[Bitwarden](https://vault.bitwarden.com/#/vault)

</details>

### Linux prikazy

#### Navigace:

pwd – výpis pracovního adresáře

ls –la – zobrazení obsahu adresáře

cd – změna adresáře

cp –avr <cesta ke zdroji adresáře/souboru> <cesta k umístění adresáře/souboru> – kopírování složky / souboru

mv <cesta ke zdroji adresáře/souboru> <cesta k umístění adresáře/souboru> – přesun adresáře / souboru

mkdir <název adresáře> – vytvoření adresáře

touch <název souboru> – vytvoření / aktualizace souboru

rm –rf <název adresáře / souboru> – smazání adresáře / souboru

#### Prohlížení:

cat <cesta k souboru> – zobrazí obsah souboru

more <cesta k souboru> – zobrazí obsah souboru (celý najednou)

less <cesta k souboru> – zobrazí obsah souboru (celý najednou s možností scrolování)

nano <cesta k souboru> – vytvoření a otevření / otevření souboru pro editaci v textovém editoru Nano

vi <cesta k souboru> – vytvoření a otevření / otevření souboru pro editaci v textovém editoru Vi

head <cesta k souboru> – zobrazí prvních 10 řádků vybraného souboru

tail <cesta k souboru> – zobrazí posledních 10 řádků vybraného souboru

tail –f <cesta k souboru> – zobrazí posledních 10 řádků souboru a současně změní soubor (obvykle soubor protokolu)

watch <příkaz> – sleduje výstup příkazu (defaultně je nastaveno obnovení každé 2 vteřiny)


#### Oprávnění souborů:

r w x(vlastník)  r w x(skupina)  r w x(ostatní)

r (čtení) – Umožňuje uživateli zobrazit soubor – číselná hodnota = 4

w (zápis) – Umožňuje uživateli editovat soubor – číselná hodnota = 2

x (spuštění) – Umožňuje uživateli spustit daný soubor – číselná hodnota = 1

chmod 777 <cesta k souboru> – Vlastník, skupina i ostatní uživatelé mohou číst, zapisovat a spustit daný soubor.

chmod 700 <cesta k souboru> – Vlastník může číst, zapisovat a spustit daný soubor. Skupina a ostatní uživatelé nemají žádná práva

chmod 666 <cesta k souboru> – Všichni uživatelé mohou číst a zapisovat do daného souboru.

chmod 644 <cesta k souboru> – Vlastník může číst a zapisovat do souboru. Skupina a ostatní mohou jen číst daný soubor.

Oprávnění složek:

r w x(vlastník)  r w x(skupina)  r w x(ostatní)

r (čtení) – Umožňuje uživateli zobrazit složku – číselná hodnota = 4

w (zápis) – Umožňuje uživateli editovat složku – číselná hodnota = 2

x (spuštění) – Umožňuje uživateli spustit danou složku – číselná hodnota = 1

chmod 777 <cesta ke složce> – Vlastník, skupina i ostatní uživatelé mohou číst, zapisovat a spouštět soubory ve složce, vytvářet soubory ve složce, mazat a měnit soubory ve složce.chmod 755 <cesta ke složce> – Vlastník může číst, zapisovat a spouštět soubory ve složce, vytvářet soubory ve složce, mazat a měnit soubory ve složce. Skupina a ostatní uživatelé mohou jen měnit adresář a seznam souborů.

chmod 700 <cesta ke složce> – Vlastník může číst, zapisovat a spouštět soubory ve složce, vytvářet soubory ve složce, mazat a měnit soubory ve složce. Skupina a ostatní uživatelé nemají žádná oprávnění.

#### Správa uživatelů:

adduser <jméno nového uživatele> – vytvoří nového uživatele

deluser <jméno existujícího uživatele> – smaže uživatele, jeho domovský adresář zůstane

deluser <jméno existujícího uživatele> -remove-home – smaže uživatele i s jeho domovským adresářem

addgroup <nový název skupiny> – vytvoří novou skupinu

delgroup <název existující skupiny> – smaže skupinu

passwd – změní heslo

who – zobrazí seznam přihlášených uživatelů

useradd –g <název skupiny> <jméno uživatele> – přidá uživatele do skupiny, bude to primární skupina pro uživatele

useradd –G <název skupiny> <jméno uživatele> – přidá uživatele do skupiny, bude to druhotná skupina pro uživatele

usermod –g <název skupiny> <jméno uživatele> – změní uživatelovu primární skupinu

usermod –a –G <název skupiny> <jméno uživatele> – změní uživatelovu druhotnou skupinu

chown <název skupiny> <jméno uživatele> – změní vlastníka souborů

chgrp <název skupiny> <jméno uživatele> – změní skupinu vlastníků souborů

Systém:

hostname – zobrazí název hostitele v systému Linux Mint

uptime – zobrazí, jak dlouho systém běží

echo $SHELL – zobrazí, jaký Shell je aktuálně používán v Linux Mintu (výchozí je bash)

#### Systém:

man <příkaz> – zobrazí manuál o zadaném příkazu

ps – seznam všech běžících procesů v systému

top – aktuální informace o systému Linux, uptime, počet uživatelů, zatížení systému, počet běžících úkolů a využití systémových prostředků

kill -9 <pid> -zabije proces s daným id

killall proc – zabije všechny procesy s názvem proc*

uname –a – zobrazí název, verzi jádra, typ stroje, síťový uzel, název hostitele, typ procesoru, verzi OS a další podrobnosti o architektuře systému

lsb_release –a – LSB verze, ID distribuce, popis distribuce, číslo verze a codename distribuce

df –h – zobrazení systému souborů a využití místa na disku

free –m – zobrazit velikost volné a používané paměti systému

lspci – seznam všech PCI sběrnic a zařízení k nim připojených

lsusb – seznam všech USB sběrnic a zařízení k nim připojených

lshal – seznam všech zařízeníl HAL(Hardware Abstraction Layer) a jím připojeného hardwaru

lshw –seznam hardwaru v systému, včetně informací o výrobci, typu zařízení a způsobu jeho připojení

#### Síť:

ping <webová stránka/ip adresa> – otestování konektivity nebo odpověď z konkrétní IP adresy nebo webové stránky

traceroute <webová stránka/ip adresa> – sledování síťové cesty na webovou stránku nebo IP adresu

ifconfig – zobrazí seznam všech síťových rozhraní

ifconfig <rozhraní> up – zapne dané rozhraní

ifconfig <rozhraní> down – vypne dané rozhraní

iwconfig – zobrazí seznam všech bezdrátových síťových rozhraní

ssh <uzivatelské jméno>@<host name> – přihlásit daného uživatele k síťovému hostiteli

#### Instalace:

apt-get install <název balíčku> – instalace konkrétní aplikace / balíčku

apt-get remove <název balíčku> – odinstalace konkrétní aplikace / balíčku

apt-get update – aktualizace databáze balíčků Linux Mintu

apt-get upgrade – upgrade balíčků Linux Mintu


#### Instalace:

apt-get -f install – řešení potíží s rozbitými balíčky

apt-get autoremove – automaticky odstraní zastaralé balíčky

Instalace ze zdroje:

./configure

make

make install

#### Hledání:

locate <název souboru> – vyhledá v systému soubor dle zadaného názvu

grep <vzor> <název souboru> – vyhledá v systému soubor dle konkrétního vzoru

Linux command | grep <vzor> – prohledá výstup příkazu dle zadaného vzoru

whereis <příkaz> – zobrazí umístění příkazu pro spustitelný soubor

which <příkaz> – zobrazí spustitelný soubor, který bude spuštěn jako výchozí pro provedení příkazu

#### Archivace:

tar –czvf <název archivu>.tar.gz <soubor 1> <soubor 2>…<soubor n> – vytvoří .tar.gz archiv kompresí daných souborů

tar –xzvf <název archivu>.tar.gz – extrahuje soubory z archivu .tar.gz

tar –cf <název archivu>.tar <soubor 1> <soubor 2>…<soubor n> – vytvořit .tar archív kompresí daných souborů

tar –xf <název archivu>.tar – extrahuje soubory z archivu .tar

gzip <název souboru> – komprimuje soubor a vytvoří archiv gzip názvem <název archivu>.gz

gzip –d <název souboru>.gz – extrahuje soubory z archivu gzip

#### Vypínání:

poweroff – vypnutí systému

reboot – restart systému

echo b > /proc/sysrq-trigger – tvrdý restart systému 
