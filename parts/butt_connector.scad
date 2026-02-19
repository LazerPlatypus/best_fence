// File: butt_connector.scad
//   A simple connector for attaching two pieces of Best Fence together
// Includes:
//   use <parts/butt_connector.scad>;

use <../tools/attachment_helping_hand.scad>;
use <../tools/mount.scad>;
use <../hardware/bolt.scad>;
use <toe_clamp_body.scad>;
use <toe_clamp_insert.scad>;

include <../config.scad>;

// Module: butt_connector
// Description: A simple connector for attaching two pieces of Best Fence together
// Usage:
//   butt_connector(){ <toe_clamp (optional)>; }
// Example(3D,Render): Exported Geometry
//   butt_connector();
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

butt_connector();