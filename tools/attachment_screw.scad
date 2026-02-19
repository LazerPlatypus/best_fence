// File: attachment_screw.scad
// A screw mount for the Best Fence mount, used to attach the mount to the saw stand
// Includes:
//   use <tools/attachment_screw.scad>;

use <../hardware/screw.scad>;
include <../config.scad>;

// Module: attachment_screw
// Description: A simple screw mount for the Best Fence, used to attach the mount to the
//   saw stand. This module creates a 2x2 group of screws using variables in config.scad
//   This should be the first child of the [mount](parts/mount.scad) module with `mounting_face` set to "TOP"
// Usage:
//   attachment_screw();
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

attachment_screw();