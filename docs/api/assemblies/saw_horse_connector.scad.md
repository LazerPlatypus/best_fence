# File: saw\_horse\_connector.scad

This file defines the assembly for the saw horse connector, which includes the toe clamp body, toe clamp insert, and bolts.
It uses the parts defined in parts/saw_horse_connector.scad.

To use, add the following lines to the beginning of your file:

    include <assemblies/saw_horse_connector.scad>;

## File Contents

- [`saw_horse_connector_assembly`](#module-saw_horse_connector_assembly)


### Module: saw\_horse\_connector\_assembly

**Usage:** 

- saw_horse_connector_assembly();

**Description:** 

This module assembles the saw horse connector by combining the toe clamp body, toe clamp insert, and bolts in the correct orientation and position.

**Example 1:** 

``` {.C linenos=True}
include <assemblies/saw_horse_connector.scad>;
saw_horse_connector_assembly();
```

![saw\_horse\_connector\_assembly Example 1](images/saw_horse_connector/saw_horse_connector_assembly.png "saw\_horse\_connector\_assembly Example 1")

---

