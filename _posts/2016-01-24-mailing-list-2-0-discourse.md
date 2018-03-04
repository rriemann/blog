---
title: "Mailing-List 2.0: Discourse"
date: 2016-01-24 19:17 CET
kate: hl markdown;
published: true
lang: en
categories: [digitalisation]
tags:
  - tricks
keywords:
  - communication
  - forum
  - email
  - mailing lists
  - discourse
excerpt_separator: <!--more-->
---

**You got a few people working on something and you seek for an efficient way to
communicate (ideas, news, messages, etc.) online. This guide gives you an overview about
what you could expect in the past and what you should ask for nowadays.**

### Mails

According to Wikipedia, the [first mail](https://en.wikipedia.org/wiki/Ray_Tomlinson)
was sent in 1971. The access to a network we call Internet today was quite limited
in these early days. Users have been mostly universities, and I guess, not everyone,
but mostly the STEM disciplines Science, Technology, Engineering, and Mathematics.
So it comes at no surprise that mails are perceived as inconvenient and antiquated.

<!--more-->

### Mails are dead

Let’s summarise some downsides of mails:

- You have to manage a mail address book and it will never be complete.
- You cannot easily have group conversations. When sending a mail to many recipients,
  one has to rely on everyone maintaining the same recipient list. Individuals
  cannot quit such a group conversation.
- E-Mails are hardly [mashable](http://www.urbandictionary.com/define.php?term=mashable&defid=2555425).
  That means, you cannot include pictures, (Youtube) videos, Twitter quotes as you
  might know it from Social Networks. There are links and attachments. Everything
  else is mostly out of scope for an everyday user, even if it might be technical
  possible.
- You do not receive confirmations once your mail has been received and read.
- You cannot control who can send a mail to you.
- You have to clean your inbox, delete mails, etc.
- Long conversations with many replies of many participants are lacking a clear
  structure and can become quite confusing.
- You cannot link to a mail. You have to send a copy every time.
- You cannot take back a mail once you have sent it.

<!-- more -->

### 21st century features

Many downsides are actually based on our expectations based on experiences with
alternative platforms we got to known and appreciate.

{% include figure image_path="/assets/img/communication-newsgroup.png" alt="Usenet reader Thunderbird, CC BY-SA 3.0 Wikipedia" caption="Usenet reader Thunderbird, CC BY-SA 3.0 Wikipedia" %}{:.pull-right style="width: 450px;"}
- 1980: [Usenet](https://en.wikipedia.org/wiki/Usenet), easier few-to-many conversations.
- 1996: Instant Messaging (IM), conversations in real-time. E.g. ICQ, MSN, IRC etc.
- 2003: Skype (Video Chat), real-time conversations with video
- 2004: Facebook (Social Network), real-time (group) (video) conversations, polls, videos, pictures, etc.
- 2006: Twitter (Micro Blogging Platform), real-time, #taggging, @mentions
- 2007: Google GMail, more convenient mail for the browser, mails grouped by subject, full-text search in all mails
- 2013: Slack (more convenient real-time chat), mashable
- 2014: MailChimp[^mc], more convenient mailing lists, newsletters, etc.
- many special-purpose Social Networks, like Asana, Trello, Couchsurfing, Doodle, LinkedIn, Instagram, Pinterest, Tumblr, Flickr, etc.
- many smartphone apps: Whatsapp, Snapchat, Telegram, TextSecure, Tinder, etc.

[^mc]: MailChimp has actually been founded already in 2011, but it took a long while before I got aware of it.

Let’s assume, you have an organisation with many members that like to work
together and have to communicate efficently. The organisation members might belong
to teams concerned with different tasks. The wish-list might look as follows:

1. It is easy to send a message to the whole organisation selected teams or selected members.
2. It is easy to use and does not require any special knowledge.
3. It can be used with many devices, i.e. PC, Mac, Android, iPhone, etc.
4. It is not expensive.
4. It provides a full-text search.
5. It is mashable. One can easily embed videos, smileys, pictures, files and content from
   various popular websites. Plain text is so last century!
6. Members or teams can be @mentioned in order to notify them as you know it from
   Twitter or Facebook.
7. It is in real-time and feels like a chat.
8. Messages provide a clear context. Answers should be grouped by subject and team.
9. There must be no Spam. Every member can configure notifications to a minimum or to
   instant notifications on everything. Ideally, the configuration is very fine-grained,
   e.g. per team and per topic.
10. It shall allow to run a survey/poll.
11. It provides an outstanding ergonomy and design to be adopted[^ergonomy]

[^ergonomy]: This is an empiric experience of mine.

There are some technical requirements that are important as well. There should
be backups and no [Vendor lock-in](https://en.wikipedia.org/wiki/Vendor_lock-in)
to ensure that the platform can be changed in the future if this is necessary at
some point.

### On Social Networks

So there is a varity of choice of social networks and communication platforms.
[Joel Spolsky][social networks] tried to explain the differences in simple terms:

> Let me see if I can explain how *Social Networks* work. They make these apparati
> that draw a box on somebody's computer screen. That person then types words into
> that box on their screen. Then, the Social  Network uses some computer codes
> to copy those words onto somebody else’s computer screen, so that other person
> can then read them.
>
> It's as easy as that. Now, different Social Networks have different rules
> governing which screens the words are copied to. The "email companies"
> require you to type, separately, a list of which people's screens you want your
> words copied to. [\[…\]][social networks]

Let’s go one step further. Social Networks not only have different mechanisms to
allow or prohibit communication within its participants, but also to prioritize
content. While mails and text messages will list content ordered by time, some
networks consider as well the popularity, e.g. Facebook. Ranking content appropriately
is an well-covered subject of research and one of the key pillars of the success
of [Google][pr] and [Amazon][reco].

[pr]: https://en.wikipedia.org/wiki/PageRank "Google PageRank"
[reco]: http://fortune.com/2012/07/30/amazons-recommendation-secret/ "Amazon Recommendation Algorithm"
[social networks]: https://plus.google.com/117114202722218150209/posts/KhMRNmgGniP?hl=en

So how does Facebook, so far used by many organisations, perform with respect to
mentioned requirements and how does it rank content? If you want to separate content
on Facebook from other postings, a Facebook group is required. Administrators can
pin messages to keep them shown first. Apart from that, messages are sorted by
creation date of the message itself or the most recent comment to a message. A
few Youtube videos and cat pictures can push otherwise highly popular content out
of sight. Is is difficult to find messages that has been sent long ago.
Facebook has a policy to enforce Vendor lock-in. Support for an open chat protocol (Jabber)
or mail answers to notifications have been successively removed. Messages on
Facebook cannot be archived. Facebook is not add-free. Facebook requires every
member to have an account. I am personally convinced that Facebook is inferior
compared to Slack, Google Plus and Discourse. I consider Discourse to be a very
good match so far. I explain why.

### Discourse discussion platform

{% include figure image_path="/assets/img/discourse-screenshot.jpg" alt="Discourse" caption="Discourse" %}{:.pull-right style="width: 450px;"}

Discourse is an open-source project founded in 2013 and promises to
provide a free, open and simple platform for “Civilized Discussion” in the internet.
Have a look on their website <http://www.discourse.org/>. It satisfies most, if
not all, requirements very well that have been identified. Please check the
comprehensive website for details.

A *thread* or *topic* consists of an initial message and related replies and
are firstly prioritized using a mix of likes, activity and timeliness. Topics
belong to a category that can limit the visibility using access groups. Accounts
can be assigned to one or more groups. Private messages within two or more members
are supported as well. Messages can contain @mentions of individual
accounts as well as groups. Youtube videos, tweets, Wikipedia articles, Maps, Google
Spreadsheets etc. are embedded automatically once a link is provided. Pictures and
attachments can be added by drag'n'drop. The platform is easily accessible via
the browser of any modern device and provides this way also an ‘app experience’ without
the need to install anything.

To illustrate the possibilities, consider these use cases:

- All members are asked to enable instant notifications for a category *Announcements*
  in which only members of the group *Organisation Board* are allowed to create topics.
  Once a new topic has been opened, all members receive a mail. You got actually an
  internal newsletter.
- *Organisation Board* meetings can be announced in a private category *Board Meetings*.
  Once, the meeting starts, the discussion will happen in real-time using replies to
  the announcements.
- The creator of a topic can allow other members to change the first message of the
  topic. Changes are documented and can be reverted. The so called wiki mode comes
  in handy to create a knowledge data base. Questions related to the text can be
  asked in the replies to the topic. The wiki mode can be disabled at any time.
- The comment section of a website can be handled by Discourse as well.

### Long live the mail

However, Discourse won’t help to get around the mail. Most web services require
a mail address for sign up. Mail is still the *lowest common denominator*. If
social networks require to confirm the identity, change the password, push out
notifications, a mail is sent. Many people rely on mails and appreciate the
following advantages:

- Mails is a decentralised, robust technology. Everyone can choose its preferred provider.
- Mails are standardised and extensible. Mails can be created and received using
  a wide range of different applications and devices.
- Mails are very efficient and work with a slow internet connection as well.

For those, who would prefer for these reasons a mailing list that distributes
mail to a predefined list of subscribers, there is a good news. Discourse account
holders can activate instant mail notifications on all messages and reply to those
per mail. The response will appear immediately online for those that are connected.

Providing a simple mail interface for minimalists and a comprehensive website
for more advanced use cases, Discourse is a good match.

*[STEM]: Science, Technology, Engineering, and Mathematics
