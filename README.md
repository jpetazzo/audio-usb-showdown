# Audio USB interfaces: the showdown

I wanted to have an extra audio interface on our Raspbery Pis (for the
fonos project), so I bought a couple on Amazon (since they're less
than 10 bucks each anyway), planning to keep the best one and send
back the other. Unfortunately, things turned out to be more complicated
than expected — shocker, I know!) Some interfaces started to exhibit
background noise, distortion, and other things that you don't want
anywhere your music. But that was initially pretty random, and only
in combination with other things.

Willing to find out the root cause of the issue methodically, I ended
up buying a few different power supplies, USB hubs (powered and not),
more audio interfaces, and before I could realize it, things had gotten
out of hands and I was buried under a dozen of USB audio interfaces.

I decided to take that opportunity to run a methodic, quasi-scientific
benchmark on all of them. This is the result.


## What's in this repo

There is a number of `.yml` files containing essential test
information about the interfaces that I tested. For each interface,
there is the manufacturer and product name (as reported by USB
data), the electric current draw (as measured by a DROK USB
Ampere-meter), the ASIN (should you want to buy the same interface
on Amazon), and two kind-of-objective ratings for background noise
and output level.

Then there is a number of `.usb` files containing verbose USB
data about each interface. I honestly don't know how to interpret
them but I thought it wouldn't harm to include them.

And finally there is the script that I used to collect all that
data in an semi-automated manner.


## What's not in this repo

I also took pictures of each interface! But I'm reluctant about
adding 20 MB of crappy pictures of USB interfaces to a git repo.
I will probably add a link to a public Google Photos album, or
something like that.


## Noise and level ratings

What are these noise and level ratings? I graded from A to E, where
A is good and E is bad.


### TL,DR

You want an interface with a *noise rating* of B. (A is OK but almost
impossible to find, and you won't hear the difference anyway, so don't
bother.) C is OK too.

You want an interface with a *level rating* of B or C. A is fine but
might be almost too strong. D or E will be too weak compared to other
line level devices.


### What exactly are my noise and level ratings?

The *noise rating* indicates the background noise (hum, crackle, pop...)
when cranking the level all the way up, but without playing anything on
the interface.

- A is excellent (almost no audible noise)
- B is very good (very little noise; should be inaudible or barely noticeable)
- C is OK, but might be problematic if your source has a low volume (and you
  end up turning the volume up)
- D is bad (avoid!)
- E is horrible (sounds like a vynil with a pound of dirt spread on it)

The *level rating* indicates the strength of the audio signal when turning
the volume all the way up, and playing a sine test tone.

- A is very strong (almost too strong, to the point of saturating my mixer
  input)
- B is very strong, loud and clear
- C is OK, but you might need to crank up the volume
- D is weak (avoid!)
- E is so low that you'll need a multistage amp to hear anything
  (I'm kidding; I didn't grade any interface "E" anyway!)
 

### Test methodology

I don't have an oscilloscope, so I decided to improvise a test setup
which is entirely subjective, but very useful for me. I hope it will be
useful for you too! But it might be very hard for you to reproduce exactly
the same conditions. I'm sorry about that.

In other words: these ratings are relative to *my test equipment.*

I connected the sound interface that I was testing to my Native Instrument
Traktor Kontrol S8 mixer (used as a standalone mixer). I was using input
track B (but saw the same results on other tracks).

These inputs can be switched between `PH` and `LN` (phono and line levels
respectively). Switching to `PH` enables the phono preamp, which means
applying the RIAA curve equalization, and more importantly, a very
significant gain. I don't know how much gain exactly; I'd guess around
40 or 50 dB; in any case, enough to make the background hum noticeable
on *any* connected device. (Note that if you only connect a cable,
or nothing at all, there is no background hum, however; showing that
my mixer and its phono preamps are clean enough for the sake of this
test.)

To measure the noise rating, I switched the input to `PH`,
then cranked the gain of that track all the way up. At that point, the
background noise becomes very loudly audible, even if you plug a perfect
input; and the noise is sufficient to be visible on the pre-fader vu-meter
for the track.

Then I used the following scale.

- A: only the first LED of the vu-meter is on.
- B: 2-3 LEDs are on, and the background noise is limited to a hum.
- C: more LEDs are on (but still below the red zone, i.e. +0 dB on the
  vu-meter).
- D: the noise reaches +0 dB on the vu-meter.
- E: the noise exceeds +0 dB on the vu-meter and lights almost the whole
  red zone.

To measure the level rating, I switched the input back to `LN`, with
the gain all the way up. Then I set the volume to the max in the sound
card mixer, and played a sine test tone (check the shell script in this
repo to get the exact command used) and measured the pre-fader level
on the vu-meter again. The scale is kind of the oppose of the one I
used for the noise.

- A: all LEDs are lit; the signal is completely in the red, and might
  even be slightly distorted.
- B: almost all LEDs are lit; the signal is in the red, but there is
  no distortion (maybe 1 LED of headroom).
- C: there are 2-3 LEDs of headroom (the signal is still in the red).
- D: the signal is around +0 dB; i.e. it's barely lighting up the
  first red LED.
- E: the signal is below +0 dB.

