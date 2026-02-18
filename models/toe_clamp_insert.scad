// File: toe_clamp_insert.scad
//   A simple toe clamp component for holding the Best Fence, used by the {{mount}}
// Includes:
//   include <models/toe_clamp_insert.scad>;

include <../config.scad>;
use <bolt.scad>;

// Module: toe_clamp_insert
// Description: A simple toe clamp insert for holding the Best Fence, used by the {{toe_clamp_body}}
//   This module creates a simple toe clamp insert that is designed to fit snugly inside the {{toe_clamp_body}}
//   and provide a secure hold on the fence. The insert is designed to be used with a bolt that goes through the {{toe_clamp_body}}
//   and secures the clamp to the fence. 
//   .
//   The insert is designed to be centered around 0,0, with the highest point at 0,0,0; 
///  meaning all children should be centered about 0,0; with the highest point slightly above 0,0,0 (to allow for a clean cut). 
//   .
//   The insert is designed to be made from a hard material like PLA or PETG for durability.
// Example(3D,Render):
//   toe_clamp_insert() {
//     translate([0, 0, EPSILON]) {
//       bolt();
//     }
//   }
module toe_clamp_insert() {
    difference() {
        translate([0, 0, - TOE_CLAMP_INSERT_HEIGHT/2]) {
            cube([TOE_CLAMP_INSERT_WIDTH, TOE_CLAMP_INSERT_LENGTH, TOE_CLAMP_INSERT_HEIGHT], center = true);
        }
        children();
    }
}

if (EXPORT_MODE) {
    toe_clamp_insert() {
        translate([0, 0, EPSILON]) {
            bolt();
        }
    }
}