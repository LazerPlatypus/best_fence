// File: toe_clamp_body.scad
//   A simple toe clamp component for holding the Best Fence
// Includes:
//   use <parts/toe_clamp_body.scad>;

use <../deps/coord_kit/core.scad>;
use <../hardware/bolt.scad>;
use <toe_clamp_insert.scad>;

include <../config.scad>;

// Module: toe_clamp_body
// Description: A simple toe clamp for holding the Best Fence
//   This module creates a simple toe clamp body that takes the [toe_clamp_insert](parts/toe_clamp_insert.scad) and a bolt as children
//   This module is centered around 0,0,0, meaning all children should be centered about 0,0,0 as well.
//   to secure the clamp to the fence. The clamp body is designed to fit snugly around the insert and provide a secure hold on the fence.
//   it is recommended to make the body from a rubbery/grippy material like TPU
// Usage:
//   toe_clamp_body() { <toe_clamp_insert (optional)>; }
// Example(3D,Render):
//   use <parts/toe_clamp_insert.scad>;
//   use <hardware/bolt.scad>;
//   include <config.scad>;
//   toe_clamp_body() {
//     translate([0, 0, EPSILON]) {
//       bolt();
//       toe_clamp_insert() {
//        translate([0, 0, EPSILON]) {
//           bolt();
//         }
//       }
//     }
//   }
module toe_clamp_body() {
    points = _calculate_toe_clamp_body_points();
    center_x = _calculate_center_x_toe_clamp_body(points);
    difference() {
        translate([-center_x, 0, 0]) {
            planar_linear_extrude_points(
                points = points, length = TOE_CLAMP_LENGTH, plane = "Y", center = true
            );
        }
        children();
    }
}

// Function: _calculate_toe_clamp_body_points
// Status: INTERNAL
// Description: Calculates the points for the toe clamp body geometry based on global variables
// Example(2D):
//   use <deps/coord_kit/core.scad>;
//   polygon(points_to_coords(_calculate_toe_clamp_body_points()));
function _calculate_toe_clamp_body_points() =
    [
        [0, 0],
        [
            tan(90-TOE_CLAMP_ANGLE) * TOE_CLAMP_HEIGHT, 
            -1 * TOE_CLAMP_BOTTOM_WIDTH,
        ],
        [
            tan(90-TOE_CLAMP_ANGLE) * TOE_CLAMP_HEIGHT + TOE_CLAMP_BOTTOM_WIDTH,
            -1 * TOE_CLAMP_BOTTOM_WIDTH,
        ],
        [
            tan(90-TOE_CLAMP_ANGLE) * TOE_CLAMP_HEIGHT + TOE_CLAMP_BOTTOM_WIDTH,
            0,
        ],
    ];

// Function: _calculate_center_x_toe_clamp_body
// Status: INTERNAL
// Description: Calculates the center x coordinate for the toe clamp body geometry based on the points
// Example:
//   _calculate_center_x_toe_clamp_body(_calculate_toe_clamp_body_points());
function _calculate_center_x_toe_clamp_body(toe_clamp_points) =
    (toe_clamp_points[0][0] + toe_clamp_points[2][0]) / 2;

toe_clamp_body() {
    translate([0, 0, EPSILON]) {
        bolt();
        toe_clamp_insert() {
            translate([0, 0, EPSILON]) {
                bolt();
            }
        }
    }
}