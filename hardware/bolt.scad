// File: bolt.scad
//  A simple bolt component for holding the Best Fence, used by the [toe_clamp_body](parts/toe_clamp_body.scad)
// Includes:
//   use <hardware/bolt.scad>;

include <../config.scad>;

// Module: bolt
// Description: A simple bolt for holding the Best Fence, used by the [toe_clamp_body](parts/toe_clamp_body.scad)
//   This module creates a simple bolt with a hex head and no threads.
// Usage:
//   bolt();
// Example(3D,Render):
//   bolt();
module bolt() {
    translate([0, 0, -BOLT_HEAD_HEIGHT]) {
        // rotate so the hexagon is flat on the top and bottom, not standing on a point
        rotate([0, 0, 90]) {
            // cheater way to make a hexagon by using a cylinder with 6 facets
            cylinder(h = BOLT_HEAD_HEIGHT, r = BOLT_HEAD_RADIUS, center = false, $fn=6);
        }
        translate([0, 0, -BOLT_SHANK_HEIGHT]) {
            cylinder(h = BOLT_SHANK_HEIGHT, r = BOLT_SHANK_RADIUS);
        }
    }
}

bolt();