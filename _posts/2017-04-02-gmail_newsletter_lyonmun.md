---
title: "Security Issues due to bad Mail Practices: The LyonMUN case"
date: 2017-04-02 13:14 CET
kate: hl markdown;
published: true
lang: en
tags:
 - security
 - france
keywords:
 - communication
 - email
---

**So many associations use GMail for their general communication with members. Often, this comprises the sending of newsletters. Recently, the organisers of the UN politics simulation [MUN LyonMUN][LM] leaked this way by accident a large number of participants mail addresses (mine as well). I decided to raise awareness of the security risks by a little experiment and also to test the reaction of the organisers.**

## Incident

On Friday 0:25[^tired], I received a mail from the organisers of this year’s [Model United Nations] (MUN) conference in Lyon called [LyonMUN][LM]. The mail has been sent from <lyonmun2017@gmail.com> to 222 people, that either participated in earlier editions in the conference or already signed up for this year’s edition. Purpose of the mailing: promote the upcoming edition and urge people to pay the conference fees.

[^tired]: Maybe the sender was tired after working past midnight and less attentive of what s/he is doing.

The problems in here are:

- The sender mail address is difficult to verify (I come back to this later).
- All 222 people have now the mail addresses of all others. That means, many personal mail addresses have been assumably accidentally leaked by the organisers.

Due to the way mail works, you cannot undo a mail once it has been sent. The only possible measures are to inform the data subjects in a transparent manner on the incident and potential security implications and to take precautions to prevent future incidents.

I made a bad experience when I made during the last year’s edition LyonMUN 2016 in the role of a participant the remark that one aspect of their conference may intimidate the participants: They offered to allow sending anonymously roses to individual participants with a message read out loud by the organisers in front of the assembly without prior consent of the receiver. I thought this may open doors to potential bullying. The then president of LyonMUN [Mélanie Villar][MV] and now secretary general just made a IMHO snide remark and that’s all what happened. I was certainly a bit disappointed and expected a debate taking into account that promoting debating is one of the purposes of MUN associations and events.

For that reason, I though of a more creative approach to initiate a discourse. It is not like security in the internet is not a topic for LyonMUN. On their website, the press team posted not even 2 weeks ago an article concerning [cyber defence](http://www.lyonmun.com/index.php/2017/03/20/les-enjeux-de-la-cyber-defense-dans-les-elections-presidentielles/). Unfortunately, LyonMUN has apparently not adopted adequate measures on their own. Let’s see what happened!

<!--more-->

## One Round-Mail and a lot of Confusion

So I decided to answer the newsletter and send my response to the original sender, but most importantly also to about 200 of those 221 other people listed in the newsletter:

> Hello everyone!
>
> how are you? :) Do you think it makes sense to attend LyonMUN more than once?
> A reminder less than 24h before they start assigning positions (whatever that
> means) is maybe a bit too last minute…
>
> All the best–   
> Robert

- I made an afford to adopt an informal, backslapper writing style.
- I used my personal mail address.
- I asked a question to provoke a reaction of other participants. A question that an organiser would never ask.
- I slightly criticised the timing of the original mailing. Something most organisers would refrain from.

Still, I received mails from 4 out of 200 people that think that I am part of the organiser team:

1. One person to ask to be assigned to a French-speaking committee.
2. Two persons from outside of the EU asking for an invitation letter to support the visa request.
3. One person asking: “If I pay today in the afternoon, then will be assigned to me a country as
well?”

I have not expected to receive such mails. I replied in the first two cases that I could not do anything and put the actual organiser in CC, so that they would get the question and could address it properly. Eventually, I received a mail from the organisers explaining that the newsletter was actually only supposed to be a payment reminder.

## Asking for Money

I hoped for an excuse to have leaked my personal mail address (or the fact that I participated). To render the issues even more evident, I escalated the situation and decided to reply in the third case with a request for payment:

> Hello Maxi [name changed],   
>
> have you sent the money to
>
> Robert Riemann   
> IXXI Lyon   
> IBAN FR7762756778270183266949365 ?   
>
> If so, I can assign you. :)
>
> Kind regards,   
> Robert

