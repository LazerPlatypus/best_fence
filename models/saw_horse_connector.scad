// File: saw_horse_connector.scad
//   A simple connector for attaching the Best Fence to a saw horse
// Includes:
//   include <models/saw_horse_connector.scad>;

use <../libs/attachment_screw.scad>;
use <../libs/bolt.scad>;
use <../libs/mount.scad>;
include <../config.scad>;
use <toe_clamp_body.scad>;
use <toe_clamp_insert.scad>;

// Module: saw_horse_connector
// Description: A simple connector for attaching the Best Fence to a saw horse
// Example(3D,Render): Exported Geometry
//   saw_horse_connector();
// Example(3D,Render): Full Assembly
//   saw_horse_connector() {
//       union() {
//           rotate([0, 0, 180]) {
//               color("blue") {
//                   toe_clamp_body(){
//                       translate([0, 0, EPSILON]) {
//                           bolt();
//                           toe_clamp_insert() {
//                               translate([0, 0, EPSILON]) {
//                                   bolt();
//                               }
//                           }
//                       }
//                   }
//               }
//               color("white") {
//                   toe_clamp_insert() {
//                       translate([0, 0, EPSILON]) {
//                           bolt();
//                       }
//                   }
//               }
//               color("black") {
//                   bolt();
//               }
//           }
//       }
//   }
module saw_horse_connector() {
  mount(
        num_channels=1,
        channel_spacing=20,
        mounting_face="TOP"
    ) {
        translate([0, 0, EPSILON]) {
            attachment_screw();
        }
        children();
    }
}

if (EXPORT_MODE) {
    saw_horse_connector();
}
