To run, open two consoles and run both:
  -  `rake twitter_cache`
  -  `rackup`


This ended up being not entirely simple, in part due to a strong desire to avoid EventMachine. It appears that all available ruby options make use of EM. Since the instructions say to choose the data and/or API of my choice, I went ahead and wrote a tweet caching daemon in node.js, neatly avoiding the issue entirely. The daemon connects to the "sample" tweet stream, writing all tweets received to a LevelDB key/value store keyed by the timestamp of the tweet. Older tweets are deleted every hour, and a static JSON file containing the 20 latest tweets is re-generated every 5 seconds. Extending this to additional quantities or throwing an HTTP server on it to make the quantity arbitrarily configurable by a query param would be at most another 3-5 lines of code.

Another detail where things become not-so-simple is that a spec is required, yet the simple implementation is almost entirely UI code. Because the act of retrieving data can be reduced to a single request (in my case, literally reading a static file), there is no backend logic to test. Any unit test written against the data would simply be testing the remote service, which isn't local code and thus implicitly trusted. Any _unit_ test written against the UI would, in real life, be entirely too fragile to maintain. Perhaps by providing my own backend I ended up making the ruby frontend _too_ simple.

In lieu of a fluff spec, I invite you to partake of this segment from way back in the "rails envy" podcast days: http://soundcloud.com/gregg/we-aint-got-no-rspec

Hopefully the refactoring example shows that I know what rspec is and how to use it. ;)

I personally don't make use of RVM, so I opted to include a .ruby-version for rbenv in addition to a bare minimum .rvmrc (Note: bundler is a safer place to ensure a known ruby engine). Until I started playing with ruby 2.0.0, I was actually using my own fork of ruby 1.9.3 and it's just easier to point rbenv to a custom build of ruby. Speaking of which, you might be interested in a few patches I wrote against 1.9.3:

  -  add alloc_location method to all objects to get file and line where it was allocated (warning: obviously performance harming, but good for debugging): https://github.com/ttilley/ruby/commit/e7b077553f4ac257f277a426c5ced73c9cc4d3e8

  -  make additional GC settings tunable, via the same ENV vars as used by REE and make one of the 1.9.1+ tunables compatible with the REE name for it, which is just slightly different: https://github.com/ttilley/ruby/commit/36bc3234da1d47f3edb7c305a5ab4e7ec3003021

Note that Rubinius contains something similar to alloc_location already if you turn it on, and is a sweet ruby runtime all around. The impact there is significantly less than enabling GC_DEBUG in MRI.

This play project has reminded me of just how long I've been focused on almost entirely backend and unix systems administration work. It shames me to admit, but I actually had to look up HAML syntax for attributes... and a few other things slightly more embarassing. I went somewhat beyond the required "barebones styling" suggestion as an exercise in refreshing my memory.
