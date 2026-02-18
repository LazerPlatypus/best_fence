# File: toe\_clamp\_insert.scad

A simple toe clamp component for holding the Best Fence, used by the [mount](models/mount.scad#module-mount)

To use, add the following lines to the beginning of your file:

    include <models/toe_clamp_insert.scad>;

## File Contents

- [`toe_clamp_insert`](#module-toe_clamp_insert)


### Module: toe\_clamp\_insert

**Description:** 

A simple toe clamp insert for holding the Best Fence, used by the [toe\_clamp\_body](models/toe_clamp_body.scad#module-toe_clamp_body)
This module creates a simple toe clamp insert that is designed to fit snugly inside the [toe\_clamp\_body](models/toe_clamp_body.scad#module-toe_clamp_body)
and provide a secure hold on the fence. The insert is designed to be used with a bolt that goes through the [toe\_clamp\_body](models/toe_clamp_body.scad#module-toe_clamp_body)
and secures the clamp to the fence.

The insert is designed to be centered around 0,0, with the highest point at 0,0,0;

**Example 1:** 

``` {.C linenos=True}
include <models/toe_clamp_insert.scad>;
toe_clamp_insert() {
  translate([0, 0, EPSILON]) {
    bolt();
  }
}
```

![toe\_clamp\_insert Example 1](images/toe_clamp_insert/toe_clamp_insert.png "toe\_clamp\_insert Example 1")

---

