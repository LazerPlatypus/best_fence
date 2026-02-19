# File: butt\_connector.scad

This file defines the assembly for the butt connector, which includes the toe clamp body, toe clamp insert, and bolts.
It uses the parts defined in parts/butt_connector.scad.

To use, add the following lines to the beginning of your file:

    include <assemblies/butt_connector.scad>;

## File Contents

- [`butt_connector_assembly`](#module-butt_connector_assembly)


### Module: butt\_connector\_assembly

**Description:** 

This module assembles the butt connector by combining the toe clamp body, toe clamp insert, and bolts in the correct orientation and position.

**Example 1:** 

``` {.C linenos=True}
include <assemblies/butt_connector.scad>;
butt_connector_assembly();
```

![butt\_connector\_assembly Example 1](images/butt_connector/butt_connector_assembly.png "butt\_connector\_assembly Example 1")

---

