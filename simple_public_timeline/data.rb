# coding: utf-8
require 'json'

def get_feed
  JSON.parse(
'[{
"created_at": "Tue Feb 27 21:11:40 +0000 2018",
  "text": "RT @honeydrop_506: 180222 ICN #백현 #BAEKHYUNnn나의 겨울과 너nn#iHeartAwards #BestFanArmy #EXOL @weareoneEXO https://t.co/hg7I3xAlBg",
  "source": "",
  "user": {
            "screen_name": "lovbyun",
           "url": "https://curiouscat.me/baekhyun-l",
           "profile_image_url_https": "https://pbs.twimg.com/profile_images/967130320259526656/0xZ-wxXJ_normal.jpg"
          }
 },
 {
   "created_at": "Tue Feb 27 21:11:40 +0000 2018",
  "text": "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.",
  "source": "",
  "user": {
            "screen_name": "freshiama",
           "url": "#",
           "profile_image_url_https": "https://picsum.photos/300"
          }
 },
 {
   "created_at": "Tue Feb 27 21:11:40 +0000 2018",
     "text": "Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.",
     "source": "",
     "user": {
               "screen_name": "gnomebrilliant",
              "url": "#",
              "profile_image_url_https": "https://picsum.photos/300"
             }
 },
 {
   "created_at": "Tue Feb 27 21:11:40 +0000 2018",
     "text": "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
     "source": "",
     "user": {
               "screen_name": "linkinshort",
              "url": "#",
              "profile_image_url_https": "https://picsum.photos/300"
             }
 },
 {
   "created_at": "Tue Feb 27 21:11:40 +0000 2018",
     "text": "It is a paradisematic country, in which roasted parts of sentences fly into your mouth.",
     "source": "",
     "user": {
               "screen_name": "eatonsour",
              "url": "#",
              "profile_image_url_https": "https://picsum.photos/300"
             }
 },
 {
   "created_at": "Tue Feb 27 21:11:40 +0000 2018",
     "text": "Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.",
     "source": "",
     "user": {
               "screen_name": "prodigyscoop",
              "url": "#",
              "profile_image_url_https": "https://picsum.photos/300"
             }
 },
 {
   "created_at": "Tue Feb 27 21:11:40 +0000 2018",
  "text": "The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen.",
  "source": "",
  "user": {
            "screen_name": "squamedia",
           "url": "#",
           "profile_image_url_https": "https://picsum.photos/300"
          }
 }
]')
end
