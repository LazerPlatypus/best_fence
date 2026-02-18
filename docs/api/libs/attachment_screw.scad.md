# File: attachment\_screw.scad


To use, add the following lines to the beginning of your file:

    include <libs/attachment_screw.scad>;

## File Contents

- [`attachment_screw`](#module-attachment_screw)
- [`screw`](#module-screw)


### Module: attachment\_screw

**Description:** 

A simple screw mount for the Best Fence, used to attach the mount to the
saw stand. This module creates a 2x2 group of screws using variables in config.scad
This should be the first child of the [mount](models/mount.scad) module with `mounting_face` set to "TOP"

**Example 1:** 

``` {.C linenos=True}
include <libs/attachment_screw.scad>;
attachment_screw();
```

![attachment\_screw Example 1](images/attachment_screw/attachment_screw.png "attachment\_screw Example 1")

---

### Module: screw

**Description:** 

A simple screw for holding the Best Fence, used by the [attachment_screw](libs/attachment_screw.scad)
This module creates a simple screw with a tapered head and no threads.

**Example 1:** 

``` {.C linenos=True}
include <libs/attachment_screw.scad>;
screw();
```

![screw Example 1](images/attachment_screw/screw.png "screw Example 1")

---

