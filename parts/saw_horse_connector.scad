// File: saw_horse_connector.scad
//   A simple connector for attaching the Best Fence to a saw horse
// Includes:
//   use <parts/saw_horse_connector.scad>;

use <../tools/attachment_screw.scad>;
use <../tools/mount.scad>;
use <../hardware/bolt.scad>;
use <toe_clamp_body.scad>;
use <toe_clamp_insert.scad>;

include <../config.scad>;

// Module: saw_horse_connector
// Description: A simple connector for attaching the Best Fence to a saw horse
// Example(3D,Render): Exported Geometry
//   saw_horse_connector();
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

saw_horse_connector();
