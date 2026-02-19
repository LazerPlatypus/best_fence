// File: butt_connector.scad
//   This file defines the assembly for the butt connector, which includes the toe clamp body, toe clamp insert, and bolts. 
//   It uses the parts defined in parts/butt_connector.scad.
// Includes: 
//   include <assemblies/butt_connector.scad>;

include <../parts/butt_connector.scad>;
include <../config.scad>;

// Module: butt_connector_assembly
// Description: This module assembles the butt connector by combining the toe clamp body, toe clamp insert, and bolts in the correct orientation and position.
// Usage:
//   butt_connector_assembly();
// Example(3D,Render):
//   -- EXPORT_MODE = false;
//   butt_connector_assembly();
module butt_connector_assembly() {
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
}

if (EXPORT_MODE) {
    butt_connector_assembly();
}