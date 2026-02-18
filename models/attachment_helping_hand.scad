// File: attachment_helping_hand.scad
// A model of the top of the "Helping Hand" attachment for the Best Fence,
// which holds the mount from the bottom
// Includes:
//   include <models/attachment_helping_hand.scad>;

include <../config.scad>;

// Module: attachment_helping_hand
// Description: A cylindar the same size as the head of the "Helping Hand"
//   should be used as the first child of the {{mount}} module, with `mounting_face` set to "BOTTOM"
//   derives its dimensions from the variables in config.scad
// Example(3D):
//   attachment_helping_hand();
module attachment_helping_hand() {
    cylinder(
        h = HELPING_HAND_HEAD_HEIGHT, 
        r = HELPING_HAND_HEAD_RADIUS, 
        center = false,
    );
}