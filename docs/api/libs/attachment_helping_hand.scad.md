# File: attachment\_helping\_hand.scad


To use, add the following lines to the beginning of your file:

    include <libs/attachment_helping_hand.scad>;

## File Contents

- [`attachment_helping_hand`](#module-attachment_helping_hand)


### Module: attachment\_helping\_hand

**Description:** 

A cylindar the same size as the head of the "Helping Hand"
should be used as the first child of the [mount](models/mount.scad) module, with `mounting_face` set to "BOTTOM"
derives its dimensions from the variables in config.scad

**Example 1:** 

``` {.C linenos=True}
include <libs/attachment_helping_hand.scad>;
attachment_helping_hand();
```

![attachment\_helping\_hand Example 1](images/attachment_helping_hand/attachment_helping_hand.png "attachment\_helping\_hand Example 1")

---

