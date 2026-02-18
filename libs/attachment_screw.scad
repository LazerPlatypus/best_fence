// File: attachment_screw.scad
// A screw mount for the Best Fence mount, used to attach the mount to the saw stand
// Includes:
//   include <libs/attachment_screw.scad>;

include <../config.scad>;

// Module: attachment_screw
// Description: A simple screw mount for the Best Fence, used to attach the mount to the
//   saw stand. This module creates a 2x2 group of screws using variables in config.scad
//   This should be the first child of the [mount](models/mount.scad) module with `mounting_face` set to "TOP"
// Example(3D):
//   attachment_screw();
module attachment_screw() {
    translate([
        -SCREW_MOUNT_WIDTH/2, -SCREW_MOUNT_LENGTH/2, 0
    ]) {
        screw();
    }

    translate([
        SCREW_MOUNT_WIDTH/2, -SCREW_MOUNT_LENGTH/2, 0
    ]) {
        screw();
    }

    translate([
        -SCREW_MOUNT_WIDTH/2, SCREW_MOUNT_LENGTH/2, 0
    ]) {
        screw();
    }

    translate([
        SCREW_MOUNT_WIDTH/2, SCREW_MOUNT_LENGTH/2, 0
    ]) {
        screw();
    }
}

// Module: screw
// Description: A simple screw for holding the Best Fence, used by the [attachment_screw](libs/attachment_screw.scad)
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