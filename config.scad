// ============================================================
// PROJECT CONFIGURATION
// Description: Global settings for best_fence
// ============================================================

// ============================================================
// RENDERING SETTINGS
// ============================================================

// Preview quality (lower = faster preview)
PREVIEW_FN = 32;

// Export quality (higher = smoother STL)
EXPORT_FN = 128;

// Current mode (set to true when exporting STL)
// Override from command line: openscad -D 'EXPORT_MODE=true' ...
EXPORT_MODE = false;

// Convenience variable - automatically use correct quality
$fn = EXPORT_MODE ? EXPORT_FN : PREVIEW_FN;

// ============================================================
// PROJECT DIMENSIONS (mm and degrees)
// ============================================================

// best fence dimensions
// TODO: create a model of the best fence for reference
BEST_FENCE_INTERIOR_WIDTH = 152.5;
BEST_FENCE_INTERIOR_HEIGHT = 15;
BEST_FENCE_OVERALL_HEIGHT = 25;
BEST_FENCE_WALL_THICKNESS = 5.5;
BEST_FENCE_INDEXING_LIP_LENGTH = 5;
BEST_FENCE_INDEXING_LIP_HEIGHT = 8.5;

// mount dimensions
MOUNT_HEIGHT = 32;
// MOUNT_VERTICAL_CLEARANCE is the vertical clearance between the highest point of 
// the mount and the top of the Best Fence. 
// Negative values means it will be below the top of the Best Fence.
MOUNT_VERTICAL_CLEARANCE = -2; 
MOUNT_REAR_SUPPORT_WIDTH = 10;

// toe clamp dimensions
TOE_CLAMP_LENGTH = 28;
TOE_CLAMP_BOTTOM_WIDTH = 17.5;
TOE_CLAMP_ANGLE = 70; 
TOE_CLAMP_HEIGHT = 16;
TOE_CLAMP_INSERT_WIDTH = TOE_CLAMP_BOTTOM_WIDTH - 2; // should be slightly smaller than the bottom width of the clamp body to fit snugly
TOE_CLAMP_INSERT_LENGTH = TOE_CLAMP_LENGTH - 2; // should be slightly smaller than the length of the clamp body to fit snugly
TOE_CLAMP_INSERT_HEIGHT = 10;

// bolt dimensions
BOLT_HEAD_RADIUS = 6.5;
BOLT_HEAD_HEIGHT = 5;
BOLT_SHANK_RADIUS = 3.5;
BOLT_SHANK_HEIGHT = 16;

// screw mount dimensions
SCREW_MOUNT_WIDTH = 32;
SCREW_MOUNT_LENGTH = 32;

// screw dimensions
SCREW_HEAD_RADIUS = 5;
SCREW_SHANK_RADIUS = 3;
SCREW_HEAD_ANGLE = 30; 
SCREW_HEIGHT = 50;

// helping hand dimensions
HELPING_HAND_HEAD_HEIGHT = 20;
HELPING_HAND_HEAD_RADIUS = 15.5;

// ============================================================
// TOLERANCES (mm and degrees)
// ============================================================

TOE_CLAMP_TOLERANCE_LENGTH = 1;
TOE_CLAMP_TOLERANCE_WIDTH = -3;

EPSILON = 1e-3;

// ============================================================
// RENDERING HELPERS
// ============================================================

// Helper function to determine if we're in preview mode
function is_preview() = !EXPORT_MODE;

// Helper function to determine if we're in export mode
function is_export() = EXPORT_MODE;
