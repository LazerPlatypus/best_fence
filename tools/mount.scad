// File: mount.scad
//   This part interfaces with the BestFence system
//   It has slots for channels and a blind hole for a "helping hand" arm
// Includes:
//   include <tools/mount.scad>;

include <../config.scad>;
include <../deps/coord_kit/core.scad>;

// Module: mount
// Usage:
//   mount(num_channels=2, channel_spacing=20);
// Description:
//   Creates a mount for the BestFence system with specified number of channels and spacing.
//   .
//   uses global variables in config.scad to create the correct toe clamp, helping hand hole, and attachment geometry.
//   .
//   use children to add additional geometry to the mount. first child should be the attachment mechanism, the second child will
//   be duplicated in each `channel` slot.
// Arguments:
//   num_channels = `number` Number of channels to include in the mount (default: 2)
//   channel_spacing = `number` Spacing between channels in mm (default: 20)
//   mounting_face = `string` Which face to mount the channels on. Allowed values: "TOP", "BOTTOM" (default: "BOTTOM")
// Example(3D,Render): One Channel, top mount
//   mount(num_channels=1, channel_spacing=14, mounting_face="TOP");
// Example(3D,Render): Two Channels, bottom mount
//   mount(num_channels=2, channel_spacing=20, mounting_face="BOTTOM");
module mount(num_channels=2, channel_spacing=20, mounting_face="BOTTOM") {
    _ = _validate_args_mount(num_channels, channel_spacing, mounting_face);

    support_points = _calculate_support_points();
    channel_points = _calculate_channel_points();

    channel_length = TOE_CLAMP_LENGTH + TOE_CLAMP_TOLERANCE_LENGTH;

    difference() {
        union() {
            for( i = [0 : num_channels - 1] ) {
                translate([0, i * channel_spacing + i * channel_length, 0]) {
                    // support
                    planar_linear_extrude_points(
                        points = support_points, 
                        length = channel_spacing, 
                        plane = "Y", 
                    );
                    // channel & bolt/spring slot
                    translate([0, channel_spacing, 0]) {
                        difference() {
                            // channel
                            planar_linear_extrude_points(
                                points = channel_points, 
                                length = channel_length, 
                                plane = "Y", 
                            );

                            // bolt slot
                            translate(
                                [
                                    BEST_FENCE_INTERIOR_WIDTH +
                                        (
                                            BEST_FENCE_WALL_THICKNESS + TOE_CLAMP_BOTTOM_WIDTH + TOE_CLAMP_TOLERANCE_WIDTH
                                        ) / 2,
                                    channel_length / 2,
                                    -1 * (BEST_FENCE_INTERIOR_HEIGHT + MOUNT_HEIGHT / 2),
                                ]
                            ) {
                                cube(
                                    [
                                        BEST_FENCE_WALL_THICKNESS + TOE_CLAMP_BOTTOM_WIDTH + TOE_CLAMP_TOLERANCE_WIDTH,
                                        BOLT_SHANK_RADIUS * 2,
                                        MOUNT_HEIGHT + EPSILON,
                                    ], center=true
                                );
                            }

                            // spring slot
                            translate(
                                [
                                    BEST_FENCE_INTERIOR_WIDTH +
                                        (
                                            BEST_FENCE_WALL_THICKNESS + TOE_CLAMP_BOTTOM_WIDTH + TOE_CLAMP_TOLERANCE_WIDTH
                                        ) / 2,
                                    channel_length / 2,
                                    -1 * (BEST_FENCE_INTERIOR_HEIGHT + SPRING_HEIGHT / 2),
                                ]
                            ) {
                                cube(
                                    [
                                        BEST_FENCE_WALL_THICKNESS + TOE_CLAMP_BOTTOM_WIDTH + TOE_CLAMP_TOLERANCE_WIDTH,
                                        SPRING_RADIUS * 2,
                                        SPRING_HEIGHT + EPSILON,
                                    ], center=true
                                );
                            }
                        }

                        if ($children > 1) {
                            // user defined geometry that should be centered in the channel
                            translate(
                                [
                                    BEST_FENCE_INTERIOR_WIDTH + BEST_FENCE_WALL_THICKNESS + TOE_CLAMP_BOTTOM_WIDTH / 2,
                                    channel_length / 2,
                                    0,
                                ]
                            ) {
                                children(1);
                            }
                        }
                    }
                }
            }

            // capping support
            translate([0, num_channels * channel_spacing + num_channels * channel_length, 0]) {
                planar_linear_extrude_points(
                    points = support_points, 
                    length = channel_spacing, 
                    plane = "Y", 
                );
            }
        }
        // attachment geometry (if provided)
        if ($children > 0) {
            if (mounting_face == "BOTTOM") {
                translate(
                    [
                        BEST_FENCE_INTERIOR_WIDTH / 2,
                        (num_channels * (channel_spacing + channel_length) + channel_spacing) / 2,
                        -1 * (MOUNT_HEIGHT + BEST_FENCE_INDEXING_LIP_HEIGHT),
                    ]
                ) {
                    children(0);
                }
            } else if (mounting_face == "TOP") {
                translate(
                    [
                        BEST_FENCE_INTERIOR_WIDTH / 2,
                        (num_channels * (channel_spacing + channel_length) + channel_spacing) / 2,
                        0,
                    ]
                ) {
                    children(0);
                }
            } else {
                // we should never get here thanks to parameter validation
                // but it is better to fail loudly than to produce an incorrect model
                assert(false, "Invalid mounting_face value. Allowed values: 'TOP', 'BOTTOM'");
            }
        }
    }
}

