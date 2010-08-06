---
layout: post
title: Picard Tagger Installieren mit aktiviertem Fingerprint
categories:
- music
---

# Funktionalität von Picard

Nachdem ich festgestellt habe, dass Musik hören via Handy nicht der Weisheit
letzter Schluss sein kann, habe ich mir einen neues Gerät bestellt, welches in
I-Pod-Manier die einzelnen Titel an Hand ihrer
[ID3-Tags](http://de.wikipedia.org/wiki/ID3-Tag "Identify an MP3") sortiert und
anzeigt. Natürlich funktioniert das nur gut, sofern diese Tags auch sorgfälltig
gesetzt wurden. Und hierfür gibt es eben
[Picard][wiki0].

Auf der [Projektseite][picard]
findet man hierzu folgende Beschreibung des Programms:
> Picard is the next generation MusicBrainz tagging application.
> This new tagging concept is album oriented, as opposed to track/file oriented
> like the ClassicTagger was. Picard is written in Python, which is a cross-platform
> language, and makes use of cross-platform libraries - this allows the same code
> to run both on Windows, Linux and Mac OS X.

Picard greift, um die ID3-Tags zu setzen, auf die Musikdatenbank
[MusicBrainz][mb] zu und
vergleicht bereits vorhandene Daten mit den bereits existierenden. Weiterhin
kann zu jedem Titel ein [Fingerabdruck][fp]
erzeugt werden, der das automatische Taggen auch *ohne* vorher bekannte
Informationen (Artist, Titel, etc.) erlaubt. Das ist hierbei auch die
Besonderheit.

## Installation von Picard

Vorneweg: Ich werde Picard manuell installieren. Hinterher habe ich
gesehen, dass es durchaus [Binär-Pakete][suse]
(\*.rpm) für Picard gibt. Jedoch soll es hierbei Probleme mit dem Erstellen
der Fingerabdrücke geben, doch das ist ja grade der Vorteil.

Also installiere ich Picard eben selbst, und zwar mit Hilfe der Konsole.
Die Installation ist nicht weiter schwierig, soweit man weiß, welche
Pakete installiert werden müssen. Doch schön der Reihe nach:

1.  Herunterladen von Picard
    Öffnet die Konsole und wechselt bspw. in euer Heimatverzeichnis. Anschließend laden wir Picard von der Projektseite herunter und entpacken das Archiv und welchseln in das neue Verzeichnis.

        cd ~
        wget ftp://ftp.musicbrainz.org/pub/musicbrainz/picard/picard-0.12.1.tar.gz
        tar -xvzf picard-0.10.tar.gz
        cd picard-0.10/

2.  Die Datei INSTAll.txt gibt Aufschluss über die Voraussetzungen um Picard zu installieren.

        less INSTALL.txt # Datei INSTAll.txt betrachen; mit [q] Ansicht verlassen

3.  Pakete Installieren
    Zum Glück existieren für alle Vorraussetzungen Binär-Pakete, so dass wir weiter nichts selbst kompilieren müssen. Wir welchseln nun mit `su` zum Benutzter root und installieren mit `zypper` die benötigten Pakete.

        zypper in python-qt4 python-mutagen ffmpeg libofa0 libofa-devel libdiscid0 libdiscid-devel fftw3-devel fftw3-threads ffmpeg ffmpeg-devel libtunepimp python-libtunepimp libavcodec51 libgsm1 gcc-c++ gcc python-devel

    Einige Pakete sind zwar optional und einige andere möglicherweise gar nicht von nöten, jedoch habe ich selbst lieber alle installiert um Problemen vorzubeugen. Schließlich sind das ja alles nur ein paar Kilobyte. Naja, nicht ganz. ;)
    Hierzu sei noch gesagt: die Pakete libofa\* sind wichtig für den Fingerabdruck. Jedoch findet der Installer die Pakete nicht ohne weiteres. Also musste ich noch die Pakete fftw3-devel und fftw3-threads installieren. Fingerabdrücke konnten so immernoch nicht erzeugt werden. Die Fehlermeldung beim Start in der Konsole lautete:

         No decoders found! Fingerprinting will be disabled.

    Es stellte sich schließlich heraus, dass das Paket ffmpeg-devel gefehlt halt ,welches eine Installation von 70 MB auslöst, also einen ganzen Wust an Programmen hinter sich herzieht.

4.  Picard Konfiguieren und Installieren
    Wie der beiliegenden Installationsanleitung entnommen werden kann, kann nun Picard selbst installiert werden.

        python setup.py config
        python setup.py install

5.  Plugin "Album Cover Downloader" Installieren
    Weil wir schon mal dabei sind und die Verwaltung von Album Covers doch eigentlich dazu gehört, installieren wir gleich noch das optionale Plugin "Cover Art Downloader", welches auf der offiziellen [Plugin-Seite](http://musicbrainz.org/doc/PicardPlugins "Picard Plugins") gefunden werden kann. Hierzu meldet ihr euch am Besten erst einmal als root ab.

         exit # root-Modus verlassen
         mkdir -p ~/.config/MusicBrainz/Picard/plugins
         cd ~/.config/MusicBrainz/Picard/plugins
         wget http://users.musicbrainz.org/~luks/picard-qt/plugins/coverart.py

    Ihr müsst dieses Plugin allerdings noch anschließend im Optionen-Dialog des Programms aktivieren.

6.  Picard Starten
    Zum Starten ruft ihr mit \[Alt]-\[F2] die Befehlsaufforderung auf und gebt `picard` ein.

    Natürlich lässt sich Picard auch ins Startmenu integrieren, sodenn dies nicht bereits automatisch erfolgt ist. Hierzu öffnen wir den Menu-Editor (hierzu auf das Startmenu-Icon rechtsklicken) und legen in einer Kategorie unserer Wahl ein "Neues Element" an. Nun suchen wir einen neuen Speicherplatz für die Datei "picard-32.png" aus dem entpackten Picard-Archiv, da wir den Picard-Ordner später löschen möchten. Wir bearbeiten das neue Element im Menu-Editor indem wir den Namen (z.B. Picard Tagger) eintragen, einen Kommentar setzen und nun auf das Bild klicken um ein Neues auszuwählen (ihr wisst schon welches).

7.  Installationsüberbleibsel Löschen

        cd ~
        su
        rm -r picard-0.10* # Löscht ohne Umweg über den Papierkorb

Die Installation ist somit abgeschlossen und ihr solltet ein voll funktionsfähiges
Picard haben. Probierts ruhig aus. Funktioniert gut.
Wie ihr das Programm bedient, findet ihr bestimmt im Internet. ;)

[wiki0]: http://de.wikipedia.org/wiki/MusicBrainz_Picard "Dt. Wikipedia-Eintrag zu Picard"
[picard]: http://musicbrainz.org/doc/Picard "Picard, the Next-Generation MusicBrainz Tagger"
[suse]: http://software.opensuse.org/search?p=1&q=picard "Link zur One Click-Installation"
[mb]: http://musicbrainz.org "Community Musik Tag-Datenbank"
[fp]: http://musicbrainz.org/doc/HowPUIDsWork "How Fingerprint works"