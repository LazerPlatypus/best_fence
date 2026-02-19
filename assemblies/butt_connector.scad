include <../parts/butt_connector.scad>;

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