// Helper functions

// Function: _validate_args_mount()
// Status: INTERNAL
// Description: Validates the arguments passed to mount() and throws an error if any are invalid
// Arguments:
//   num_channels = `number` Number of channels to include in the mount (must be greater than 1, less than 11)
//   channel_spacing = `number` Spacing between channels in mm (must be greater than 0)
//   mounting_face = `string` Which face to mount the channels on. Allowed values: "TOP", "BOTTOM"
// Example: Valid arguments
//   // valid
//   _validate_args_mount(2, 20, "BOTTOM");
// Example: Invalid `num_channels`
//   _validate_args_mount(0, 20, "BOTTOM"); 
//   // throws error "Invalid num_channels value. Must be between 1 and 10."
// Example: Invalid `channel_spacing`
//   _validate_args_mount(2, -5, "BOTTOM"); 
//   // throws error "Invalid channel_spacing value. Must be greater than 0."
// Example: Invalid `mounting_face`
//   _validate_args_mount(2, 20, "SIDE"); 
//   // throws error "Invalid mounting_face value. Allowed values: 'TOP', 'BOTTOM'."
function _validate_args_mount(num_channels, channel_spacing, mounting_face) =
    let (
        num_channels_error_message = num_channels < 1 || num_channels > 10 ? "Invalid num_channels value. Must be between 1 and 10. " : "",
        channel_spacing_error_message = channel_spacing <= 0 ? "Invalid channel_spacing value. Must be greater than 0. " : "",
        mounting_face_error_message = mounting_face != "TOP" && mounting_face != "BOTTOM" ? "Invalid mounting_face value. Allowed values: 'TOP', 'BOTTOM' " : ""
    )
    assert(
        num_channels_error_message == "" && 
            channel_spacing_error_message == "" && 
            mounting_face_error_message == "", 
        str(concat(num_channels_error_message,
            channel_spacing_error_message,
            mounting_face_error_message))
    );

