# WezTerm config

## Notes

### References

Did a lot of bouncing around for a bit so the init is a culmination of that. Missed grabbing all the different references, but mostly YouTube since I'm more of a visual and audio learner. Missed quite a few of them, but will start a list below moving forward

[Henry Misc](https://www.youtube.com/watch?v=e34qllePuoc&list=PLAO5sxaZG8LbkrlrY2_RLVdKJCC33yOvp&index=3)

### File structure

With my nvim config I found it easier to reason about when the main access file just imported all the pieces needed so I've split up the code for ease since the configs can get quite complex for me.

- `functions` gets loaded and run, but not applied to the config. This is where listeners go and other global mods like tab bar design.
- `background` enough going on to split it into it's own file.
- `settings` outside of `background` this is where all the settings are.
- `key_bindings` all key bindings.

### Key Bindings

I disabled all key bindings and pasted in a list of all default key bindings at the time I created this repo. There may have been additional key bindings added since then.

I grouped them into general purposes and sorted from the end of the line back to the first `.` to get all of the repeated assignments together.

```bash
# after selecting the lines you want to sort
:'<,'>sort /[^.]*$/r
```

I've just commented out the ones I'm not using. This is so if anyone else would find it useful, then they have a full list. Enjoy!
