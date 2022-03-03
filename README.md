# NativeCord

SSB (site-specific browser) for Discord. In other words, all it does is load
Discord as a website... in an app.

## Why?

Electron sucks. And I've used Unite from Setapp and it sucked too. Plus making
an app that is literally just a WebView isn't that hard.

## Advantages:

- Much, much, much, **much** faster and more responsive
- Fast loading times
- Sandboxes Discord to have better privacy as it doesn't have access to OS APIs
- Native both on Apple Silicon and Intel
- More energy efficient
- No need for updating since it's literally just loading the website
- Tiny footprint as there is no browser included
- Behaves just like Safari so everything that works there works here
- Did I say it's faster?

## Known issues:

- Window controls ("traffic lights") overlap with Discord icon top-left
- Most calls to permission-based things like files and screenshare won't work
  - However, camera and microphone work, but require pressing "allow" every time
- Key bindings like CMD+, and CMD+A don't work
- Currently cannot open external links
- No way to reload
