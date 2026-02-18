# File: butt\_connector.scad

A simple connector for attaching two pieces of Best Fence together

To use, add the following lines to the beginning of your file:

    include <models/butt_connector.scad>;

## File Contents

- [`butt_connector`](#module-butt_connector)


### Module: butt\_connector

**Description:** 

A simple connector for attaching two pieces of Best Fence together

**Example 1:** Exported Geometry

``` {.C linenos=True}
include <models/butt_connector.scad>;
butt_connector();
```

![butt\_connector Example 1](images/butt_connector/butt_connector.png "butt\_connector Example 1")

**Example 2:** Full Assembly

``` {.C linenos=True}
include <models/butt_connector.scad>;
butt_connector() {
    union() {
        rotate([0, 0, 180]) {
            color("blue") {
                toe_clamp_body(){
                    translate([0, 0, EPSILON]) {
                        bolt();
                        toe_clamp_insert() {
                            translate([0, 0, EPSILON]) {
                                bolt();
                            }
                        }
                    }
                }
            }
            color("white") {
                toe_clamp_insert() {
                    translate([0, 0, EPSILON]) {
                        bolt();
                    }
                }
            }
            color("black") {
                bolt();
            }
        }
    }
}
```

![butt\_connector Example 2](images/butt_connector/butt_connector_2.png "butt\_connector Example 2")

---