- As before, I put the organiser team in CC to ensure they can intervene. I sent this mail again from my personal mail address.
- To make it look more professional, I used my work as institution which is, of course, totally unrelated to the MUN business.
- I generated a random French IBAN using [a webservice](http://www.mobilefish.com/services/random_iban_generator/random_iban_generator.php). Those of you, who are interested in secure banking, may know that IBAN numbers include a checksum to detect transcription error. Read more on it on [Wikipedia](https://en.wikipedia.org/wiki/International_Bank_Account_Number#Algorithms). I changed one number, so that the checksum breaks. Then, I tested the IBAN and confirmed it is indeed invalid. This way, I can be sure that the account does not exist and already the attempt to enter the IBAN would deliver an error in many online banking interfaces.

In reaction, I got two messages from the organisers:

1. Mélanie Villar, that we "should all know and love" (quote from [her presentation][MV]) sent me via Facebook a message request:

    > Hey Robert, pourquoi tu donnes un faux IBAN par mail???   
    > C'est quoi ce délire

2. Nicolas Klingelschmitt, the LyonMUN 2017 director, wrote me a very appropriate message that I try to summarise here:
    - He appreciates my alert addressing the leak of mail addresses.
    - He explains I would have received the mail due to my informal consent for few promotional mails.
    - He criticises with emphasis my move to ask participants for money while pretending to be organiser and calls this practice scam that is punishable in France and remarks that LyonMUN may fill a legal complaint.
    - He asks me for clarification on my actions.

I asked Nicolas Klingelschmitt then to quote from his mail which he denied while inviting me at the same time for a discussion and I guess we might actually meet at some point here in Lyon. `:)`

I further brought some light into my intentions that were subsequently acknowledged with the remark that my method would be highly inappropriate from their point of view. More interestingly, they mentioned that their GMail account would have been locked for some time which would postpone the sending of a dedicated ERRATUM mail.

## ERRATUM

Eventually, an erratum mail was sent to everyone with an excuse of the data leak, a notice on how to stop subsequent mailings from Lyon MUN and this paragraph:

> If anyone ever tries to contact you on behalf of the LyonMUN organisation (especially for financial concerns) while not using one of our official email addresses, please disregard it and let us know.

I just sent a request for payment and they still mention only the potential of fraud. I think it is appropriate to admit that unauthorised mails have been sent. Further, they advise to check the sender mail address. How should that be possible?

## Conclusion: We are not done yet.

From a security point of view, there are still rather easy attack vectors. Note, that the official sender mail address is `LyonMun2017@gmail.com`. I just registered the GMail addresses `LyonMUN.helpdesk` and `LyonMUN2018`. Next year, it is I that has the official mail address and I could send requests for payments on their behalf to those 222 people. Further, I could try to make pass the helpdesk address as official mail address. The potential participants have no effective mean to distinguish here between official and fraud mail address.

Moreover, one could just send mails from the official mail address. Not all mails are scanned for authorised outgoing mail servers (read about [DKIM](http://www.dkim.org/)). GMail does display a warning, most others probably won't.

{% include figure image_path="/assets/img/lyonmun-mail-impersonation.jpg" alt="Changing the mail sender here with KMail. Thunderbird may do it as well." caption="Changing the mail sender here with KMail. Thunderbird may do it as well." %}

{% include figure image_path="/assets/img/lyonmun-mail-impersonation-gmail.jpg" alt="The mail gets delivered in the inbox of GMail and a short warning is displayed." caption="The mail gets delivered in the inbox of GMail and a short warning is displayed." %}

To be perfectly secure, inform participants right away to find the payment information uniquely on the website (that should use https/SSL). Further, I advise to use mail addresses ending on `@lyonmun.com`. As such, it is more complicated to create similar-looking mail addresses. Further, this may also solve the issue to find oneself blocked to send mails.

Unfortunately, even with DKIM, the impersonation of mail senders cannot be prevented in all cases. To prevent the latter, one could use an intranet instead of mails, e.g. based on [Discourse](http://discourse.org/). I wrote an article about it [earlier](2016-01-24-mailing-list-2-0-discourse.html).

[LM]: http://www.lyonmun.com/ "Website of the Model United Nations politics simulation in Lyon"
[MV]: http://www.lyonmun.com/index.php/2016/11/28/meet-our-team-02-2/
[MUN]: https://en.wikipedia.org/wiki/Model_United_Nations