// Function: _calculate_support_points()
// Status: INTERNAL
// Description: Calculates the points for the support geometry based on global variables
// Example(2D):
//   polygon(points_to_coords(_calculate_support_points()));
function _calculate_support_points() =
    [
        [
            0,
            0,
            2, // radius
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH,
            0,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH,
            -1 * BEST_FENCE_INTERIOR_HEIGHT,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH + BEST_FENCE_WALL_THICKNESS,
            -1 * BEST_FENCE_INTERIOR_HEIGHT,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH +
                BEST_FENCE_WALL_THICKNESS +
                TOE_CLAMP_BOTTOM_WIDTH +
                TOE_CLAMP_TOLERANCE_WIDTH +
                (
                    (BEST_FENCE_OVERALL_HEIGHT + MOUNT_VERTICAL_CLEARANCE) / tan(TOE_CLAMP_ANGLE)
                ),
            BEST_FENCE_OVERALL_HEIGHT - BEST_FENCE_INTERIOR_HEIGHT + MOUNT_VERTICAL_CLEARANCE,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH +
                BEST_FENCE_WALL_THICKNESS +
                TOE_CLAMP_BOTTOM_WIDTH +
                TOE_CLAMP_TOLERANCE_WIDTH + 
                (
                    (BEST_FENCE_OVERALL_HEIGHT + MOUNT_VERTICAL_CLEARANCE) / tan(TOE_CLAMP_ANGLE)
                ) +
                MOUNT_REAR_SUPPORT_WIDTH,
            BEST_FENCE_OVERALL_HEIGHT - BEST_FENCE_INTERIOR_HEIGHT + MOUNT_VERTICAL_CLEARANCE,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH +
                BEST_FENCE_WALL_THICKNESS +
                TOE_CLAMP_BOTTOM_WIDTH +
                TOE_CLAMP_TOLERANCE_WIDTH + 
                (
                    (BEST_FENCE_OVERALL_HEIGHT + MOUNT_VERTICAL_CLEARANCE) / tan(TOE_CLAMP_ANGLE)
                ) +
                MOUNT_REAR_SUPPORT_WIDTH,
            -1 * (BEST_FENCE_INDEXING_LIP_HEIGHT + MOUNT_HEIGHT),
        ],
        [
            BEST_FENCE_INDEXING_LIP_LENGTH,
            -1 * (BEST_FENCE_INDEXING_LIP_HEIGHT + MOUNT_HEIGHT),
        ],
        [
            BEST_FENCE_INDEXING_LIP_LENGTH,
            -1 * BEST_FENCE_INDEXING_LIP_HEIGHT,
        ],
        [
            0,
            -1 * BEST_FENCE_INDEXING_LIP_HEIGHT,
        ]
    ];

// Function: _calculate_channel_points()
// Status: INTERNAL
// Description: Calculates the points for the channel geometry based on global variables
// Example(2D):
//   polygon(points_to_coords(_calculate_channel_points()));
function _calculate_channel_points() =
    [
        [
            0,
            0,
            2, // radius
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH,
            0,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH,
            -1 * BEST_FENCE_INTERIOR_HEIGHT,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH +
                BEST_FENCE_WALL_THICKNESS +
                TOE_CLAMP_BOTTOM_WIDTH +
                TOE_CLAMP_TOLERANCE_WIDTH,
            -1 * BEST_FENCE_INTERIOR_HEIGHT,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH +
                BEST_FENCE_WALL_THICKNESS +
                TOE_CLAMP_BOTTOM_WIDTH +
                TOE_CLAMP_TOLERANCE_WIDTH +
                (
                    (BEST_FENCE_OVERALL_HEIGHT + MOUNT_VERTICAL_CLEARANCE) / tan(TOE_CLAMP_ANGLE)
                ),
            BEST_FENCE_OVERALL_HEIGHT - BEST_FENCE_INTERIOR_HEIGHT + MOUNT_VERTICAL_CLEARANCE,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH +
                BEST_FENCE_WALL_THICKNESS +
                TOE_CLAMP_BOTTOM_WIDTH +
                TOE_CLAMP_TOLERANCE_WIDTH +
                (
                    (BEST_FENCE_OVERALL_HEIGHT + MOUNT_VERTICAL_CLEARANCE) / tan(TOE_CLAMP_ANGLE)
                ) +
                MOUNT_REAR_SUPPORT_WIDTH,
            BEST_FENCE_OVERALL_HEIGHT - BEST_FENCE_INTERIOR_HEIGHT + MOUNT_VERTICAL_CLEARANCE,
        ],
        [
            BEST_FENCE_INTERIOR_WIDTH +
                BEST_FENCE_WALL_THICKNESS +
                TOE_CLAMP_BOTTOM_WIDTH +
                TOE_CLAMP_TOLERANCE_WIDTH +
                (
                    (BEST_FENCE_OVERALL_HEIGHT + MOUNT_VERTICAL_CLEARANCE) / tan(TOE_CLAMP_ANGLE)
                ) +
                MOUNT_REAR_SUPPORT_WIDTH,
            -1 * (BEST_FENCE_INDEXING_LIP_HEIGHT + MOUNT_HEIGHT),
        ],
        [
            BEST_FENCE_INDEXING_LIP_LENGTH,
            -1 * (BEST_FENCE_INDEXING_LIP_HEIGHT + MOUNT_HEIGHT),
        ],
        [
            BEST_FENCE_INDEXING_LIP_LENGTH,
            -1 * BEST_FENCE_INDEXING_LIP_HEIGHT,
        ],
        [
            0,
            -1 * BEST_FENCE_INDEXING_LIP_HEIGHT,
        ]
    ];

// Export Mode
// we don't export this on it's own. Rather, use previews/* to export
// the different versions of this model