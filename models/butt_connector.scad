// File: butt_connector.scad
//   A simple connector for attaching two pieces of Best Fence together
// Includes:
//   include <models/butt_connector.scad>;

use <../libs/attachment_helping_hand.scad>;
use <../libs/bolt.scad>;
use <../libs/mount.scad>;
include <../config.scad>;
use <toe_clamp_body.scad>;
use <toe_clamp_insert.scad>;

// Module: butt_connector
// Description: A simple connector for attaching two pieces of Best Fence together
// Example(3D,Render): Exported Geometry
//   butt_connector();
// Example(3D,Render): Full Assembly
//   butt_connector() {
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
module butt_connector() {
    mount(
        num_channels=2,
        channel_spacing=20,
        mounting_face="BOTTOM"
    ) {
        translate([0, 0, -EPSILON]) {
            attachment_helping_hand();
        }
        children();
    }
}

if (EXPORT_MODE) {
    butt_connector();
}