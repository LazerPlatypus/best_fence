use <../models/attachment_helping_hand.scad>;
use <../models/bolt.scad>;
use <../models/mount.scad>;
use <../models/toe_clamp_body.scad>;
use <../models/toe_clamp_insert.scad>;
include <../config.scad>;



if (EXPORT_MODE) {
    mount(
        num_channels=2,
        channel_spacing=20,
        mounting_face="BOTTOM"
    ) {
        translate([0, 0, -EPSILON]) {
            attachment_helping_hand();
        }
    }
} else {
    mount(
        num_channels=2,
        channel_spacing=20,
        mounting_face="BOTTOM"
    ) {
        translate([0, 0, -EPSILON]) {
            attachment_helping_hand();
        }
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