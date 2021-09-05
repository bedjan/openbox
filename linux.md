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
title: "Linux"
output:
  html_document:
    toc: yes
pagetitle: Linux
---


<details open>
<summary>- Menu -</summary>

[Web](index.php)
[Multimedia](mm.php)
[Linux](linux.php)
[Bitwarden](https://vault.bitwarden.com/#/vault)

</details>

### Openbox all-in-one

[Openbox all-in-one](https://github.com/bedjan/openbox)

git clone https://github.com/bedjan/openbox.git

https://raw.githack.com/bedjan/openbox/main/web.html


### Skripty


[Shell Tools and Scripting](https://missing.csail.mit.edu/2020/shell-tools/)

V této přednášce představíme některé základy používání bash jako skriptovacího jazyka spolu s řadou nástrojů prostředí, které pokrývají několik nejběžnějších úkolů, které budete neustále provádět v příkazovém řádku.

Skriptování Shell
Zatím jsme viděli, jak provádět příkazy v shellu a spojovat je dohromady. V mnoha scénářích však budete chtít provést řadu příkazů a využít výrazy řízení toku, jako jsou podmíněné nebo smyčky.

Shell skripty jsou dalším krokem ve složitosti. Většina skořápek má svůj vlastní skriptovací jazyk s proměnnými, tokem řízení a vlastní syntaxí. Díky čemu se skriptování prostředí liší od ostatních skriptovacích programovacích jazyků, je to, že je optimalizováno pro provádění úkolů souvisejících se skořápkou. Vytváření příkazových kanálů, ukládání výsledků do souborů a čtení ze standardního vstupu jsou tedy primitivy ve skriptování prostředí, což usnadňuje použití než skriptovací jazyky pro obecné účely. V této části se zaměříme na skriptování bash, protože je to nejběžnější.

Chcete-li přiřadit proměnné v bash, použijte syntaxi foo=bara získejte přístup k hodnotě proměnné pomocí $foo. Všimněte si, že foo = barto nebude fungovat, protože je interpretováno jako volání fooprogramu s argumenty =a bar. Obecně platí, že ve skriptech prostředí provede mezerový znak rozdělení argumentů. Toto chování může být zpočátku matoucí, takže to vždy zkontrolujte.

Řetězce v bash lze definovat pomocí 'a "oddělovačů, ale nejsou ekvivalentní. Řetězce s oddělovači 'jsou doslovné řetězce a nenahradí hodnoty proměnných, zatímco "oddělované řetězce budou.

foo=bar
echo "$foo"
# prints bar
echo '$foo'
# prints $foo
Stejně jako u většiny programovacích jazyků, bash podporuje ovládání techniky proudění, včetně if, case, whilea for. Podobně bashmá funkce, které přijímají argumenty a mohou s nimi pracovat. Zde je příklad funkce, která vytvoří adresář a cddo něj.

mcd () {
    mkdir -p "$1"
    cd "$1"
}
Zde $1 je první argument skriptu / funkce. Na rozdíl od jiných skriptovacích jazyků používá bash k odkazování na argumenty, chybové kódy a další relevantní proměnné celou řadu speciálních proměnných. Níže je uveden seznam některých z nich. Podrobnější seznam naleznete zde .

$0 - Název skriptu
$1do $9- Argumenty skriptu. $1je první argument atd.
$@ - Všechny argumenty
$# - Počet argumentů
$? - Návratový kód předchozího příkazu
$$ - Identifikační číslo procesu (PID) pro aktuální skript
!!- Celý poslední příkaz, včetně argumentů. Běžným vzorem je provedení příkazu pouze pro jeho selhání kvůli chybějícím oprávněním; příkaz můžete rychle znovu spustit pomocí sudosudo !!
$_- Poslední argument z posledního příkazu. Pokud se nacházíte v interaktivním prostředí, můžete tuto hodnotu také rychle získat zadáním a Escnásledným zadáním.
Příkazy často vracejí výstup pomocí STDOUT, chyby STDERRa návratový kód, aby hlásily chyby způsobem, který je přátelštější ke skriptu. Návratový kód nebo stav ukončení je způsob, jakým skripty / příkazy musí komunikovat, jak proběhlo provedení. Hodnota 0 obvykle znamená, že vše proběhlo v pořádku; něco jiného než 0 znamená, že došlo k chybě.

Kódy ukončení lze použít k podmíněnému provedení příkazů pomocí &&(a operátora) a ||(nebo operátora), které jsou zkratovými operátory. Příkazy lze také oddělit na stejném řádku pomocí středníku ;. trueProgram bude mít vždy 0 návratový kód a falsepříkaz bude mít vždy jeden návratový kód. Podívejme se na několik příkladů

false || echo "Oops, fail"
# Oops, fail

true || echo "Will not be printed"
#

true && echo "Things went well"
# Things went well

false && echo "Will not be printed"
#

true ; echo "This will always run"
# This will always run

false ; echo "This will always run"
# This will always run
Dalším běžným vzorem je chtít získat výstup příkazu jako proměnnou. To lze provést nahrazením příkazu . Kdykoli $( CMD )jej umístíte , provede se CMD, získejte výstup příkazu a dosaďte jej na místo. Například pokud to uděláte for file in $(ls), shell nejprve zavolá lsa poté bude tyto hodnoty iterovat. Méně známá podobná funkce je substituce procesu , <( CMD )provede CMDa umístí výstup do dočasného souboru a nahradí jej <()jménem tohoto souboru. To je užitečné, když příkazy očekávají, že hodnoty budou předány souborem místo STDIN. Například diff <(ls foo) <(ls bar)zobrazí rozdíly mezi soubory v adresářích fooa bar.

Protože to byla obrovská skládka informací, podívejme se na příklad, který předvádí některé z těchto funkcí. Bude iterovat prostřednictvím argumentů, které poskytujeme greppro řetězec foobar, a přidá jej do souboru jako komentář, pokud není nalezen.

#!/bin/bash

echo "Starting program at $(date)" # Date will be substituted

echo "Running program $0 with $# arguments with pid $$"

for file in "$@"; do
    grep foobar "$file" > /dev/null 2> /dev/null
    # When pattern is not found, grep has exit status 1
    # We redirect STDOUT and STDERR to a null register since we do not care about them
    if [[ $? -ne 0 ]]; then
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> "$file"
    fi
done
Ve srovnání, které jsme testovali, $?nebylo rovno 0. Bash implementuje mnoho srovnání tohoto druhu - podrobný seznam najdete na stránce pro test. Když provádíte srovnání v bash, zkuste použít dvojité závorky [[ ]]ve prospěch jednoduchých závorek [ ]. Šance na chyby jsou nižší, i když to nebude přenosné sh. Podrobnější vysvětlení naleznete zde .

Při spouštění skriptů budete často chtít poskytnout podobné argumenty. Bash má způsoby, jak to usnadnit a rozšířit výrazy provedením rozšíření názvu souboru. Tyto techniky jsou často označovány jako shell globbing .

Zástupné znaky - Kdykoli chcete provést nějaký druh shody se zástupnými znaky, můžete použít ?a *k přiřazení jednoho nebo libovolného množství znaků. Například dané soubory foo, foo1, foo2, foo10a bar, příkaz rm foo?vymaže foo1a foo2vzhledem k tomu, rm foo*smaže všechny kromě bar.
Kudrnaté závorky {}- Kdykoli máte společný podřetězec v řadě příkazů, můžete je použít pro automatické rozbalení složených závorek pro bash. To se velmi hodí při přesouvání nebo převodu souborů.
convert image.{png,jpg}
# Will expand to
convert image.png image.jpg

cp /path/to/project/{foo,bar,baz}.sh /newpath
# Will expand to
cp /path/to/project/foo.sh /path/to/project/bar.sh /path/to/project/baz.sh /newpath

# Globbing techniques can also be combined
mv *{.py,.sh} folder
# Will move all *.py and *.sh files


mkdir foo bar
# This creates files foo/a, foo/b, ... foo/h, bar/a, bar/b, ... bar/h
touch {foo,bar}/{a..h}
touch foo/x bar/y
# Show differences between files in foo and bar
diff <(ls foo) <(ls bar)
# Outputs
# < x
# ---
# > y
Psaní bashskriptů může být složité a neintuitivní. Existují nástroje, jako je shellcheck, které vám pomohou najít chyby ve vašich skriptech sh / bash.

Upozorňujeme, že skripty nemusí být nutně psány v bash, aby bylo možné je volat z terminálu. Zde je například jednoduchý skript v Pythonu, který vydává své argumenty v obráceném pořadí:

#!/usr/local/bin/python
import sys
for arg in reversed(sys.argv[1:]):
    print(arg)
Jádro ví, že spustit tento skript pomocí pythonového tlumočníka namísto příkazu shellu, protože jsme do horní části skriptu vložili řádek shebang . Je dobrým zvykem psát řádky shebang pomocí envpříkazu, který se přenese kamkoli, kde příkaz v systému žije, čímž se zvýší přenositelnost vašich skriptů. K vyřešení umístění envvyužijeme PATHproměnnou prostředí, kterou jsme představili v první přednášce. V tomto příkladu by linie shebang vypadala #!/usr/bin/env python.

Některé rozdíly mezi funkcemi prostředí a skripty, které byste měli mít na paměti, jsou:

Funkce musí být ve stejném jazyce jako shell, zatímco skripty lze psát v jakémkoli jazyce. Proto je důležité zahrnout do skriptů shebang.
Funkce jsou načteny jednou, když je načtena jejich definice. Skripty se načítají při každém spuštění. Díky tomu se funkce načítají o něco rychleji, ale kdykoli je změníte, budete muset znovu načíst jejich definici.
Funkce jsou prováděny v aktuálním prostředí prostředí, zatímco skripty jsou spouštěny v jejich vlastním procesu. Funkce tedy mohou měnit proměnné prostředí, např. Změnit aktuální adresář, zatímco skripty to neumí. Skripty budou předávány proměnnými prostředí hodnot, které byly exportovány pomocíexport
Stejně jako u jiných programovacích jazyků jsou funkce výkonným konstruktem pro dosažení modularity, opětovného použití kódu a jasnosti kódu shellu. Skripty prostředí často obsahují své vlastní definice funkcí.
Nástroje Shell
Nalezení použití příkazů
V tomto okamžiku vás možná zajímá, jak najít příznaky pro příkazy v sekci aliasing, například ls -l, mv -ia mkdir -p. Obecněji řečeno, jak po zadání příkazu zjistíte, co dělá, a jaké jsou jeho různé možnosti? Vždy můžete začít googlovat, ale protože UNIX předchází StackOverflow, existují vestavěné způsoby, jak tyto informace získat.

Jak jsme viděli na přednášce o shellu, přístupem prvního řádu je volání uvedeného příkazu pomocí příznaků -hnebo --help. Podrobnějším přístupem je použití manpříkazu. Zkratka pro manuální, manposkytuje ruční stránku (zvanou manpage) pro zadaný příkaz. Například man rmvydá chování rmpříkazu spolu s příznaky, které přijímá, včetně-ivlajka, kterou jsme ukázali dříve. Ve skutečnosti to, co jsem dosud propojoval pro každý příkaz, je online verze manuálových stránek Linuxu pro příkazy. I nepůvodní příkazy, které instalujete, budou mít položky na stránce, pokud je vývojář napsal a zahrnoval je jako součást procesu instalace. U interaktivních nástrojů, jako jsou ty, které jsou založeny na ncurses, lze často získat nápovědu k příkazům v rámci programu pomocí :helppříkazu nebo psaní ?.

Manpages někdy mohou poskytovat příliš podrobné popisy příkazů, takže je těžké dešifrovat, jaké příznaky / syntaxe se mají použít pro běžné případy použití. Stránky TLDR jsou šikovným doplňkovým řešením, které se zaměřuje na ukázkové příklady použití příkazu, takže můžete rychle zjistit, které možnosti použít. Například jsem zjistil, že odkazuji zpět na stránky tldr tara ffmpegmnohem častěji než na stránky.

Hledání souborů
Jedním z nejběžnějších opakujících se úkolů, kterému každý programátor čelí, je hledání souborů nebo adresářů. Všechny systémy podobné systému UNIX jsou dodávány v balíku find, což je skvělý nástroj pro vyhledávání souborů. findrekurzivně vyhledá soubory vyhovující některým kritériím. Nějaké příklady:

# Find all directories named src
find . -name src -type d
# Find all python files that have a folder named test in their path
find . -path '*/test/*.py' -type f
# Find all files modified in the last day
find . -mtime -1
# Find all zip files with size in range 500k to 10M
find . -size +500k -size -10M -name '*.tar.gz'
Kromě výpisu souborů může find také provádět akce se soubory, které odpovídají vašemu dotazu. Tato vlastnost může být neuvěřitelně užitečná pro zjednodušení toho, co by mohlo být docela monotónní úkoly.

# Delete all files with .tmp extension
find . -name '*.tmp' -exec rm {} \;
# Find all PNG files and convert them to JPG
find . -name '*.png' -exec convert {} {}.jpg \;
Navzdory findvšudypřítomnosti může být jeho syntaxe někdy obtížná k zapamatování. Například jednoduše najdete soubory, které odpovídají nějakému vzoru, PATTERNkterý musíte provést find -name '*PATTERN*'(nebo -inamepokud chcete, aby se při porovnávání vzorů nerozlišovala malá a velká písmena). Pro tyto scénáře můžete začít vytvářet aliasy, ale součástí filozofie prostředí je, že je dobré prozkoumat alternativy. Nezapomeňte, že jednou z nejlepších vlastností prostředí je to, že právě voláte programy, takže můžete najít (nebo dokonce sami napsat) náhrady za některé. Například fdje to jednoduchá, rychlá a uživatelsky přívětivá alternativa k find. Nabízí několik pěkných výchozích nastavení, jako je barevný výstup, výchozí shoda regexu a podpora Unicode. Má také podle mého názoru intuitivnější syntaxi. Například syntaxe k vyhledání vzoruPATTERNje fd PATTERN.

Většina by s tím souhlasila finda fdjsou dobrá, ale někteří z vás se možná zajímají o efektivitu vyhledávání souborů pokaždé, když kompilujete nějaký index nebo databázi pro rychlé vyhledávání. K tomu je to locate. locatepoužívá databázi, která je aktualizována pomocí updatedb. Ve většině systémů updatedbse denně aktualizuje prostřednictvím cron. Jeden kompromis mezi nimi je tedy rychlost vs. svěžest. Kromě toho finda podobné nástroje mohou také najít soubory pomocí atributů, jako je velikost souboru, doba modifikace nebo oprávnění souboru, přičemž locatepouze používá název souboru. Podrobnější srovnání naleznete zde .

Hledání kódu
Hledání souborů podle názvu je užitečné, ale často chcete vyhledávat podle obsahu souborů . Běžným scénářem je hledání všech souborů, které obsahují nějaký vzor, ​​spolu s místem, kde se v těchto souborech daný vzor vyskytuje. K dosažení tohoto cíle poskytuje většina systémů podobných systému UNIX grepobecný nástroj pro porovnávání vzorů ze vstupního textu. grepje neuvěřitelně cenný shell nástroj, kterému se budeme podrobněji věnovat během přednášky o hádání dat.

Prozatím víte, že grepmá mnoho příznaků, které z něj dělají velmi univerzální nástroj. Některé jsem často používají, jsou -Cpro získání C Souvislosti kolem odpovídající linky a -vv objem erting zápasu, tedy tisknout všechny řádky, které nejsou odpovídají vzoru. Například grep -C 5vytiskne 5 řádků před a po zápase. Pokud jde o rychlé prohledávání mnoha souborů, které chcete použít, -Rprotože R rekurzivně přejde do adresářů a hledá soubory pro odpovídající řetězec.

Ale grep -Rmůže být zvýšena v mnoha ohledech, jako je ignorovat .gitsložky, s využitím multi podporu CPU, ac. grepBylo vyvinuto mnoho alternativ, včetně ack , ag a rg . Všechny jsou fantastické a do značné míry poskytují stejnou funkčnost. Prozatím se držím ripgrep ( rg), vzhledem k tomu, jak je to rychlé a intuitivní. Nějaké příklady:

# Find all python files where I used the requests library
rg -t py 'import requests'
# Find all files (including hidden files) without a shebang line
rg -u --files-without-match "^#!"
# Find all matches of foo and print the following 5 lines
rg foo -A 5
# Print statistics of matches (# of matched lines and files )
rg --stats PATTERN
Všimněte si, že stejně jako u find/ fd, je důležité vědět, že tyto problémy lze rychle vyřešit pomocí jednoho z těchto nástrojů, zatímco konkrétní nástroje, které používáte, nejsou tak důležité.

Hledání příkazů prostředí
Zatím jsme viděli, jak najít soubory a kód, ale jak začnete trávit více času v shellu, možná budete chtít najít konkrétní příkazy, které jste zadali v určitém okamžiku. První věc, kterou je třeba vědět, je, že zadáním šipky nahoru se vrátíte k poslednímu příkazu, a pokud jej budete stále stisknout, budete pomalu procházet historii svého shellu.

historyPříkaz vám umožní přístup k historii shell programově. Vytiskne historii vašeho shellu na standardní výstup. Pokud tam chceme hledat, můžeme tento výstup přesměrovat grepa hledat vzory. history | grep findvytiskne příkazy, které obsahují podřetězec „find“.

Ve většině skořápek můžete použít Ctrl+Rzpětné vyhledávání v historii. Po stisknutí Ctrl+Rmůžete zadat podřetězec, který chcete porovnat s příkazy v historii. Jak jej budete neustále mačkat, budete procházet zápasy ve své historii. To lze také povolit pomocí šipek NAHORU / DOLŮ v zsh . Pěkný doplněk navíc Ctrl+Rpřichází s použitím vazeb fzf . fzfje univerzální fuzzy vyhledávač, který lze použít s mnoha příkazy. Zde se používá k dokonalému porovnávání vaší historie a prezentaci výsledků pohodlným a vizuálně příjemným způsobem.

Další skvělý trik související s historií, který mě opravdu baví, jsou autosugesce založené na historii . Tato funkce, kterou poprvé představila skořápka ryby , dynamicky automaticky doplní váš aktuální příkaz skořápky s nejnovějším zadaným příkazem, který s ní sdílí společnou předponu. Lze jej povolit v zsh a je to skvělý trik kvality života pro váš shell.

Můžete upravit chování historie prostředí, například zabránit zahrnutí příkazů s úvodním prostorem. To se hodí, když píšete příkazy s hesly nebo jinými kousky citlivých informací. Chcete-li to provést, přidejte HISTCONTROL=ignorespacedo svého .bashrcnebo setopt HIST_IGNORE_SPACEdo svého .zshrc. Pokud uděláte chybu, že nepřidáte úvodní mezeru, můžete položku kdykoli ručně odstranit úpravou .bash_historynebo .zhistory.

Navigace v adresáři
Zatím jsme předpokládali, že jste již tam, kde musíte být, abyste mohli provádět tyto akce. Jak ale můžete rychle procházet adresáře? Existuje mnoho jednoduchých způsobů, jak to udělat, například psaní aliasů prostředí nebo vytváření symbolických odkazů pomocí ln -s , ale pravdou je, že vývojáři již nyní přišli na docela chytrá a sofistikovaná řešení.

Stejně jako u tématu tohoto kurzu se často chcete optimalizovat pro běžný případ. Hledání častých a / nebo posledních souborů a adresářů lze provést pomocí nástrojů jako fasda autojump. Fasd řadí soubory a adresáře podle frecency , to znamená podle frekvence a aktuálnosti . Ve výchozím nastavení fasdpřidá zpříkaz, který můžete použít k rychlému cdpoužití podřetězce volného adresáře. Například, pokud často chodíte /home/user/files/cool_project, můžete tam jednoduše z coolskočit. Pomocí automatického skoku lze stejnou změnu adresáře provést pomocí j cool.

Složitější nástroje existují proto, aby rychle získat přehled o adresářové struktury: tree, brootnebo dokonce plnohodnotného souborové manažery líbí nnnnebo ranger.

Cvičení
Číst man lsa zapisovat lspříkaz, který uvádí seznam souborů následujícím způsobem

Zahrnuje všechny soubory, včetně skrytých souborů
Velikosti jsou uvedeny v čitelném formátu (např. 454M místo 454279954)
Soubory jsou řazeny podle aktuálnosti
Výstup je vybarven
Ukázkový výstup by vypadal takto

 -rw-r--r--   1 user group 1.1M Jan 14 09:53 baz
 drwxr-xr-x   5 user group  160 Jan 14 09:53 .
 -rw-r--r--   1 user group  514 Jan 14 06:42 bar
 -rw-r--r--   1 user group 106M Jan 13 12:12 foo
 drwx------+ 47 user group 1.5K Jan 12 18:08 ..
Napište funkce bash marcoa poloproveďte následující. Kdykoli spustíte marcoaktuální pracovní adresář, měl by být nějakým způsobem uložen, pak při spuštění polo, bez ohledu na to, ve kterém adresáři se nacházíte, polobyste se cdměli vrátit do adresáře, kde jste provedli marco. Pro snazší ladění můžete napsat kód do souboru marco.sha (znovu) načíst definice do svého shellu provedením source marco.sh.

Řekněme, že máte příkaz, který selhává zřídka. Chcete-li jej ladit, musíte zachytit jeho výstup, ale může být časově náročné získat poruchový běh. Napište bash skript, který spustí následující skript, dokud selže a nezachytí jeho standardní výstup a chybové proudy do souborů a na konci vytiskne vše. Bonusové body, pokud můžete také nahlásit, kolik běhů trvalo, než skript selhal.

 #!/usr/bin/env bash

 n=$(( RANDOM % 100 ))

 if [[ n -eq 42 ]]; then
    echo "Something went wrong"
    >&2 echo "The error was using magic numbers"
    exit 1
 fi

 echo "Everything went according to plan"

Jak jsme se vztahuje na přednášce findje -execmůže být velmi silný pro provádění operací nad soubory hledáme. Co když však chceme udělat něco se všemi soubory, například vytvořit soubor ZIP? Jak jste již viděli, příkazy budou brát vstup z obou argumentů a STDIN. Když provádíme příkazy, připojujeme STDOUT k STDIN, ale některé příkazy, jako tarjsou vstupy z argumentů. K překlenutí tohoto odpojení existuje xargspříkaz, který provede příkaz pomocí argumentů STDIN. Například ls | xargs rmodstraní soubory v aktuálním adresáři.

Vaším úkolem je napsat příkaz, který rekurzivně najde všechny soubory HTML ve složce a vytvoří s nimi zip. Váš příkaz by měl fungovat, i když mají soubory mezery (nápověda: zkontrolujte -dpříznak pro xargs).

Pokud používáte MacOS, nezapomeňte, že výchozí BSD findse liší od BSD obsaženého v GNU coreutils . Můžete použít -print0na finda -0vlajka na xargs. Jako uživatel systému macOS byste si měli uvědomit, že nástroje příkazového řádku dodávané se systémem macOS se mohou od protějšků GNU lišit; můžete nainstalovat verze GNU, pokud chcete, pomocí brew .

(Pokročilé) Napište příkaz nebo skript, který rekurzivně najde naposledy upravený soubor v adresáři. Obecněji můžete uvést všechny soubory podle aktuálnosti?


