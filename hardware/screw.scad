// File: screw.scad
// A simple screw for holding the Best Fence, used by the [attachment_screw](tools/attachment_screw.scad)
//   This module creates a simple screw with a tapered head and no threads.
// Includes:
//   include <hardware/screw.scad>;

include <../config.scad>;

// Module: screw
// Description: A simple screw for holding the Best Fence, used by the [attachment_screw](tools/attachment_screw.scad)
//   This module creates a simple screw with a tapered head and no threads.
// Example(3D,Render):
//   screw();
module screw() {
    screw_head_height = (SCREW_HEAD_RADIUS - SCREW_SHANK_RADIUS)/tan(SCREW_HEAD_ANGLE);
    screw_shank_height = SCREW_HEIGHT - screw_head_height;

    translate([0, 0, -SCREW_HEIGHT]) {
        translate([0, 0, screw_shank_height]) {
            // tapered head
            cylinder(h = screw_head_height, r1 = SCREW_SHANK_RADIUS, r2 = SCREW_HEAD_RADIUS, center = false);
        }
    
        // shank
        cylinder(h = screw_shank_height, r = SCREW_SHANK_RADIUS, center = false);
    }
}