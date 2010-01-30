---
layout: post
title: CAcert SSL certificates in KMail KDE 4
categories:
- kde
- cacert
---
In preparation of the sixth ["Brandenburger Linux-Infotag"][blit] I passed the [CAcert][cacert] [Assurer Challange][ac], which was the last requirement I had to fullfill to be allowed to verify
people.

To start the "challange" it is neccessary to login with your own ssl certificate from CAcert.
I only used gpg the last years, so I had have to create a new one and configure KDE to use it.

That's unfortunately not easy.

Because I didn't managed (yet) to get my private certificate working in konqueror I used Firefox to run the test. Import to Firefox works without any problems.

It is also possible to use the certificate for signing emails. I really like KMail and i didn't want to switch over to Thunderbird.

So I tried to get the certificate properly configured once more.

After all you only have to add two lines in the right place.

[blit]: http://www.blit.org/2009/ "Website of a local Linux Day"
[cacert]: http://www.cacert.org/
[ac]: http://wiki.cacert.org/AssurerChallenge

First of all you have to import your certificate from CAcert. You can login to your CAcert-Page with Konqueror and navigate to your certificate. A click on the link there should automatically start the KDE certificate manager Kleopatra. You should get a notice that your certificate was successfully imported.

Remeber: Imported is not the same as working/usable. ;)

Add "disable-trusted-cert-crl-check" to the end of the file "~/.gnupg/gpgsm.conf" and
"allow-mark-trusted" to the (new) file "pg-agent.conf".

Now you need to restart your PC. After login you will be asked if you want to trust your single installed root certificates. Pay attention on "support@cacert.org" and answer with yes.

Maybe it is sufficient to close the KDE Certifcates Manager Kleopatra and stop the service gpg-agent with an "killall gpg-agent" and restart Kleopatra.

After that it should be possible to add your certifcates in your KMail Profile.

If it is also working for you, give me a sign. Maybe we want to add this how-to to the kde or cacert wiki.