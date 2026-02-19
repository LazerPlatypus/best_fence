// File: saw_horse_connector.scad
//   This file defines the assembly for the saw horse connector, which includes the toe clamp body, toe clamp insert, and bolts. 
//   It uses the parts defined in parts/saw_horse_connector.scad.
// Includes: 
//   include <assemblies/saw_horse_connector.scad>;

include <../parts/saw_horse_connector.scad>;
include <../config.scad>;

// Module: saw_horse_connector_assembly
// Description: This module assembles the saw horse connector by combining the toe clamp body, toe clamp insert, and bolts in the correct orientation and position.
// Example(3D,Render):
//   -- EXPORT_MODE = false;
//   saw_horse_connector_assembly();
module saw_horse_connector_assembly() {
    saw_horse_connector() {
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
    saw_horse_connector_assembly();
}