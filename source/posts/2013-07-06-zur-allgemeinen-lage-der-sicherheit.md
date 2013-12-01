---
# kate: hl markdown;
title: "Zur Allgemeinen Lage der Sicherheit"
date: 2013-07-06 21:07
comments: true
tags: [german, tricks, meta, security]
lang: de
---

[![GnuPG Logo][img]{:.pull-right.img-thumbnail}][gpg]
Nachdem einmal mehr aufgezeigt wurde ([Prism], [Tempora]), wie
transparent man doch im Internet ist, sind Themen wie Datensparsamkeit, Datenschutz
und Kryptographie wieder prominent in den Medien vertreten.

Eine kurze Link-Sammlung zu Verschlüsselungstechniken für jedermann.

[img]: http://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Gnupg_logo.svg/200px-Gnupg_logo.svg.png
[gpg]: http://www.gnupg.org/ "Gnu GPG"

<!-- more -->

Worum es bei der Bespitzelung geht und wie man sich dagegen wehren kann,
beschreibt *Ludwig Greven* in seinem Artikel
[Datensparsamkeit: Wer nicht belauscht werden will, sollte nicht überall reden](http://www.zeit.de/digital/datenschutz/2013-06/ueberwachung-snowden-datensparsamkeit).
Ich zitiere:

> Was technisch möglich ist, wird von staatlichen Kontrolleuren auch gemacht.

> Verschlüsselungsprogramme oder andere Verfahren, um seine Spuren im Internet zu verwischen, können zwar etwas helfen. Doch wer so etwas nutzt, [macht die Überwacher erst recht scharf und sich verdächtig](http://www.zeit.de/digital/datenschutz/2013-06/nsa-speichert-verschluesselte-mails) – verschlüsselte Kommunikation wird von ihnen grundsätzlich gespeichert, denn vielleicht kann man sie ja später knacken.

Das sind erst einmal Tatsachen, die wir hinnehmen müssen. Selbst wenn es nicht
unserer Regierungen wären, die hier die Daten abschnorcheln, so muss man davon
ausgehen, dass es vielleicht jemand anderes probiert.

Noch am selben Tag kontert *David Hugendick* mit 
[Datenschutz: Wir lassen uns nicht verschlüsseln](http://www.zeit.de/kultur/2013-06/replik-datensparsamkeit-prism).
Er formuliert unter anderem:

> Wir könnten unsererseits aufrüsten, verschlüsseln, die Möglichkeiten wären da. Doch wohin führte uns diese Logik? Sollen wir uns damit abfinden, dass wir überwacht werden, weil wir ja kryptografisch aufgemöbelte Mails schicken können? Sollen wir fürderhin wieder so reden und schreiben, wie es Schriftsteller zu Sowjetzeiten tun mussten, in Codes und Uneigentlichkeiten, hier und da mal ein subtiler Gruß an den Geheimdienst?

Ich finde es ja stets löblich, wenn ein Medium einen Sachverhalt von zwei verschiedenen
Blickwinkeln betrachtet. In diesem Fall muss ich dem Herrn Hugendick ganz klar
widersprechen. Ja – wir müssen verschlüsseln.

Die vielleicht nicht anwenderfreundlichste, aber zumindest konsequenteste Lösung
nach der Datensparsamkeit kann nur sein einfach jegliche Kommunikation zu
verschlüsseln – und sei sie auch noch so belanglos. So würden die Kapazitäten der
Auswertungszentren überlastet werden und eine Entschlüsselung im speziellen
Einzelfall sehr unwahrscheinlich.

Ich kann also nur empfehlen sich die notwendigen kostenlosen Programme zu installieren.
An aktuellen Anleitungen dürfte es momentan im Netz nicht fehlen:

* Immer darauf achten mit `https` anstatt `http` zu surfen, wenn möglich. Facebook macht das ganz richtig. Das hilft natürlich wenig, wenn Facebook im Anschluss die Daten freiwillig offenlegt.
* Mail-Verschlüsselung
  * Artikel technischer Natur: <http://www.thunderbird-mail.de/wiki/Enigmail_OpenPGP>
  * Youtube-Demonstration Schritt-für-Schritt: <http://www.youtube.com/watch?v=drWdLiU3oIA>
* Verschlüsseltes Chatten (auch mit Facebook-Freunden)
  * für Mac OS: [Adium](http://www.adium.im/)
  * Linux-Nuter wissen sich selber zu helfen. `;)` (Kopete oder Pidgin)
  * für Windows: hm, schwierig. Lieber zu Linux oder Mac wechseln. [Wikipedia](http://de.wikipedia.org/wiki/Off-the-Record_Messaging#Verf.C3.BCgbarkeit) weiß mehr.

Das wäre dann schon erstmal ein guter Anfang.

[Tempora]: http://de.wikipedia.org/wiki/Tempora "Tempora auf Wikipedia"
[Prism]: http://de.wikipedia.org/wiki/PRISM_%28%C3%9Cberwachungsprogramm%29 "Prism (Überwachungsprogramm) auf Wikipedia"