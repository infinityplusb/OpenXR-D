module openxr_d;

import std.string;
import std.conv;

extern (C):

enum OPENXR_H_ = 1;

/*
** Copyright (c) 2017-2022, The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0 OR MIT
*/

/*
** This header is generated from the Khronos OpenXR XML API Registry.
**
*/

enum XR_VERSION_1_0 = 1;

extern (D) auto XR_MAKE_VERSION(T0, T1, T2)(auto ref T0 major, auto ref T1 minor, auto ref T2 patch)
{
//    return ((major & 0xffffULL) << 48) | ((minor & 0xffffULL) << 32) | (patch & 0xffffffffULL);
// Appending LL will insure the constant is at least 64-bit.
    return rightJustify(to!string(major),2,'0') 
         ~ rightJustify(to!string(minor),2,'0') 
         ~ rightJustify(to!string(patch),4,'0');
}

// OpenXR current version number.
enum XR_CURRENT_API_VERSION = XR_MAKE_VERSION(1, 0, 22);

extern (D) auto XR_VERSION_MAJOR(T)(ref string _version)
{
    return cast(ushort)_version[0 .. 2];
}

extern (D) auto XR_VERSION_MINOR(T)(ref string _version)
{
    return cast(ushort)_version[2 .. 4];
}

extern (D) auto XR_VERSION_PATCH(T)(ref string _version)
{
    return cast(uint)(_version[4 .. $]);
}

enum XR_NULL_HANDLE = 0;

enum XR_NULL_SYSTEM_ID = 0;

enum XR_NULL_PATH = 0;

extern (D) auto XR_SUCCEEDED(T)(auto ref T result)
{
    return result >= 0;
}

extern (D) auto XR_FAILED(T)(auto ref T result)
{
    return result < 0;
}

extern (D) auto XR_UNQUALIFIED_SUCCESS(T)(auto ref T result)
{
    return result == 0;
}

enum XR_NO_DURATION = 0;

enum XR_INFINITE_DURATION = 1_000_000_000_000_000;
// enum XR_INFINITE_DURATION = 0x7fffffffffffffffLL;

enum XR_MIN_HAPTIC_DURATION = -1;

enum XR_FREQUENCY_UNSPECIFIED = 0;

enum XR_MAX_EVENT_DATA_SIZE = XrEventDataBuffer.sizeof;

alias XrVersion = ulong;
alias XrFlags64 = ulong;
alias XrSystemId = ulong;
alias XrBool32 = uint;
alias XrPath = ulong;
alias XrTime = long;
alias XrDuration = long;
struct XrInstance_T;
alias XrInstance = XrInstance_T*;
struct XrSession_T;
alias XrSession = XrSession_T*;
struct XrSpace_T;
alias XrSpace = XrSpace_T*;
struct XrAction_T;
alias XrAction = XrAction_T*;
struct XrSwapchain_T;
alias XrSwapchain = XrSwapchain_T*;
struct XrActionSet_T;
alias XrActionSet = XrActionSet_T*;
enum XR_TRUE = 1;
enum XR_FALSE = 0;
enum XR_MAX_EXTENSION_NAME_SIZE = 128;
enum XR_MAX_API_LAYER_NAME_SIZE = 256;
enum XR_MAX_API_LAYER_DESCRIPTION_SIZE = 256;
enum XR_MAX_SYSTEM_NAME_SIZE = 256;
enum XR_MAX_APPLICATION_NAME_SIZE = 128;
enum XR_MAX_ENGINE_NAME_SIZE = 128;
enum XR_MAX_RUNTIME_NAME_SIZE = 128;
enum XR_MAX_PATH_LENGTH = 256;
enum XR_MAX_STRUCTURE_NAME_SIZE = 64;
enum XR_MAX_RESULT_STRING_SIZE = 64;
enum XR_MIN_COMPOSITION_LAYERS_SUPPORTED = 16;
enum XR_MAX_ACTION_SET_NAME_SIZE = 64;
enum XR_MAX_LOCALIZED_ACTION_SET_NAME_SIZE = 128;
enum XR_MAX_ACTION_NAME_SIZE = 64;
enum XR_MAX_LOCALIZED_ACTION_NAME_SIZE = 128;

enum XrResult
{
    XR_SUCCESS = 0,
    XR_TIMEOUT_EXPIRED = 1,
    XR_SESSION_LOSS_PENDING = 3,
    XR_EVENT_UNAVAILABLE = 4,
    XR_SPACE_BOUNDS_UNAVAILABLE = 7,
    XR_SESSION_NOT_FOCUSED = 8,
    XR_FRAME_DISCARDED = 9,
    XR_ERROR_VALIDATION_FAILURE = -1,
    XR_ERROR_RUNTIME_FAILURE = -2,
    XR_ERROR_OUT_OF_MEMORY = -3,
    XR_ERROR_API_VERSION_UNSUPPORTED = -4,
    XR_ERROR_INITIALIZATION_FAILED = -6,
    XR_ERROR_FUNCTION_UNSUPPORTED = -7,
    XR_ERROR_FEATURE_UNSUPPORTED = -8,
    XR_ERROR_EXTENSION_NOT_PRESENT = -9,
    XR_ERROR_LIMIT_REACHED = -10,
    XR_ERROR_SIZE_INSUFFICIENT = -11,
    XR_ERROR_HANDLE_INVALID = -12,
    XR_ERROR_INSTANCE_LOST = -13,
    XR_ERROR_SESSION_RUNNING = -14,
    XR_ERROR_SESSION_NOT_RUNNING = -16,
    XR_ERROR_SESSION_LOST = -17,
    XR_ERROR_SYSTEM_INVALID = -18,
    XR_ERROR_PATH_INVALID = -19,
    XR_ERROR_PATH_COUNT_EXCEEDED = -20,
    XR_ERROR_PATH_FORMAT_INVALID = -21,
    XR_ERROR_PATH_UNSUPPORTED = -22,
    XR_ERROR_LAYER_INVALID = -23,
    XR_ERROR_LAYER_LIMIT_EXCEEDED = -24,
    XR_ERROR_SWAPCHAIN_RECT_INVALID = -25,
    XR_ERROR_SWAPCHAIN_FORMAT_UNSUPPORTED = -26,
    XR_ERROR_ACTION_TYPE_MISMATCH = -27,
    XR_ERROR_SESSION_NOT_READY = -28,
    XR_ERROR_SESSION_NOT_STOPPING = -29,
    XR_ERROR_TIME_INVALID = -30,
    XR_ERROR_REFERENCE_SPACE_UNSUPPORTED = -31,
    XR_ERROR_FILE_ACCESS_ERROR = -32,
    XR_ERROR_FILE_CONTENTS_INVALID = -33,
    XR_ERROR_FORM_FACTOR_UNSUPPORTED = -34,
    XR_ERROR_FORM_FACTOR_UNAVAILABLE = -35,
    XR_ERROR_API_LAYER_NOT_PRESENT = -36,
    XR_ERROR_CALL_ORDER_INVALID = -37,
    XR_ERROR_GRAPHICS_DEVICE_INVALID = -38,
    XR_ERROR_POSE_INVALID = -39,
    XR_ERROR_INDEX_OUT_OF_RANGE = -40,
    XR_ERROR_VIEW_CONFIGURATION_TYPE_UNSUPPORTED = -41,
    XR_ERROR_ENVIRONMENT_BLEND_MODE_UNSUPPORTED = -42,
    XR_ERROR_NAME_DUPLICATED = -44,
    XR_ERROR_NAME_INVALID = -45,
    XR_ERROR_ACTIONSET_NOT_ATTACHED = -46,
    XR_ERROR_ACTIONSETS_ALREADY_ATTACHED = -47,
    XR_ERROR_LOCALIZED_NAME_DUPLICATED = -48,
    XR_ERROR_LOCALIZED_NAME_INVALID = -49,
    XR_ERROR_GRAPHICS_REQUIREMENTS_CALL_MISSING = -50,
    XR_ERROR_RUNTIME_UNAVAILABLE = -51,
    XR_ERROR_ANDROID_THREAD_SETTINGS_ID_INVALID_KHR = -1000003000,
    XR_ERROR_ANDROID_THREAD_SETTINGS_FAILURE_KHR = -1000003001,
    XR_ERROR_CREATE_SPATIAL_ANCHOR_FAILED_MSFT = -1000039001,
    XR_ERROR_SECONDARY_VIEW_CONFIGURATION_TYPE_NOT_ENABLED_MSFT = -1000053000,
    XR_ERROR_CONTROLLER_MODEL_KEY_INVALID_MSFT = -1000055000,
    XR_ERROR_REPROJECTION_MODE_UNSUPPORTED_MSFT = -1000066000,
    XR_ERROR_COMPUTE_NEW_SCENE_NOT_COMPLETED_MSFT = -1000097000,
    XR_ERROR_SCENE_COMPONENT_ID_INVALID_MSFT = -1000097001,
    XR_ERROR_SCENE_COMPONENT_TYPE_MISMATCH_MSFT = -1000097002,
    XR_ERROR_SCENE_MESH_BUFFER_ID_INVALID_MSFT = -1000097003,
    XR_ERROR_SCENE_COMPUTE_FEATURE_INCOMPATIBLE_MSFT = -1000097004,
    XR_ERROR_SCENE_COMPUTE_CONSISTENCY_MISMATCH_MSFT = -1000097005,
    XR_ERROR_DISPLAY_REFRESH_RATE_UNSUPPORTED_FB = -1000101000,
    XR_ERROR_COLOR_SPACE_UNSUPPORTED_FB = -1000108000,
    XR_ERROR_UNEXPECTED_STATE_PASSTHROUGH_FB = -1000118000,
    XR_ERROR_FEATURE_ALREADY_CREATED_PASSTHROUGH_FB = -1000118001,
    XR_ERROR_FEATURE_REQUIRED_PASSTHROUGH_FB = -1000118002,
    XR_ERROR_NOT_PERMITTED_PASSTHROUGH_FB = -1000118003,
    XR_ERROR_INSUFFICIENT_RESOURCES_PASSTHROUGH_FB = -1000118004,
    XR_ERROR_UNKNOWN_PASSTHROUGH_FB = -1000118050,
    XR_ERROR_RENDER_MODEL_KEY_INVALID_FB = -1000119000,
    XR_RENDER_MODEL_UNAVAILABLE_FB = 1000119020,
    XR_ERROR_MARKER_NOT_TRACKED_VARJO = -1000124000,
    XR_ERROR_MARKER_ID_INVALID_VARJO = -1000124001,
    XR_ERROR_SPATIAL_ANCHOR_NAME_NOT_FOUND_MSFT = -1000142001,
    XR_ERROR_SPATIAL_ANCHOR_NAME_INVALID_MSFT = -1000142002,
    XR_RESULT_MAX_ENUM = 0x7FFFFFFF
}

enum XrStructureType
{
    XR_TYPE_UNKNOWN = 0,
    XR_TYPE_API_LAYER_PROPERTIES = 1,
    XR_TYPE_EXTENSION_PROPERTIES = 2,
    XR_TYPE_INSTANCE_CREATE_INFO = 3,
    XR_TYPE_SYSTEM_GET_INFO = 4,
    XR_TYPE_SYSTEM_PROPERTIES = 5,
    XR_TYPE_VIEW_LOCATE_INFO = 6,
    XR_TYPE_VIEW = 7,
    XR_TYPE_SESSION_CREATE_INFO = 8,
    XR_TYPE_SWAPCHAIN_CREATE_INFO = 9,
    XR_TYPE_SESSION_BEGIN_INFO = 10,
    XR_TYPE_VIEW_STATE = 11,
    XR_TYPE_FRAME_END_INFO = 12,
    XR_TYPE_HAPTIC_VIBRATION = 13,
    XR_TYPE_EVENT_DATA_BUFFER = 16,
    XR_TYPE_EVENT_DATA_INSTANCE_LOSS_PENDING = 17,
    XR_TYPE_EVENT_DATA_SESSION_STATE_CHANGED = 18,
    XR_TYPE_ACTION_STATE_BOOLEAN = 23,
    XR_TYPE_ACTION_STATE_FLOAT = 24,
    XR_TYPE_ACTION_STATE_VECTOR2F = 25,
    XR_TYPE_ACTION_STATE_POSE = 27,
    XR_TYPE_ACTION_SET_CREATE_INFO = 28,
    XR_TYPE_ACTION_CREATE_INFO = 29,
    XR_TYPE_INSTANCE_PROPERTIES = 32,
    XR_TYPE_FRAME_WAIT_INFO = 33,
    XR_TYPE_COMPOSITION_LAYER_PROJECTION = 35,
    XR_TYPE_COMPOSITION_LAYER_QUAD = 36,
    XR_TYPE_REFERENCE_SPACE_CREATE_INFO = 37,
    XR_TYPE_ACTION_SPACE_CREATE_INFO = 38,
    XR_TYPE_EVENT_DATA_REFERENCE_SPACE_CHANGE_PENDING = 40,
    XR_TYPE_VIEW_CONFIGURATION_VIEW = 41,
    XR_TYPE_SPACE_LOCATION = 42,
    XR_TYPE_SPACE_VELOCITY = 43,
    XR_TYPE_FRAME_STATE = 44,
    XR_TYPE_VIEW_CONFIGURATION_PROPERTIES = 45,
    XR_TYPE_FRAME_BEGIN_INFO = 46,
    XR_TYPE_COMPOSITION_LAYER_PROJECTION_VIEW = 48,
    XR_TYPE_EVENT_DATA_EVENTS_LOST = 49,
    XR_TYPE_INTERACTION_PROFILE_SUGGESTED_BINDING = 51,
    XR_TYPE_EVENT_DATA_INTERACTION_PROFILE_CHANGED = 52,
    XR_TYPE_INTERACTION_PROFILE_STATE = 53,
    XR_TYPE_SWAPCHAIN_IMAGE_ACQUIRE_INFO = 55,
    XR_TYPE_SWAPCHAIN_IMAGE_WAIT_INFO = 56,
    XR_TYPE_SWAPCHAIN_IMAGE_RELEASE_INFO = 57,
    XR_TYPE_ACTION_STATE_GET_INFO = 58,
    XR_TYPE_HAPTIC_ACTION_INFO = 59,
    XR_TYPE_SESSION_ACTION_SETS_ATTACH_INFO = 60,
    XR_TYPE_ACTIONS_SYNC_INFO = 61,
    XR_TYPE_BOUND_SOURCES_FOR_ACTION_ENUMERATE_INFO = 62,
    XR_TYPE_INPUT_SOURCE_LOCALIZED_NAME_GET_INFO = 63,
    XR_TYPE_COMPOSITION_LAYER_CUBE_KHR = 1000006000,
    XR_TYPE_INSTANCE_CREATE_INFO_ANDROID_KHR = 1000008000,
    XR_TYPE_COMPOSITION_LAYER_DEPTH_INFO_KHR = 1000010000,
    XR_TYPE_VULKAN_SWAPCHAIN_FORMAT_LIST_CREATE_INFO_KHR = 1000014000,
    XR_TYPE_EVENT_DATA_PERF_SETTINGS_EXT = 1000015000,
    XR_TYPE_COMPOSITION_LAYER_CYLINDER_KHR = 1000017000,
    XR_TYPE_COMPOSITION_LAYER_EQUIRECT_KHR = 1000018000,
    XR_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT = 1000019000,
    XR_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT = 1000019001,
    XR_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT = 1000019002,
    XR_TYPE_DEBUG_UTILS_LABEL_EXT = 1000019003,
    XR_TYPE_GRAPHICS_BINDING_OPENGL_WIN32_KHR = 1000023000,
    XR_TYPE_GRAPHICS_BINDING_OPENGL_XLIB_KHR = 1000023001,
    XR_TYPE_GRAPHICS_BINDING_OPENGL_XCB_KHR = 1000023002,
    XR_TYPE_GRAPHICS_BINDING_OPENGL_WAYLAND_KHR = 1000023003,
    XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_KHR = 1000023004,
    XR_TYPE_GRAPHICS_REQUIREMENTS_OPENGL_KHR = 1000023005,
    XR_TYPE_GRAPHICS_BINDING_OPENGL_ES_ANDROID_KHR = 1000024001,
    XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_ES_KHR = 1000024002,
    XR_TYPE_GRAPHICS_REQUIREMENTS_OPENGL_ES_KHR = 1000024003,
    XR_TYPE_GRAPHICS_BINDING_VULKAN_KHR = 1000025000,
    XR_TYPE_SWAPCHAIN_IMAGE_VULKAN_KHR = 1000025001,
    XR_TYPE_GRAPHICS_REQUIREMENTS_VULKAN_KHR = 1000025002,
    XR_TYPE_GRAPHICS_BINDING_D3D11_KHR = 1000027000,
    XR_TYPE_SWAPCHAIN_IMAGE_D3D11_KHR = 1000027001,
    XR_TYPE_GRAPHICS_REQUIREMENTS_D3D11_KHR = 1000027002,
    XR_TYPE_GRAPHICS_BINDING_D3D12_KHR = 1000028000,
    XR_TYPE_SWAPCHAIN_IMAGE_D3D12_KHR = 1000028001,
    XR_TYPE_GRAPHICS_REQUIREMENTS_D3D12_KHR = 1000028002,
    XR_TYPE_SYSTEM_EYE_GAZE_INTERACTION_PROPERTIES_EXT = 1000030000,
    XR_TYPE_EYE_GAZE_SAMPLE_TIME_EXT = 1000030001,
    XR_TYPE_VISIBILITY_MASK_KHR = 1000031000,
    XR_TYPE_EVENT_DATA_VISIBILITY_MASK_CHANGED_KHR = 1000031001,
    XR_TYPE_SESSION_CREATE_INFO_OVERLAY_EXTX = 1000033000,
    XR_TYPE_EVENT_DATA_MAIN_SESSION_VISIBILITY_CHANGED_EXTX = 1000033003,
    XR_TYPE_COMPOSITION_LAYER_COLOR_SCALE_BIAS_KHR = 1000034000,
    XR_TYPE_SPATIAL_ANCHOR_CREATE_INFO_MSFT = 1000039000,
    XR_TYPE_SPATIAL_ANCHOR_SPACE_CREATE_INFO_MSFT = 1000039001,
    XR_TYPE_COMPOSITION_LAYER_IMAGE_LAYOUT_FB = 1000040000,
    XR_TYPE_COMPOSITION_LAYER_ALPHA_BLEND_FB = 1000041001,
    XR_TYPE_VIEW_CONFIGURATION_DEPTH_RANGE_EXT = 1000046000,
    XR_TYPE_GRAPHICS_BINDING_EGL_MNDX = 1000048004,
    XR_TYPE_SPATIAL_GRAPH_NODE_SPACE_CREATE_INFO_MSFT = 1000049000,
    XR_TYPE_SYSTEM_HAND_TRACKING_PROPERTIES_EXT = 1000051000,
    XR_TYPE_HAND_TRACKER_CREATE_INFO_EXT = 1000051001,
    XR_TYPE_HAND_JOINTS_LOCATE_INFO_EXT = 1000051002,
    XR_TYPE_HAND_JOINT_LOCATIONS_EXT = 1000051003,
    XR_TYPE_HAND_JOINT_VELOCITIES_EXT = 1000051004,
    XR_TYPE_SYSTEM_HAND_TRACKING_MESH_PROPERTIES_MSFT = 1000052000,
    XR_TYPE_HAND_MESH_SPACE_CREATE_INFO_MSFT = 1000052001,
    XR_TYPE_HAND_MESH_UPDATE_INFO_MSFT = 1000052002,
    XR_TYPE_HAND_MESH_MSFT = 1000052003,
    XR_TYPE_HAND_POSE_TYPE_INFO_MSFT = 1000052004,
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_SESSION_BEGIN_INFO_MSFT = 1000053000,
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_STATE_MSFT = 1000053001,
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_FRAME_STATE_MSFT = 1000053002,
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_FRAME_END_INFO_MSFT = 1000053003,
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_LAYER_INFO_MSFT = 1000053004,
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_SWAPCHAIN_CREATE_INFO_MSFT = 1000053005,
    XR_TYPE_CONTROLLER_MODEL_KEY_STATE_MSFT = 1000055000,
    XR_TYPE_CONTROLLER_MODEL_NODE_PROPERTIES_MSFT = 1000055001,
    XR_TYPE_CONTROLLER_MODEL_PROPERTIES_MSFT = 1000055002,
    XR_TYPE_CONTROLLER_MODEL_NODE_STATE_MSFT = 1000055003,
    XR_TYPE_CONTROLLER_MODEL_STATE_MSFT = 1000055004,
    XR_TYPE_VIEW_CONFIGURATION_VIEW_FOV_EPIC = 1000059000,
    XR_TYPE_HOLOGRAPHIC_WINDOW_ATTACHMENT_MSFT = 1000063000,
    XR_TYPE_COMPOSITION_LAYER_REPROJECTION_INFO_MSFT = 1000066000,
    XR_TYPE_COMPOSITION_LAYER_REPROJECTION_PLANE_OVERRIDE_MSFT = 1000066001,
    XR_TYPE_ANDROID_SURFACE_SWAPCHAIN_CREATE_INFO_FB = 1000070000,
    XR_TYPE_COMPOSITION_LAYER_SECURE_CONTENT_FB = 1000072000,
    XR_TYPE_INTERACTION_PROFILE_ANALOG_THRESHOLD_VALVE = 1000079000,
    XR_TYPE_HAND_JOINTS_MOTION_RANGE_INFO_EXT = 1000080000,
    XR_TYPE_LOADER_INIT_INFO_ANDROID_KHR = 1000089000,
    XR_TYPE_VULKAN_INSTANCE_CREATE_INFO_KHR = 1000090000,
    XR_TYPE_VULKAN_DEVICE_CREATE_INFO_KHR = 1000090001,
    XR_TYPE_VULKAN_GRAPHICS_DEVICE_GET_INFO_KHR = 1000090003,
    XR_TYPE_COMPOSITION_LAYER_EQUIRECT2_KHR = 1000091000,
    XR_TYPE_SCENE_OBSERVER_CREATE_INFO_MSFT = 1000097000,
    XR_TYPE_SCENE_CREATE_INFO_MSFT = 1000097001,
    XR_TYPE_NEW_SCENE_COMPUTE_INFO_MSFT = 1000097002,
    XR_TYPE_VISUAL_MESH_COMPUTE_LOD_INFO_MSFT = 1000097003,
    XR_TYPE_SCENE_COMPONENTS_MSFT = 1000097004,
    XR_TYPE_SCENE_COMPONENTS_GET_INFO_MSFT = 1000097005,
    XR_TYPE_SCENE_COMPONENT_LOCATIONS_MSFT = 1000097006,
    XR_TYPE_SCENE_COMPONENTS_LOCATE_INFO_MSFT = 1000097007,
    XR_TYPE_SCENE_OBJECTS_MSFT = 1000097008,
    XR_TYPE_SCENE_COMPONENT_PARENT_FILTER_INFO_MSFT = 1000097009,
    XR_TYPE_SCENE_OBJECT_TYPES_FILTER_INFO_MSFT = 1000097010,
    XR_TYPE_SCENE_PLANES_MSFT = 1000097011,
    XR_TYPE_SCENE_PLANE_ALIGNMENT_FILTER_INFO_MSFT = 1000097012,
    XR_TYPE_SCENE_MESHES_MSFT = 1000097013,
    XR_TYPE_SCENE_MESH_BUFFERS_GET_INFO_MSFT = 1000097014,
    XR_TYPE_SCENE_MESH_BUFFERS_MSFT = 1000097015,
    XR_TYPE_SCENE_MESH_VERTEX_BUFFER_MSFT = 1000097016,
    XR_TYPE_SCENE_MESH_INDICES_UINT32_MSFT = 1000097017,
    XR_TYPE_SCENE_MESH_INDICES_UINT16_MSFT = 1000097018,
    XR_TYPE_SERIALIZED_SCENE_FRAGMENT_DATA_GET_INFO_MSFT = 1000098000,
    XR_TYPE_SCENE_DESERIALIZE_INFO_MSFT = 1000098001,
    XR_TYPE_EVENT_DATA_DISPLAY_REFRESH_RATE_CHANGED_FB = 1000101000,
    XR_TYPE_VIVE_TRACKER_PATHS_HTCX = 1000103000,
    XR_TYPE_EVENT_DATA_VIVE_TRACKER_CONNECTED_HTCX = 1000103001,
    XR_TYPE_SYSTEM_FACIAL_TRACKING_PROPERTIES_HTC = 1000104000,
    XR_TYPE_FACIAL_TRACKER_CREATE_INFO_HTC = 1000104001,
    XR_TYPE_FACIAL_EXPRESSIONS_HTC = 1000104002,
    XR_TYPE_SYSTEM_COLOR_SPACE_PROPERTIES_FB = 1000108000,
    XR_TYPE_HAND_TRACKING_MESH_FB = 1000110001,
    XR_TYPE_HAND_TRACKING_SCALE_FB = 1000110003,
    XR_TYPE_HAND_TRACKING_AIM_STATE_FB = 1000111001,
    XR_TYPE_HAND_TRACKING_CAPSULES_STATE_FB = 1000112000,
    XR_TYPE_FOVEATION_PROFILE_CREATE_INFO_FB = 1000114000,
    XR_TYPE_SWAPCHAIN_CREATE_INFO_FOVEATION_FB = 1000114001,
    XR_TYPE_SWAPCHAIN_STATE_FOVEATION_FB = 1000114002,
    XR_TYPE_FOVEATION_LEVEL_PROFILE_CREATE_INFO_FB = 1000115000,
    XR_TYPE_KEYBOARD_SPACE_CREATE_INFO_FB = 1000116009,
    XR_TYPE_KEYBOARD_TRACKING_QUERY_FB = 1000116004,
    XR_TYPE_SYSTEM_KEYBOARD_TRACKING_PROPERTIES_FB = 1000116002,
    XR_TYPE_TRIANGLE_MESH_CREATE_INFO_FB = 1000117001,
    XR_TYPE_SYSTEM_PASSTHROUGH_PROPERTIES_FB = 1000118000,
    XR_TYPE_PASSTHROUGH_CREATE_INFO_FB = 1000118001,
    XR_TYPE_PASSTHROUGH_LAYER_CREATE_INFO_FB = 1000118002,
    XR_TYPE_COMPOSITION_LAYER_PASSTHROUGH_FB = 1000118003,
    XR_TYPE_GEOMETRY_INSTANCE_CREATE_INFO_FB = 1000118004,
    XR_TYPE_GEOMETRY_INSTANCE_TRANSFORM_FB = 1000118005,
    XR_TYPE_PASSTHROUGH_STYLE_FB = 1000118020,
    XR_TYPE_PASSTHROUGH_COLOR_MAP_MONO_TO_RGBA_FB = 1000118021,
    XR_TYPE_PASSTHROUGH_COLOR_MAP_MONO_TO_MONO_FB = 1000118022,
    XR_TYPE_EVENT_DATA_PASSTHROUGH_STATE_CHANGED_FB = 1000118030,
    XR_TYPE_RENDER_MODEL_PATH_INFO_FB = 1000119000,
    XR_TYPE_RENDER_MODEL_PROPERTIES_FB = 1000119001,
    XR_TYPE_RENDER_MODEL_BUFFER_FB = 1000119002,
    XR_TYPE_RENDER_MODEL_LOAD_INFO_FB = 1000119003,
    XR_TYPE_SYSTEM_RENDER_MODEL_PROPERTIES_FB = 1000119004,
    XR_TYPE_BINDING_MODIFICATIONS_KHR = 1000120000,
    XR_TYPE_VIEW_LOCATE_FOVEATED_RENDERING_VARJO = 1000121000,
    XR_TYPE_FOVEATED_VIEW_CONFIGURATION_VIEW_VARJO = 1000121001,
    XR_TYPE_SYSTEM_FOVEATED_RENDERING_PROPERTIES_VARJO = 1000121002,
    XR_TYPE_COMPOSITION_LAYER_DEPTH_TEST_VARJO = 1000122000,
    XR_TYPE_SYSTEM_MARKER_TRACKING_PROPERTIES_VARJO = 1000124000,
    XR_TYPE_EVENT_DATA_MARKER_TRACKING_UPDATE_VARJO = 1000124001,
    XR_TYPE_MARKER_SPACE_CREATE_INFO_VARJO = 1000124002,
    XR_TYPE_SPATIAL_ANCHOR_PERSISTENCE_INFO_MSFT = 1000142000,
    XR_TYPE_SPATIAL_ANCHOR_FROM_PERSISTED_ANCHOR_CREATE_INFO_MSFT = 1000142001,
    XR_TYPE_SWAPCHAIN_IMAGE_FOVEATION_VULKAN_FB = 1000160000,
    XR_TYPE_SWAPCHAIN_STATE_ANDROID_SURFACE_DIMENSIONS_FB = 1000161000,
    XR_TYPE_SWAPCHAIN_STATE_SAMPLER_OPENGL_ES_FB = 1000162000,
    XR_TYPE_SWAPCHAIN_STATE_SAMPLER_VULKAN_FB = 1000163000,
    XR_TYPE_COMPOSITION_LAYER_SPACE_WARP_INFO_FB = 1000171000,
    XR_TYPE_SYSTEM_SPACE_WARP_PROPERTIES_FB = 1000171001,
    XR_TYPE_DIGITAL_LENS_CONTROL_ALMALENCE = 1000196000,
    XR_TYPE_PASSTHROUGH_KEYBOARD_HANDS_INTENSITY_FB = 1000203002,
    XR_TYPE_GRAPHICS_BINDING_VULKAN2_KHR = XR_TYPE_GRAPHICS_BINDING_VULKAN_KHR,
    XR_TYPE_SWAPCHAIN_IMAGE_VULKAN2_KHR = XR_TYPE_SWAPCHAIN_IMAGE_VULKAN_KHR,
    XR_TYPE_GRAPHICS_REQUIREMENTS_VULKAN2_KHR = XR_TYPE_GRAPHICS_REQUIREMENTS_VULKAN_KHR,
    XR_STRUCTURE_TYPE_MAX_ENUM = 0x7FFFFFFF
}

enum XrFormFactor
{
    XR_FORM_FACTOR_HEAD_MOUNTED_DISPLAY = 1,
    XR_FORM_FACTOR_HANDHELD_DISPLAY = 2,
    XR_FORM_FACTOR_MAX_ENUM = 0x7FFFFFFF
}

enum XrViewConfigurationType
{
    XR_VIEW_CONFIGURATION_TYPE_PRIMARY_MONO = 1,
    XR_VIEW_CONFIGURATION_TYPE_PRIMARY_STEREO = 2,
    XR_VIEW_CONFIGURATION_TYPE_PRIMARY_QUAD_VARJO = 1000037000,
    XR_VIEW_CONFIGURATION_TYPE_SECONDARY_MONO_FIRST_PERSON_OBSERVER_MSFT = 1000054000,
    XR_VIEW_CONFIGURATION_TYPE_MAX_ENUM = 0x7FFFFFFF
}

enum XrEnvironmentBlendMode
{
    XR_ENVIRONMENT_BLEND_MODE_OPAQUE = 1,
    XR_ENVIRONMENT_BLEND_MODE_ADDITIVE = 2,
    XR_ENVIRONMENT_BLEND_MODE_ALPHA_BLEND = 3,
    XR_ENVIRONMENT_BLEND_MODE_MAX_ENUM = 0x7FFFFFFF
}

enum XrReferenceSpaceType
{
    XR_REFERENCE_SPACE_TYPE_VIEW = 1,
    XR_REFERENCE_SPACE_TYPE_LOCAL = 2,
    XR_REFERENCE_SPACE_TYPE_STAGE = 3,
    XR_REFERENCE_SPACE_TYPE_UNBOUNDED_MSFT = 1000038000,
    XR_REFERENCE_SPACE_TYPE_COMBINED_EYE_VARJO = 1000121000,
    XR_REFERENCE_SPACE_TYPE_MAX_ENUM = 0x7FFFFFFF
}

enum XrActionType
{
    XR_ACTION_TYPE_BOOLEAN_INPUT = 1,
    XR_ACTION_TYPE_FLOAT_INPUT = 2,
    XR_ACTION_TYPE_VECTOR2F_INPUT = 3,
    XR_ACTION_TYPE_POSE_INPUT = 4,
    XR_ACTION_TYPE_VIBRATION_OUTPUT = 100,
    XR_ACTION_TYPE_MAX_ENUM = 0x7FFFFFFF
}

enum XrEyeVisibility
{
    XR_EYE_VISIBILITY_BOTH = 0,
    XR_EYE_VISIBILITY_LEFT = 1,
    XR_EYE_VISIBILITY_RIGHT = 2,
    XR_EYE_VISIBILITY_MAX_ENUM = 0x7FFFFFFF
}

enum XrSessionState
{
    XR_SESSION_STATE_UNKNOWN = 0,
    XR_SESSION_STATE_IDLE = 1,
    XR_SESSION_STATE_READY = 2,
    XR_SESSION_STATE_SYNCHRONIZED = 3,
    XR_SESSION_STATE_VISIBLE = 4,
    XR_SESSION_STATE_FOCUSED = 5,
    XR_SESSION_STATE_STOPPING = 6,
    XR_SESSION_STATE_LOSS_PENDING = 7,
    XR_SESSION_STATE_EXITING = 8,
    XR_SESSION_STATE_MAX_ENUM = 0x7FFFFFFF
}

enum XrObjectType
{
    XR_OBJECT_TYPE_UNKNOWN = 0,
    XR_OBJECT_TYPE_INSTANCE = 1,
    XR_OBJECT_TYPE_SESSION = 2,
    XR_OBJECT_TYPE_SWAPCHAIN = 3,
    XR_OBJECT_TYPE_SPACE = 4,
    XR_OBJECT_TYPE_ACTION_SET = 5,
    XR_OBJECT_TYPE_ACTION = 6,
    XR_OBJECT_TYPE_DEBUG_UTILS_MESSENGER_EXT = 1000019000,
    XR_OBJECT_TYPE_SPATIAL_ANCHOR_MSFT = 1000039000,
    XR_OBJECT_TYPE_HAND_TRACKER_EXT = 1000051000,
    XR_OBJECT_TYPE_SCENE_OBSERVER_MSFT = 1000097000,
    XR_OBJECT_TYPE_SCENE_MSFT = 1000097001,
    XR_OBJECT_TYPE_FACIAL_TRACKER_HTC = 1000104000,
    XR_OBJECT_TYPE_FOVEATION_PROFILE_FB = 1000114000,
    XR_OBJECT_TYPE_TRIANGLE_MESH_FB = 1000117000,
    XR_OBJECT_TYPE_PASSTHROUGH_FB = 1000118000,
    XR_OBJECT_TYPE_PASSTHROUGH_LAYER_FB = 1000118002,
    XR_OBJECT_TYPE_GEOMETRY_INSTANCE_FB = 1000118004,
    XR_OBJECT_TYPE_SPATIAL_ANCHOR_STORE_CONNECTION_MSFT = 1000142000,
    XR_OBJECT_TYPE_MAX_ENUM = 0x7FFFFFFF
}

alias XrInstanceCreateFlags = ulong;

// Flag bits for XrInstanceCreateFlags

alias XrSessionCreateFlags = ulong;

// Flag bits for XrSessionCreateFlags

alias XrSpaceVelocityFlags = ulong;

// Flag bits for XrSpaceVelocityFlags
extern __gshared const XrSpaceVelocityFlags XR_SPACE_VELOCITY_LINEAR_VALID_BIT;
extern __gshared const XrSpaceVelocityFlags XR_SPACE_VELOCITY_ANGULAR_VALID_BIT;

alias XrSpaceLocationFlags = ulong;

// Flag bits for XrSpaceLocationFlags
extern __gshared const XrSpaceLocationFlags XR_SPACE_LOCATION_ORIENTATION_VALID_BIT;
extern __gshared const XrSpaceLocationFlags XR_SPACE_LOCATION_POSITION_VALID_BIT;
extern __gshared const XrSpaceLocationFlags XR_SPACE_LOCATION_ORIENTATION_TRACKED_BIT;
extern __gshared const XrSpaceLocationFlags XR_SPACE_LOCATION_POSITION_TRACKED_BIT;

alias XrSwapchainCreateFlags = ulong;

// Flag bits for XrSwapchainCreateFlags
extern __gshared const XrSwapchainCreateFlags XR_SWAPCHAIN_CREATE_PROTECTED_CONTENT_BIT;
extern __gshared const XrSwapchainCreateFlags XR_SWAPCHAIN_CREATE_STATIC_IMAGE_BIT;

alias XrSwapchainUsageFlags = ulong;

// Flag bits for XrSwapchainUsageFlags
extern __gshared const XrSwapchainUsageFlags XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT;
extern __gshared const XrSwapchainUsageFlags XR_SWAPCHAIN_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT;
extern __gshared const XrSwapchainUsageFlags XR_SWAPCHAIN_USAGE_UNORDERED_ACCESS_BIT;
extern __gshared const XrSwapchainUsageFlags XR_SWAPCHAIN_USAGE_TRANSFER_SRC_BIT;
extern __gshared const XrSwapchainUsageFlags XR_SWAPCHAIN_USAGE_TRANSFER_DST_BIT;
extern __gshared const XrSwapchainUsageFlags XR_SWAPCHAIN_USAGE_SAMPLED_BIT;
extern __gshared const XrSwapchainUsageFlags XR_SWAPCHAIN_USAGE_MUTABLE_FORMAT_BIT;
extern __gshared const XrSwapchainUsageFlags XR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_MND;
extern __gshared const XrSwapchainUsageFlags XR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_KHR; // alias of XR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_MND

alias XrCompositionLayerFlags = ulong;

// Flag bits for XrCompositionLayerFlags
extern __gshared const XrCompositionLayerFlags XR_COMPOSITION_LAYER_CORRECT_CHROMATIC_ABERRATION_BIT;
extern __gshared const XrCompositionLayerFlags XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT;
extern __gshared const XrCompositionLayerFlags XR_COMPOSITION_LAYER_UNPREMULTIPLIED_ALPHA_BIT;

alias XrViewStateFlags = ulong;

// Flag bits for XrViewStateFlags
extern __gshared const XrViewStateFlags XR_VIEW_STATE_ORIENTATION_VALID_BIT;
extern __gshared const XrViewStateFlags XR_VIEW_STATE_POSITION_VALID_BIT;
extern __gshared const XrViewStateFlags XR_VIEW_STATE_ORIENTATION_TRACKED_BIT;
extern __gshared const XrViewStateFlags XR_VIEW_STATE_POSITION_TRACKED_BIT;

alias XrInputSourceLocalizedNameFlags = ulong;

// Flag bits for XrInputSourceLocalizedNameFlags
extern __gshared const XrInputSourceLocalizedNameFlags XR_INPUT_SOURCE_LOCALIZED_NAME_USER_PATH_BIT;
extern __gshared const XrInputSourceLocalizedNameFlags XR_INPUT_SOURCE_LOCALIZED_NAME_INTERACTION_PROFILE_BIT;
extern __gshared const XrInputSourceLocalizedNameFlags XR_INPUT_SOURCE_LOCALIZED_NAME_COMPONENT_BIT;

alias PFN_xrVoidFunction = void function ();

struct XrApiLayerProperties
{
    XrStructureType type;
    void* next;
    char[XR_MAX_API_LAYER_NAME_SIZE] layerName;
    XrVersion specVersion;
    uint layerVersion;
    char[XR_MAX_API_LAYER_DESCRIPTION_SIZE] description;
}

struct XrExtensionProperties
{
    XrStructureType type;
    void* next;
    char[XR_MAX_EXTENSION_NAME_SIZE] extensionName;
    uint extensionVersion;
}

struct XrApplicationInfo
{
    char[XR_MAX_APPLICATION_NAME_SIZE] applicationName;
    uint applicationVersion;
    char[XR_MAX_ENGINE_NAME_SIZE] engineName;
    uint engineVersion;
    XrVersion apiVersion;
}

struct XrInstanceCreateInfo
{
    XrStructureType type;
    const(void)* next;
    XrInstanceCreateFlags createFlags;
    XrApplicationInfo applicationInfo;
    uint enabledApiLayerCount;
    const(char*)* enabledApiLayerNames;
    uint enabledExtensionCount;
    const(char*)* enabledExtensionNames;
}

struct XrInstanceProperties
{
    XrStructureType type;
    void* next;
    XrVersion runtimeVersion;
    char[XR_MAX_RUNTIME_NAME_SIZE] runtimeName;
}

struct XrEventDataBuffer
{
    XrStructureType type;
    const(void)* next;
    ubyte[4000] varying;
}

struct XrSystemGetInfo
{
    XrStructureType type;
    const(void)* next;
    XrFormFactor formFactor;
}

struct XrSystemGraphicsProperties
{
    uint maxSwapchainImageHeight;
    uint maxSwapchainImageWidth;
    uint maxLayerCount;
}

struct XrSystemTrackingProperties
{
    XrBool32 orientationTracking;
    XrBool32 positionTracking;
}

struct XrSystemProperties
{
    XrStructureType type;
    void* next;
    XrSystemId systemId;
    uint vendorId;
    char[XR_MAX_SYSTEM_NAME_SIZE] systemName;
    XrSystemGraphicsProperties graphicsProperties;
    XrSystemTrackingProperties trackingProperties;
}

struct XrSessionCreateInfo
{
    XrStructureType type;
    const(void)* next;
    XrSessionCreateFlags createFlags;
    XrSystemId systemId;
}

struct XrVector3f
{
    float x;
    float y;
    float z;
}

// XrSpaceVelocity extends XrSpaceLocation
struct XrSpaceVelocity
{
    XrStructureType type;
    void* next;
    XrSpaceVelocityFlags velocityFlags;
    XrVector3f linearVelocity;
    XrVector3f angularVelocity;
}

struct XrQuaternionf
{
    float x;
    float y;
    float z;
    float w;
}

struct XrPosef
{
    XrQuaternionf orientation;
    XrVector3f position;
}

struct XrReferenceSpaceCreateInfo
{
    XrStructureType type;
    const(void)* next;
    XrReferenceSpaceType referenceSpaceType;
    XrPosef poseInReferenceSpace;
}

struct XrExtent2Df
{
    float width;
    float height;
}

struct XrActionSpaceCreateInfo
{
    XrStructureType type;
    const(void)* next;
    XrAction action;
    XrPath subactionPath;
    XrPosef poseInActionSpace;
}

struct XrSpaceLocation
{
    XrStructureType type;
    void* next;
    XrSpaceLocationFlags locationFlags;
    XrPosef pose;
}

struct XrViewConfigurationProperties
{
    XrStructureType type;
    void* next;
    XrViewConfigurationType viewConfigurationType;
    XrBool32 fovMutable;
}

struct XrViewConfigurationView
{
    XrStructureType type;
    void* next;
    uint recommendedImageRectWidth;
    uint maxImageRectWidth;
    uint recommendedImageRectHeight;
    uint maxImageRectHeight;
    uint recommendedSwapchainSampleCount;
    uint maxSwapchainSampleCount;
}

struct XrSwapchainCreateInfo
{
    XrStructureType type;
    const(void)* next;
    XrSwapchainCreateFlags createFlags;
    XrSwapchainUsageFlags usageFlags;
    long format;
    uint sampleCount;
    uint width;
    uint height;
    uint faceCount;
    uint arraySize;
    uint mipCount;
}

struct XrSwapchainImageBaseHeader
{
    XrStructureType type;
    void* next;
}

struct XrSwapchainImageAcquireInfo
{
    XrStructureType type;
    const(void)* next;
}

struct XrSwapchainImageWaitInfo
{
    XrStructureType type;
    const(void)* next;
    XrDuration timeout;
}

struct XrSwapchainImageReleaseInfo
{
    XrStructureType type;
    const(void)* next;
}

struct XrSessionBeginInfo
{
    XrStructureType type;
    const(void)* next;
    XrViewConfigurationType primaryViewConfigurationType;
}

struct XrFrameWaitInfo
{
    XrStructureType type;
    const(void)* next;
}

struct XrFrameState
{
    XrStructureType type;
    void* next;
    XrTime predictedDisplayTime;
    XrDuration predictedDisplayPeriod;
    XrBool32 shouldRender;
}

struct XrFrameBeginInfo
{
    XrStructureType type;
    const(void)* next;
}

struct XrCompositionLayerBaseHeader
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerFlags layerFlags;
    XrSpace space;
}

struct XrFrameEndInfo
{
    XrStructureType type;
    const(void)* next;
    XrTime displayTime;
    XrEnvironmentBlendMode environmentBlendMode;
    uint layerCount;
    const(XrCompositionLayerBaseHeader*)* layers;
}

struct XrViewLocateInfo
{
    XrStructureType type;
    const(void)* next;
    XrViewConfigurationType viewConfigurationType;
    XrTime displayTime;
    XrSpace space;
}

struct XrViewState
{
    XrStructureType type;
    void* next;
    XrViewStateFlags viewStateFlags;
}

struct XrFovf
{
    float angleLeft;
    float angleRight;
    float angleUp;
    float angleDown;
}

struct XrView
{
    XrStructureType type;
    void* next;
    XrPosef pose;
    XrFovf fov;
}

struct XrActionSetCreateInfo
{
    XrStructureType type;
    const(void)* next;
    char[XR_MAX_ACTION_SET_NAME_SIZE] actionSetName;
    char[XR_MAX_LOCALIZED_ACTION_SET_NAME_SIZE] localizedActionSetName;
    uint priority;
}

struct XrActionCreateInfo
{
    XrStructureType type;
    const(void)* next;
    char[XR_MAX_ACTION_NAME_SIZE] actionName;
    XrActionType actionType;
    uint countSubactionPaths;
    const(XrPath)* subactionPaths;
    char[XR_MAX_LOCALIZED_ACTION_NAME_SIZE] localizedActionName;
}

struct XrActionSuggestedBinding
{
    XrAction action;
    XrPath binding;
}

struct XrInteractionProfileSuggestedBinding
{
    XrStructureType type;
    const(void)* next;
    XrPath interactionProfile;
    uint countSuggestedBindings;
    const(XrActionSuggestedBinding)* suggestedBindings;
}

struct XrSessionActionSetsAttachInfo
{
    XrStructureType type;
    const(void)* next;
    uint countActionSets;
    const(XrActionSet)* actionSets;
}

struct XrInteractionProfileState
{
    XrStructureType type;
    void* next;
    XrPath interactionProfile;
}

struct XrActionStateGetInfo
{
    XrStructureType type;
    const(void)* next;
    XrAction action;
    XrPath subactionPath;
}

struct XrActionStateBoolean
{
    XrStructureType type;
    void* next;
    XrBool32 currentState;
    XrBool32 changedSinceLastSync;
    XrTime lastChangeTime;
    XrBool32 isActive;
}

struct XrActionStateFloat
{
    XrStructureType type;
    void* next;
    float currentState;
    XrBool32 changedSinceLastSync;
    XrTime lastChangeTime;
    XrBool32 isActive;
}

struct XrVector2f
{
    float x;
    float y;
}

struct XrActionStateVector2f
{
    XrStructureType type;
    void* next;
    XrVector2f currentState;
    XrBool32 changedSinceLastSync;
    XrTime lastChangeTime;
    XrBool32 isActive;
}

struct XrActionStatePose
{
    XrStructureType type;
    void* next;
    XrBool32 isActive;
}

struct XrActiveActionSet
{
    XrActionSet actionSet;
    XrPath subactionPath;
}

struct XrActionsSyncInfo
{
    XrStructureType type;
    const(void)* next;
    uint countActiveActionSets;
    const(XrActiveActionSet)* activeActionSets;
}

struct XrBoundSourcesForActionEnumerateInfo
{
    XrStructureType type;
    const(void)* next;
    XrAction action;
}

struct XrInputSourceLocalizedNameGetInfo
{
    XrStructureType type;
    const(void)* next;
    XrPath sourcePath;
    XrInputSourceLocalizedNameFlags whichComponents;
}

struct XrHapticActionInfo
{
    XrStructureType type;
    const(void)* next;
    XrAction action;
    XrPath subactionPath;
}

struct XrHapticBaseHeader
{
    XrStructureType type;
    const(void)* next;
}

struct XrBaseInStructure
{
    XrStructureType type;
    const(XrBaseInStructure)* next;
}

struct XrBaseOutStructure
{
    XrStructureType type;
    XrBaseOutStructure* next;
}

struct XrOffset2Di
{
    int x;
    int y;
}

struct XrExtent2Di
{
    int width;
    int height;
}

struct XrRect2Di
{
    XrOffset2Di offset;
    XrExtent2Di extent;
}

struct XrSwapchainSubImage
{
    XrSwapchain swapchain;
    XrRect2Di imageRect;
    uint imageArrayIndex;
}

struct XrCompositionLayerProjectionView
{
    XrStructureType type;
    const(void)* next;
    XrPosef pose;
    XrFovf fov;
    XrSwapchainSubImage subImage;
}

struct XrCompositionLayerProjection
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerFlags layerFlags;
    XrSpace space;
    uint viewCount;
    const(XrCompositionLayerProjectionView)* views;
}

struct XrCompositionLayerQuad
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerFlags layerFlags;
    XrSpace space;
    XrEyeVisibility eyeVisibility;
    XrSwapchainSubImage subImage;
    XrPosef pose;
    XrExtent2Df size;
}

struct XrEventDataBaseHeader
{
    XrStructureType type;
    const(void)* next;
}

struct XrEventDataEventsLost
{
    XrStructureType type;
    const(void)* next;
    uint lostEventCount;
}

struct XrEventDataInstanceLossPending
{
    XrStructureType type;
    const(void)* next;
    XrTime lossTime;
}

struct XrEventDataSessionStateChanged
{
    XrStructureType type;
    const(void)* next;
    XrSession session;
    XrSessionState state;
    XrTime time;
}

struct XrEventDataReferenceSpaceChangePending
{
    XrStructureType type;
    const(void)* next;
    XrSession session;
    XrReferenceSpaceType referenceSpaceType;
    XrTime changeTime;
    XrBool32 poseValid;
    XrPosef poseInPreviousSpace;
}

struct XrEventDataInteractionProfileChanged
{
    XrStructureType type;
    const(void)* next;
    XrSession session;
}

struct XrHapticVibration
{
    XrStructureType type;
    const(void)* next;
    XrDuration duration;
    float frequency;
    float amplitude;
}

struct XrOffset2Df
{
    float x;
    float y;
}

struct XrRect2Df
{
    XrOffset2Df offset;
    XrExtent2Df extent;
}

struct XrVector4f
{
    float x;
    float y;
    float z;
    float w;
}

struct XrColor4f
{
    float r;
    float g;
    float b;
    float a;
}

alias PFN_xrGetInstanceProcAddr = XrResult function (XrInstance instance, const(char)* name, PFN_xrVoidFunction* function_);
alias PFN_xrEnumerateApiLayerProperties = XrResult function (uint propertyCapacityInput, uint* propertyCountOutput, XrApiLayerProperties* properties);
alias PFN_xrEnumerateInstanceExtensionProperties = XrResult function (const(char)* layerName, uint propertyCapacityInput, uint* propertyCountOutput, XrExtensionProperties* properties);
alias PFN_xrCreateInstance = XrResult function (const(XrInstanceCreateInfo)* createInfo, XrInstance* instance);
alias PFN_xrDestroyInstance = XrResult function (XrInstance instance);
alias PFN_xrGetInstanceProperties = XrResult function (XrInstance instance, XrInstanceProperties* instanceProperties);
alias PFN_xrPollEvent = XrResult function (XrInstance instance, XrEventDataBuffer* eventData);
alias PFN_xrResultToString = XrResult function (XrInstance instance, XrResult value, char[XR_MAX_RESULT_STRING_SIZE] buffer);
alias PFN_xrStructureTypeToString = XrResult function (XrInstance instance, XrStructureType value, char[XR_MAX_STRUCTURE_NAME_SIZE] buffer);
alias PFN_xrGetSystem = XrResult function (XrInstance instance, const(XrSystemGetInfo)* getInfo, XrSystemId* systemId);
alias PFN_xrGetSystemProperties = XrResult function (XrInstance instance, XrSystemId systemId, XrSystemProperties* properties);
alias PFN_xrEnumerateEnvironmentBlendModes = XrResult function (XrInstance instance, XrSystemId systemId, XrViewConfigurationType viewConfigurationType, uint environmentBlendModeCapacityInput, uint* environmentBlendModeCountOutput, XrEnvironmentBlendMode* environmentBlendModes);
alias PFN_xrCreateSession = XrResult function (XrInstance instance, const(XrSessionCreateInfo)* createInfo, XrSession* session);
alias PFN_xrDestroySession = XrResult function (XrSession session);
alias PFN_xrEnumerateReferenceSpaces = XrResult function (XrSession session, uint spaceCapacityInput, uint* spaceCountOutput, XrReferenceSpaceType* spaces);
alias PFN_xrCreateReferenceSpace = XrResult function (XrSession session, const(XrReferenceSpaceCreateInfo)* createInfo, XrSpace* space);
alias PFN_xrGetReferenceSpaceBoundsRect = XrResult function (XrSession session, XrReferenceSpaceType referenceSpaceType, XrExtent2Df* bounds);
alias PFN_xrCreateActionSpace = XrResult function (XrSession session, const(XrActionSpaceCreateInfo)* createInfo, XrSpace* space);
alias PFN_xrLocateSpace = XrResult function (XrSpace space, XrSpace baseSpace, XrTime time, XrSpaceLocation* location);
alias PFN_xrDestroySpace = XrResult function (XrSpace space);
alias PFN_xrEnumerateViewConfigurations = XrResult function (XrInstance instance, XrSystemId systemId, uint viewConfigurationTypeCapacityInput, uint* viewConfigurationTypeCountOutput, XrViewConfigurationType* viewConfigurationTypes);
alias PFN_xrGetViewConfigurationProperties = XrResult function (XrInstance instance, XrSystemId systemId, XrViewConfigurationType viewConfigurationType, XrViewConfigurationProperties* configurationProperties);
alias PFN_xrEnumerateViewConfigurationViews = XrResult function (XrInstance instance, XrSystemId systemId, XrViewConfigurationType viewConfigurationType, uint viewCapacityInput, uint* viewCountOutput, XrViewConfigurationView* views);
alias PFN_xrEnumerateSwapchainFormats = XrResult function (XrSession session, uint formatCapacityInput, uint* formatCountOutput, long* formats);
alias PFN_xrCreateSwapchain = XrResult function (XrSession session, const(XrSwapchainCreateInfo)* createInfo, XrSwapchain* swapchain);
alias PFN_xrDestroySwapchain = XrResult function (XrSwapchain swapchain);
alias PFN_xrEnumerateSwapchainImages = XrResult function (XrSwapchain swapchain, uint imageCapacityInput, uint* imageCountOutput, XrSwapchainImageBaseHeader* images);
alias PFN_xrAcquireSwapchainImage = XrResult function (XrSwapchain swapchain, const(XrSwapchainImageAcquireInfo)* acquireInfo, uint* index);
alias PFN_xrWaitSwapchainImage = XrResult function (XrSwapchain swapchain, const(XrSwapchainImageWaitInfo)* waitInfo);
alias PFN_xrReleaseSwapchainImage = XrResult function (XrSwapchain swapchain, const(XrSwapchainImageReleaseInfo)* releaseInfo);
alias PFN_xrBeginSession = XrResult function (XrSession session, const(XrSessionBeginInfo)* beginInfo);
alias PFN_xrEndSession = XrResult function (XrSession session);
alias PFN_xrRequestExitSession = XrResult function (XrSession session);
alias PFN_xrWaitFrame = XrResult function (XrSession session, const(XrFrameWaitInfo)* frameWaitInfo, XrFrameState* frameState);
alias PFN_xrBeginFrame = XrResult function (XrSession session, const(XrFrameBeginInfo)* frameBeginInfo);
alias PFN_xrEndFrame = XrResult function (XrSession session, const(XrFrameEndInfo)* frameEndInfo);
alias PFN_xrLocateViews = XrResult function (XrSession session, const(XrViewLocateInfo)* viewLocateInfo, XrViewState* viewState, uint viewCapacityInput, uint* viewCountOutput, XrView* views);
alias PFN_xrStringToPath = XrResult function (XrInstance instance, const(char)* pathString, XrPath* path);
alias PFN_xrPathToString = XrResult function (XrInstance instance, XrPath path, uint bufferCapacityInput, uint* bufferCountOutput, char* buffer);
alias PFN_xrCreateActionSet = XrResult function (XrInstance instance, const(XrActionSetCreateInfo)* createInfo, XrActionSet* actionSet);
alias PFN_xrDestroyActionSet = XrResult function (XrActionSet actionSet);
alias PFN_xrCreateAction = XrResult function (XrActionSet actionSet, const(XrActionCreateInfo)* createInfo, XrAction* action);
alias PFN_xrDestroyAction = XrResult function (XrAction action);
alias PFN_xrSuggestInteractionProfileBindings = XrResult function (XrInstance instance, const(XrInteractionProfileSuggestedBinding)* suggestedBindings);
alias PFN_xrAttachSessionActionSets = XrResult function (XrSession session, const(XrSessionActionSetsAttachInfo)* attachInfo);
alias PFN_xrGetCurrentInteractionProfile = XrResult function (XrSession session, XrPath topLevelUserPath, XrInteractionProfileState* interactionProfile);
alias PFN_xrGetActionStateBoolean = XrResult function (XrSession session, const(XrActionStateGetInfo)* getInfo, XrActionStateBoolean* state);
alias PFN_xrGetActionStateFloat = XrResult function (XrSession session, const(XrActionStateGetInfo)* getInfo, XrActionStateFloat* state);
alias PFN_xrGetActionStateVector2f = XrResult function (XrSession session, const(XrActionStateGetInfo)* getInfo, XrActionStateVector2f* state);
alias PFN_xrGetActionStatePose = XrResult function (XrSession session, const(XrActionStateGetInfo)* getInfo, XrActionStatePose* state);
alias PFN_xrSyncActions = XrResult function (XrSession session, const(XrActionsSyncInfo)* syncInfo);
alias PFN_xrEnumerateBoundSourcesForAction = XrResult function (XrSession session, const(XrBoundSourcesForActionEnumerateInfo)* enumerateInfo, uint sourceCapacityInput, uint* sourceCountOutput, XrPath* sources);
alias PFN_xrGetInputSourceLocalizedName = XrResult function (XrSession session, const(XrInputSourceLocalizedNameGetInfo)* getInfo, uint bufferCapacityInput, uint* bufferCountOutput, char* buffer);
alias PFN_xrApplyHapticFeedback = XrResult function (XrSession session, const(XrHapticActionInfo)* hapticActionInfo, const(XrHapticBaseHeader)* hapticFeedback);
alias PFN_xrStopHapticFeedback = XrResult function (XrSession session, const(XrHapticActionInfo)* hapticActionInfo);

XrResult xrGetInstanceProcAddr (
    XrInstance instance,
    const(char)* name,
    PFN_xrVoidFunction* function_);

XrResult xrEnumerateApiLayerProperties (
    in uint propertyCapacityInput,
    ref uint propertyCountOutput,
    XrApiLayerProperties[] properties);

XrResult xrEnumerateInstanceExtensionProperties (
    const(char)* layerName,
    uint propertyCapacityInput,
    uint* propertyCountOutput,
    XrExtensionProperties* properties);

XrResult xrCreateInstance (
    const(XrInstanceCreateInfo)* createInfo,
    XrInstance* instance);

XrResult xrDestroyInstance (XrInstance instance);

XrResult xrGetInstanceProperties (
    XrInstance instance,
    XrInstanceProperties* instanceProperties);

XrResult xrPollEvent (XrInstance instance, XrEventDataBuffer* eventData);

XrResult xrResultToString (
    XrInstance instance,
    XrResult value,
    ref char[XR_MAX_RESULT_STRING_SIZE] buffer);

XrResult xrStructureTypeToString (
    XrInstance instance,
    XrStructureType value,
    ref char[XR_MAX_STRUCTURE_NAME_SIZE] buffer);

XrResult xrGetSystem (
    XrInstance instance,
    const(XrSystemGetInfo)* getInfo,
    XrSystemId* systemId);

XrResult xrGetSystemProperties (
    XrInstance instance,
    XrSystemId systemId,
    XrSystemProperties* properties);

XrResult xrEnumerateEnvironmentBlendModes (
    XrInstance instance,
    XrSystemId systemId,
    XrViewConfigurationType viewConfigurationType,
    uint environmentBlendModeCapacityInput,
    uint* environmentBlendModeCountOutput,
    XrEnvironmentBlendMode* environmentBlendModes);

XrResult xrCreateSession (
    XrInstance instance,
    const(XrSessionCreateInfo)* createInfo,
    XrSession* session);

XrResult xrDestroySession (XrSession session);

XrResult xrEnumerateReferenceSpaces (
    XrSession session,
    uint spaceCapacityInput,
    uint* spaceCountOutput,
    XrReferenceSpaceType* spaces);

XrResult xrCreateReferenceSpace (
    XrSession session,
    const(XrReferenceSpaceCreateInfo)* createInfo,
    XrSpace* space);

XrResult xrGetReferenceSpaceBoundsRect (
    XrSession session,
    XrReferenceSpaceType referenceSpaceType,
    XrExtent2Df* bounds);

XrResult xrCreateActionSpace (
    XrSession session,
    const(XrActionSpaceCreateInfo)* createInfo,
    XrSpace* space);

XrResult xrLocateSpace (
    XrSpace space,
    XrSpace baseSpace,
    XrTime time,
    XrSpaceLocation* location);

XrResult xrDestroySpace (XrSpace space);

XrResult xrEnumerateViewConfigurations (
    XrInstance instance,
    XrSystemId systemId,
    uint viewConfigurationTypeCapacityInput,
    uint* viewConfigurationTypeCountOutput,
    XrViewConfigurationType* viewConfigurationTypes);

XrResult xrGetViewConfigurationProperties (
    XrInstance instance,
    XrSystemId systemId,
    XrViewConfigurationType viewConfigurationType,
    XrViewConfigurationProperties* configurationProperties);

XrResult xrEnumerateViewConfigurationViews (
    XrInstance instance,
    XrSystemId systemId,
    XrViewConfigurationType viewConfigurationType,
    uint viewCapacityInput,
    uint* viewCountOutput,
    XrViewConfigurationView* views);

XrResult xrEnumerateSwapchainFormats (
    XrSession session,
    uint formatCapacityInput,
    uint* formatCountOutput,
    long* formats);

XrResult xrCreateSwapchain (
    XrSession session,
    const(XrSwapchainCreateInfo)* createInfo,
    XrSwapchain* swapchain);

XrResult xrDestroySwapchain (XrSwapchain swapchain);

XrResult xrEnumerateSwapchainImages (
    XrSwapchain swapchain,
    uint imageCapacityInput,
    uint* imageCountOutput,
    XrSwapchainImageBaseHeader* images);

XrResult xrAcquireSwapchainImage (
    XrSwapchain swapchain,
    const(XrSwapchainImageAcquireInfo)* acquireInfo,
    uint* index);

XrResult xrWaitSwapchainImage (
    XrSwapchain swapchain,
    const(XrSwapchainImageWaitInfo)* waitInfo);

XrResult xrReleaseSwapchainImage (
    XrSwapchain swapchain,
    const(XrSwapchainImageReleaseInfo)* releaseInfo);

XrResult xrBeginSession (
    XrSession session,
    const(XrSessionBeginInfo)* beginInfo);

XrResult xrEndSession (XrSession session);

XrResult xrRequestExitSession (XrSession session);

XrResult xrWaitFrame (
    XrSession session,
    const(XrFrameWaitInfo)* frameWaitInfo,
    XrFrameState* frameState);

XrResult xrBeginFrame (
    XrSession session,
    const(XrFrameBeginInfo)* frameBeginInfo);

XrResult xrEndFrame (XrSession session, const(XrFrameEndInfo)* frameEndInfo);

XrResult xrLocateViews (
    XrSession session,
    const(XrViewLocateInfo)* viewLocateInfo,
    XrViewState* viewState,
    uint viewCapacityInput,
    uint* viewCountOutput,
    XrView* views);

XrResult xrStringToPath (
    XrInstance instance,
    const(char)* pathString,
    XrPath* path);

XrResult xrPathToString (
    XrInstance instance,
    XrPath path,
    uint bufferCapacityInput,
    uint* bufferCountOutput,
    char* buffer);

XrResult xrCreateActionSet (
    XrInstance instance,
    const(XrActionSetCreateInfo)* createInfo,
    XrActionSet* actionSet);

XrResult xrDestroyActionSet (XrActionSet actionSet);

XrResult xrCreateAction (
    XrActionSet actionSet,
    const(XrActionCreateInfo)* createInfo,
    XrAction* action);

XrResult xrDestroyAction (XrAction action);

XrResult xrSuggestInteractionProfileBindings (
    XrInstance instance,
    const(XrInteractionProfileSuggestedBinding)* suggestedBindings);

XrResult xrAttachSessionActionSets (
    XrSession session,
    const(XrSessionActionSetsAttachInfo)* attachInfo);

XrResult xrGetCurrentInteractionProfile (
    XrSession session,
    XrPath topLevelUserPath,
    XrInteractionProfileState* interactionProfile);

XrResult xrGetActionStateBoolean (
    XrSession session,
    const(XrActionStateGetInfo)* getInfo,
    XrActionStateBoolean* state);

XrResult xrGetActionStateFloat (
    XrSession session,
    const(XrActionStateGetInfo)* getInfo,
    XrActionStateFloat* state);

XrResult xrGetActionStateVector2f (
    XrSession session,
    const(XrActionStateGetInfo)* getInfo,
    XrActionStateVector2f* state);

XrResult xrGetActionStatePose (
    XrSession session,
    const(XrActionStateGetInfo)* getInfo,
    XrActionStatePose* state);

XrResult xrSyncActions (XrSession session, const(XrActionsSyncInfo)* syncInfo);

XrResult xrEnumerateBoundSourcesForAction (
    XrSession session,
    const(XrBoundSourcesForActionEnumerateInfo)* enumerateInfo,
    uint sourceCapacityInput,
    uint* sourceCountOutput,
    XrPath* sources);

XrResult xrGetInputSourceLocalizedName (
    XrSession session,
    const(XrInputSourceLocalizedNameGetInfo)* getInfo,
    uint bufferCapacityInput,
    uint* bufferCountOutput,
    char* buffer);

XrResult xrApplyHapticFeedback (
    XrSession session,
    const(XrHapticActionInfo)* hapticActionInfo,
    const(XrHapticBaseHeader)* hapticFeedback);

XrResult xrStopHapticFeedback (
    XrSession session,
    const(XrHapticActionInfo)* hapticActionInfo);
/* !XR_NO_PROTOTYPES */

enum XR_KHR_composition_layer_cube = 1;
enum XR_KHR_composition_layer_cube_SPEC_VERSION = 8;
enum XR_KHR_COMPOSITION_LAYER_CUBE_EXTENSION_NAME = "XR_KHR_composition_layer_cube";

struct XrCompositionLayerCubeKHR
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerFlags layerFlags;
    XrSpace space;
    XrEyeVisibility eyeVisibility;
    XrSwapchain swapchain;
    uint imageArrayIndex;
    XrQuaternionf orientation;
}

enum XR_KHR_composition_layer_depth = 1;
enum XR_KHR_composition_layer_depth_SPEC_VERSION = 5;
enum XR_KHR_COMPOSITION_LAYER_DEPTH_EXTENSION_NAME = "XR_KHR_composition_layer_depth";
// XrCompositionLayerDepthInfoKHR extends XrCompositionLayerProjectionView
struct XrCompositionLayerDepthInfoKHR
{
    XrStructureType type;
    const(void)* next;
    XrSwapchainSubImage subImage;
    float minDepth;
    float maxDepth;
    float nearZ;
    float farZ;
}

enum XR_KHR_composition_layer_cylinder = 1;
enum XR_KHR_composition_layer_cylinder_SPEC_VERSION = 4;
enum XR_KHR_COMPOSITION_LAYER_CYLINDER_EXTENSION_NAME = "XR_KHR_composition_layer_cylinder";

struct XrCompositionLayerCylinderKHR
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerFlags layerFlags;
    XrSpace space;
    XrEyeVisibility eyeVisibility;
    XrSwapchainSubImage subImage;
    XrPosef pose;
    float radius;
    float centralAngle;
    float aspectRatio;
}

enum XR_KHR_composition_layer_equirect = 1;
enum XR_KHR_composition_layer_equirect_SPEC_VERSION = 3;
enum XR_KHR_COMPOSITION_LAYER_EQUIRECT_EXTENSION_NAME = "XR_KHR_composition_layer_equirect";

struct XrCompositionLayerEquirectKHR
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerFlags layerFlags;
    XrSpace space;
    XrEyeVisibility eyeVisibility;
    XrSwapchainSubImage subImage;
    XrPosef pose;
    float radius;
    XrVector2f scale;
    XrVector2f bias;
}

enum XR_KHR_visibility_mask = 1;
enum XR_KHR_visibility_mask_SPEC_VERSION = 2;
enum XR_KHR_VISIBILITY_MASK_EXTENSION_NAME = "XR_KHR_visibility_mask";

enum XrVisibilityMaskTypeKHR
{
    XR_VISIBILITY_MASK_TYPE_HIDDEN_TRIANGLE_MESH_KHR = 1,
    XR_VISIBILITY_MASK_TYPE_VISIBLE_TRIANGLE_MESH_KHR = 2,
    XR_VISIBILITY_MASK_TYPE_LINE_LOOP_KHR = 3,
    XR_VISIBILITY_MASK_TYPE_MAX_ENUM_KHR = 0x7FFFFFFF
}

struct XrVisibilityMaskKHR
{
    XrStructureType type;
    void* next;
    uint vertexCapacityInput;
    uint vertexCountOutput;
    XrVector2f* vertices;
    uint indexCapacityInput;
    uint indexCountOutput;
    uint* indices;
}

struct XrEventDataVisibilityMaskChangedKHR
{
    XrStructureType type;
    const(void)* next;
    XrSession session;
    XrViewConfigurationType viewConfigurationType;
    uint viewIndex;
}

alias PFN_xrGetVisibilityMaskKHR = XrResult function (XrSession session, XrViewConfigurationType viewConfigurationType, uint viewIndex, XrVisibilityMaskTypeKHR visibilityMaskType, XrVisibilityMaskKHR* visibilityMask);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_KHR_composition_layer_color_scale_bias = 1;
enum XR_KHR_composition_layer_color_scale_bias_SPEC_VERSION = 5;
enum XR_KHR_COMPOSITION_LAYER_COLOR_SCALE_BIAS_EXTENSION_NAME = "XR_KHR_composition_layer_color_scale_bias";
// XrCompositionLayerColorScaleBiasKHR extends XrCompositionLayerBaseHeader
struct XrCompositionLayerColorScaleBiasKHR
{
    XrStructureType type;
    const(void)* next;
    XrColor4f colorScale;
    XrColor4f colorBias;
}

enum XR_KHR_loader_init = 1;
enum XR_KHR_loader_init_SPEC_VERSION = 1;
enum XR_KHR_LOADER_INIT_EXTENSION_NAME = "XR_KHR_loader_init";

struct XrLoaderInitInfoBaseHeaderKHR
{
    XrStructureType type;
    const(void)* next;
}

alias PFN_xrInitializeLoaderKHR = XrResult function (const(XrLoaderInitInfoBaseHeaderKHR)* loaderInitInfo);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_KHR_composition_layer_equirect2 = 1;
enum XR_KHR_composition_layer_equirect2_SPEC_VERSION = 1;
enum XR_KHR_COMPOSITION_LAYER_EQUIRECT2_EXTENSION_NAME = "XR_KHR_composition_layer_equirect2";

struct XrCompositionLayerEquirect2KHR
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerFlags layerFlags;
    XrSpace space;
    XrEyeVisibility eyeVisibility;
    XrSwapchainSubImage subImage;
    XrPosef pose;
    float radius;
    float centralHorizontalAngle;
    float upperVerticalAngle;
    float lowerVerticalAngle;
}

enum XR_KHR_binding_modification = 1;
enum XR_KHR_binding_modification_SPEC_VERSION = 1;
enum XR_KHR_BINDING_MODIFICATION_EXTENSION_NAME = "XR_KHR_binding_modification";

struct XrBindingModificationBaseHeaderKHR
{
    XrStructureType type;
    const(void)* next;
}

// XrBindingModificationsKHR extends XrInteractionProfileSuggestedBinding
struct XrBindingModificationsKHR
{
    XrStructureType type;
    const(void)* next;
    uint bindingModificationCount;
    const(XrBindingModificationBaseHeaderKHR*)* bindingModifications;
}

enum XR_KHR_swapchain_usage_input_attachment_bit = 1;
enum XR_KHR_swapchain_usage_input_attachment_bit_SPEC_VERSION = 3;
enum XR_KHR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_EXTENSION_NAME = "XR_KHR_swapchain_usage_input_attachment_bit";

enum XR_EXT_performance_settings = 1;
enum XR_EXT_performance_settings_SPEC_VERSION = 3;
enum XR_EXT_PERFORMANCE_SETTINGS_EXTENSION_NAME = "XR_EXT_performance_settings";

enum XrPerfSettingsDomainEXT
{
    XR_PERF_SETTINGS_DOMAIN_CPU_EXT = 1,
    XR_PERF_SETTINGS_DOMAIN_GPU_EXT = 2,
    XR_PERF_SETTINGS_DOMAIN_MAX_ENUM_EXT = 0x7FFFFFFF
}

enum XrPerfSettingsSubDomainEXT
{
    XR_PERF_SETTINGS_SUB_DOMAIN_COMPOSITING_EXT = 1,
    XR_PERF_SETTINGS_SUB_DOMAIN_RENDERING_EXT = 2,
    XR_PERF_SETTINGS_SUB_DOMAIN_THERMAL_EXT = 3,
    XR_PERF_SETTINGS_SUB_DOMAIN_MAX_ENUM_EXT = 0x7FFFFFFF
}

enum XrPerfSettingsLevelEXT
{
    XR_PERF_SETTINGS_LEVEL_POWER_SAVINGS_EXT = 0,
    XR_PERF_SETTINGS_LEVEL_SUSTAINED_LOW_EXT = 25,
    XR_PERF_SETTINGS_LEVEL_SUSTAINED_HIGH_EXT = 50,
    XR_PERF_SETTINGS_LEVEL_BOOST_EXT = 75,
    XR_PERF_SETTINGS_LEVEL_MAX_ENUM_EXT = 0x7FFFFFFF
}

enum XrPerfSettingsNotificationLevelEXT
{
    XR_PERF_SETTINGS_NOTIF_LEVEL_NORMAL_EXT = 0,
    XR_PERF_SETTINGS_NOTIF_LEVEL_WARNING_EXT = 25,
    XR_PERF_SETTINGS_NOTIF_LEVEL_IMPAIRED_EXT = 75,
    XR_PERF_SETTINGS_NOTIFICATION_LEVEL_MAX_ENUM_EXT = 0x7FFFFFFF
}

struct XrEventDataPerfSettingsEXT
{
    XrStructureType type;
    const(void)* next;
    XrPerfSettingsDomainEXT domain;
    XrPerfSettingsSubDomainEXT subDomain;
    XrPerfSettingsNotificationLevelEXT fromLevel;
    XrPerfSettingsNotificationLevelEXT toLevel;
}

alias PFN_xrPerfSettingsSetPerformanceLevelEXT = XrResult function (XrSession session, XrPerfSettingsDomainEXT domain, XrPerfSettingsLevelEXT level);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_EXT_thermal_query = 1;
enum XR_EXT_thermal_query_SPEC_VERSION = 2;
enum XR_EXT_THERMAL_QUERY_EXTENSION_NAME = "XR_EXT_thermal_query";
alias PFN_xrThermalGetTemperatureTrendEXT = XrResult function (XrSession session, XrPerfSettingsDomainEXT domain, XrPerfSettingsNotificationLevelEXT* notificationLevel, float* tempHeadroom, float* tempSlope);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_EXT_debug_utils = 1;
struct XrDebugUtilsMessengerEXT_T;
alias XrDebugUtilsMessengerEXT = XrDebugUtilsMessengerEXT_T*;
enum XR_EXT_debug_utils_SPEC_VERSION = 4;
enum XR_EXT_DEBUG_UTILS_EXTENSION_NAME = "XR_EXT_debug_utils";
alias XrDebugUtilsMessageSeverityFlagsEXT = ulong;

// Flag bits for XrDebugUtilsMessageSeverityFlagsEXT
extern __gshared const XrDebugUtilsMessageSeverityFlagsEXT XR_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT;
extern __gshared const XrDebugUtilsMessageSeverityFlagsEXT XR_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT;
extern __gshared const XrDebugUtilsMessageSeverityFlagsEXT XR_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT;
extern __gshared const XrDebugUtilsMessageSeverityFlagsEXT XR_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT;

alias XrDebugUtilsMessageTypeFlagsEXT = ulong;

// Flag bits for XrDebugUtilsMessageTypeFlagsEXT
extern __gshared const XrDebugUtilsMessageTypeFlagsEXT XR_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT;
extern __gshared const XrDebugUtilsMessageTypeFlagsEXT XR_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT;
extern __gshared const XrDebugUtilsMessageTypeFlagsEXT XR_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT;
extern __gshared const XrDebugUtilsMessageTypeFlagsEXT XR_DEBUG_UTILS_MESSAGE_TYPE_CONFORMANCE_BIT_EXT;

struct XrDebugUtilsObjectNameInfoEXT
{
    XrStructureType type;
    const(void)* next;
    XrObjectType objectType;
    ulong objectHandle;
    const(char)* objectName;
}

struct XrDebugUtilsLabelEXT
{
    XrStructureType type;
    const(void)* next;
    const(char)* labelName;
}

struct XrDebugUtilsMessengerCallbackDataEXT
{
    XrStructureType type;
    const(void)* next;
    const(char)* messageId;
    const(char)* functionName;
    const(char)* message;
    uint objectCount;
    XrDebugUtilsObjectNameInfoEXT* objects;
    uint sessionLabelCount;
    XrDebugUtilsLabelEXT* sessionLabels;
}

alias PFN_xrDebugUtilsMessengerCallbackEXT = uint function (XrDebugUtilsMessageSeverityFlagsEXT messageSeverity, XrDebugUtilsMessageTypeFlagsEXT messageTypes, const(XrDebugUtilsMessengerCallbackDataEXT)* callbackData, void* userData);

// XrDebugUtilsMessengerCreateInfoEXT extends XrInstanceCreateInfo
struct XrDebugUtilsMessengerCreateInfoEXT
{
    XrStructureType type;
    const(void)* next;
    XrDebugUtilsMessageSeverityFlagsEXT messageSeverities;
    XrDebugUtilsMessageTypeFlagsEXT messageTypes;
    PFN_xrDebugUtilsMessengerCallbackEXT userCallback;
    void* userData;
}

alias PFN_xrSetDebugUtilsObjectNameEXT = XrResult function (XrInstance instance, const(XrDebugUtilsObjectNameInfoEXT)* nameInfo);
alias PFN_xrCreateDebugUtilsMessengerEXT = XrResult function (XrInstance instance, const(XrDebugUtilsMessengerCreateInfoEXT)* createInfo, XrDebugUtilsMessengerEXT* messenger);
alias PFN_xrDestroyDebugUtilsMessengerEXT = XrResult function (XrDebugUtilsMessengerEXT messenger);
alias PFN_xrSubmitDebugUtilsMessageEXT = XrResult function (XrInstance instance, XrDebugUtilsMessageSeverityFlagsEXT messageSeverity, XrDebugUtilsMessageTypeFlagsEXT messageTypes, const(XrDebugUtilsMessengerCallbackDataEXT)* callbackData);
alias PFN_xrSessionBeginDebugUtilsLabelRegionEXT = XrResult function (XrSession session, const(XrDebugUtilsLabelEXT)* labelInfo);
alias PFN_xrSessionEndDebugUtilsLabelRegionEXT = XrResult function (XrSession session);
alias PFN_xrSessionInsertDebugUtilsLabelEXT = XrResult function (XrSession session, const(XrDebugUtilsLabelEXT)* labelInfo);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_EXT_eye_gaze_interaction = 1;
enum XR_EXT_eye_gaze_interaction_SPEC_VERSION = 1;
enum XR_EXT_EYE_GAZE_INTERACTION_EXTENSION_NAME = "XR_EXT_eye_gaze_interaction";
// XrSystemEyeGazeInteractionPropertiesEXT extends XrSystemProperties
struct XrSystemEyeGazeInteractionPropertiesEXT
{
    XrStructureType type;
    void* next;
    XrBool32 supportsEyeGazeInteraction;
}

// XrEyeGazeSampleTimeEXT extends XrSpaceLocation
struct XrEyeGazeSampleTimeEXT
{
    XrStructureType type;
    void* next;
    XrTime time;
}

enum XR_EXTX_overlay = 1;
enum XR_EXTX_overlay_SPEC_VERSION = 5;
enum XR_EXTX_OVERLAY_EXTENSION_NAME = "XR_EXTX_overlay";
alias XrOverlaySessionCreateFlagsEXTX = ulong;

// Flag bits for XrOverlaySessionCreateFlagsEXTX

alias XrOverlayMainSessionFlagsEXTX = ulong;

// Flag bits for XrOverlayMainSessionFlagsEXTX
extern __gshared const XrOverlayMainSessionFlagsEXTX XR_OVERLAY_MAIN_SESSION_ENABLED_COMPOSITION_LAYER_INFO_DEPTH_BIT_EXTX;

// XrSessionCreateInfoOverlayEXTX extends XrSessionCreateInfo
struct XrSessionCreateInfoOverlayEXTX
{
    XrStructureType type;
    const(void)* next;
    XrOverlaySessionCreateFlagsEXTX createFlags;
    uint sessionLayersPlacement;
}

struct XrEventDataMainSessionVisibilityChangedEXTX
{
    XrStructureType type;
    const(void)* next;
    XrBool32 visible;
    XrOverlayMainSessionFlagsEXTX flags;
}

enum XR_VARJO_quad_views = 1;
enum XR_VARJO_quad_views_SPEC_VERSION = 1;
enum XR_VARJO_QUAD_VIEWS_EXTENSION_NAME = "XR_VARJO_quad_views";

enum XR_MSFT_unbounded_reference_space = 1;
enum XR_MSFT_unbounded_reference_space_SPEC_VERSION = 1;
enum XR_MSFT_UNBOUNDED_REFERENCE_SPACE_EXTENSION_NAME = "XR_MSFT_unbounded_reference_space";

enum XR_MSFT_spatial_anchor = 1;
struct XrSpatialAnchorMSFT_T;
alias XrSpatialAnchorMSFT = XrSpatialAnchorMSFT_T*;
enum XR_MSFT_spatial_anchor_SPEC_VERSION = 2;
enum XR_MSFT_SPATIAL_ANCHOR_EXTENSION_NAME = "XR_MSFT_spatial_anchor";

struct XrSpatialAnchorCreateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrSpace space;
    XrPosef pose;
    XrTime time;
}

struct XrSpatialAnchorSpaceCreateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrSpatialAnchorMSFT anchor;
    XrPosef poseInAnchorSpace;
}

alias PFN_xrCreateSpatialAnchorMSFT = XrResult function (XrSession session, const(XrSpatialAnchorCreateInfoMSFT)* createInfo, XrSpatialAnchorMSFT* anchor);
alias PFN_xrCreateSpatialAnchorSpaceMSFT = XrResult function (XrSession session, const(XrSpatialAnchorSpaceCreateInfoMSFT)* createInfo, XrSpace* space);
alias PFN_xrDestroySpatialAnchorMSFT = XrResult function (XrSpatialAnchorMSFT anchor);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_composition_layer_image_layout = 1;
enum XR_FB_composition_layer_image_layout_SPEC_VERSION = 1;
enum XR_FB_COMPOSITION_LAYER_IMAGE_LAYOUT_EXTENSION_NAME = "XR_FB_composition_layer_image_layout";
alias XrCompositionLayerImageLayoutFlagsFB = ulong;

// Flag bits for XrCompositionLayerImageLayoutFlagsFB
extern __gshared const XrCompositionLayerImageLayoutFlagsFB XR_COMPOSITION_LAYER_IMAGE_LAYOUT_VERTICAL_FLIP_BIT_FB;

// XrCompositionLayerImageLayoutFB extends XrCompositionLayerBaseHeader
struct XrCompositionLayerImageLayoutFB
{
    XrStructureType type;
    void* next;
    XrCompositionLayerImageLayoutFlagsFB flags;
}

enum XR_FB_composition_layer_alpha_blend = 1;
enum XR_FB_composition_layer_alpha_blend_SPEC_VERSION = 2;
enum XR_FB_COMPOSITION_LAYER_ALPHA_BLEND_EXTENSION_NAME = "XR_FB_composition_layer_alpha_blend";

enum XrBlendFactorFB
{
    XR_BLEND_FACTOR_ZERO_FB = 0,
    XR_BLEND_FACTOR_ONE_FB = 1,
    XR_BLEND_FACTOR_SRC_ALPHA_FB = 2,
    XR_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA_FB = 3,
    XR_BLEND_FACTOR_DST_ALPHA_FB = 4,
    XR_BLEND_FACTOR_ONE_MINUS_DST_ALPHA_FB = 5,
    XR_BLEND_FACTOR_MAX_ENUM_FB = 0x7FFFFFFF
}

// XrCompositionLayerAlphaBlendFB extends XrCompositionLayerBaseHeader
struct XrCompositionLayerAlphaBlendFB
{
    XrStructureType type;
    void* next;
    XrBlendFactorFB srcFactorColor;
    XrBlendFactorFB dstFactorColor;
    XrBlendFactorFB srcFactorAlpha;
    XrBlendFactorFB dstFactorAlpha;
}

enum XR_MND_headless = 1;
enum XR_MND_headless_SPEC_VERSION = 2;
enum XR_MND_HEADLESS_EXTENSION_NAME = "XR_MND_headless";

enum XR_OCULUS_android_session_state_enable = 1;
enum XR_OCULUS_android_session_state_enable_SPEC_VERSION = 1;
enum XR_OCULUS_ANDROID_SESSION_STATE_ENABLE_EXTENSION_NAME = "XR_OCULUS_android_session_state_enable";

enum XR_EXT_view_configuration_depth_range = 1;
enum XR_EXT_view_configuration_depth_range_SPEC_VERSION = 1;
enum XR_EXT_VIEW_CONFIGURATION_DEPTH_RANGE_EXTENSION_NAME = "XR_EXT_view_configuration_depth_range";
// XrViewConfigurationDepthRangeEXT extends XrViewConfigurationView
struct XrViewConfigurationDepthRangeEXT
{
    XrStructureType type;
    void* next;
    float recommendedNearZ;
    float minNearZ;
    float recommendedFarZ;
    float maxFarZ;
}

enum XR_EXT_conformance_automation = 1;
enum XR_EXT_conformance_automation_SPEC_VERSION = 3;
enum XR_EXT_CONFORMANCE_AUTOMATION_EXTENSION_NAME = "XR_EXT_conformance_automation";
alias PFN_xrSetInputDeviceActiveEXT = XrResult function (XrSession session, XrPath interactionProfile, XrPath topLevelPath, XrBool32 isActive);
alias PFN_xrSetInputDeviceStateBoolEXT = XrResult function (XrSession session, XrPath topLevelPath, XrPath inputSourcePath, XrBool32 state);
alias PFN_xrSetInputDeviceStateFloatEXT = XrResult function (XrSession session, XrPath topLevelPath, XrPath inputSourcePath, float state);
alias PFN_xrSetInputDeviceStateVector2fEXT = XrResult function (XrSession session, XrPath topLevelPath, XrPath inputSourcePath, XrVector2f state);
alias PFN_xrSetInputDeviceLocationEXT = XrResult function (XrSession session, XrPath topLevelPath, XrPath inputSourcePath, XrSpace space, XrPosef pose);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_MSFT_spatial_graph_bridge = 1;
enum XR_MSFT_spatial_graph_bridge_SPEC_VERSION = 1;
enum XR_MSFT_SPATIAL_GRAPH_BRIDGE_EXTENSION_NAME = "XR_MSFT_spatial_graph_bridge";

enum XrSpatialGraphNodeTypeMSFT
{
    XR_SPATIAL_GRAPH_NODE_TYPE_STATIC_MSFT = 1,
    XR_SPATIAL_GRAPH_NODE_TYPE_DYNAMIC_MSFT = 2,
    XR_SPATIAL_GRAPH_NODE_TYPE_MAX_ENUM_MSFT = 0x7FFFFFFF
}

struct XrSpatialGraphNodeSpaceCreateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrSpatialGraphNodeTypeMSFT nodeType;
    ubyte[16] nodeId;
    XrPosef pose;
}

alias PFN_xrCreateSpatialGraphNodeSpaceMSFT = XrResult function (XrSession session, const(XrSpatialGraphNodeSpaceCreateInfoMSFT)* createInfo, XrSpace* space);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_MSFT_hand_interaction = 1;
enum XR_MSFT_hand_interaction_SPEC_VERSION = 1;
enum XR_MSFT_HAND_INTERACTION_EXTENSION_NAME = "XR_MSFT_hand_interaction";

enum XR_EXT_hand_tracking = 1;

enum XR_HAND_JOINT_COUNT_EXT = 26;

struct XrHandTrackerEXT_T;
alias XrHandTrackerEXT = XrHandTrackerEXT_T*;
enum XR_EXT_hand_tracking_SPEC_VERSION = 4;
enum XR_EXT_HAND_TRACKING_EXTENSION_NAME = "XR_EXT_hand_tracking";

enum XrHandEXT
{
    XR_HAND_LEFT_EXT = 1,
    XR_HAND_RIGHT_EXT = 2,
    XR_HAND_MAX_ENUM_EXT = 0x7FFFFFFF
}

enum XrHandJointEXT
{
    XR_HAND_JOINT_PALM_EXT = 0,
    XR_HAND_JOINT_WRIST_EXT = 1,
    XR_HAND_JOINT_THUMB_METACARPAL_EXT = 2,
    XR_HAND_JOINT_THUMB_PROXIMAL_EXT = 3,
    XR_HAND_JOINT_THUMB_DISTAL_EXT = 4,
    XR_HAND_JOINT_THUMB_TIP_EXT = 5,
    XR_HAND_JOINT_INDEX_METACARPAL_EXT = 6,
    XR_HAND_JOINT_INDEX_PROXIMAL_EXT = 7,
    XR_HAND_JOINT_INDEX_INTERMEDIATE_EXT = 8,
    XR_HAND_JOINT_INDEX_DISTAL_EXT = 9,
    XR_HAND_JOINT_INDEX_TIP_EXT = 10,
    XR_HAND_JOINT_MIDDLE_METACARPAL_EXT = 11,
    XR_HAND_JOINT_MIDDLE_PROXIMAL_EXT = 12,
    XR_HAND_JOINT_MIDDLE_INTERMEDIATE_EXT = 13,
    XR_HAND_JOINT_MIDDLE_DISTAL_EXT = 14,
    XR_HAND_JOINT_MIDDLE_TIP_EXT = 15,
    XR_HAND_JOINT_RING_METACARPAL_EXT = 16,
    XR_HAND_JOINT_RING_PROXIMAL_EXT = 17,
    XR_HAND_JOINT_RING_INTERMEDIATE_EXT = 18,
    XR_HAND_JOINT_RING_DISTAL_EXT = 19,
    XR_HAND_JOINT_RING_TIP_EXT = 20,
    XR_HAND_JOINT_LITTLE_METACARPAL_EXT = 21,
    XR_HAND_JOINT_LITTLE_PROXIMAL_EXT = 22,
    XR_HAND_JOINT_LITTLE_INTERMEDIATE_EXT = 23,
    XR_HAND_JOINT_LITTLE_DISTAL_EXT = 24,
    XR_HAND_JOINT_LITTLE_TIP_EXT = 25,
    XR_HAND_JOINT_MAX_ENUM_EXT = 0x7FFFFFFF
}

enum XrHandJointSetEXT
{
    XR_HAND_JOINT_SET_DEFAULT_EXT = 0,
    XR_HAND_JOINT_SET_MAX_ENUM_EXT = 0x7FFFFFFF
}

// XrSystemHandTrackingPropertiesEXT extends XrSystemProperties
struct XrSystemHandTrackingPropertiesEXT
{
    XrStructureType type;
    void* next;
    XrBool32 supportsHandTracking;
}

struct XrHandTrackerCreateInfoEXT
{
    XrStructureType type;
    const(void)* next;
    XrHandEXT hand;
    XrHandJointSetEXT handJointSet;
}

struct XrHandJointsLocateInfoEXT
{
    XrStructureType type;
    const(void)* next;
    XrSpace baseSpace;
    XrTime time;
}

struct XrHandJointLocationEXT
{
    XrSpaceLocationFlags locationFlags;
    XrPosef pose;
    float radius;
}

struct XrHandJointVelocityEXT
{
    XrSpaceVelocityFlags velocityFlags;
    XrVector3f linearVelocity;
    XrVector3f angularVelocity;
}

struct XrHandJointLocationsEXT
{
    XrStructureType type;
    void* next;
    XrBool32 isActive;
    uint jointCount;
    XrHandJointLocationEXT* jointLocations;
}

// XrHandJointVelocitiesEXT extends XrHandJointLocationsEXT
struct XrHandJointVelocitiesEXT
{
    XrStructureType type;
    void* next;
    uint jointCount;
    XrHandJointVelocityEXT* jointVelocities;
}

alias PFN_xrCreateHandTrackerEXT = XrResult function (XrSession session, const(XrHandTrackerCreateInfoEXT)* createInfo, XrHandTrackerEXT* handTracker);
alias PFN_xrDestroyHandTrackerEXT = XrResult function (XrHandTrackerEXT handTracker);
alias PFN_xrLocateHandJointsEXT = XrResult function (XrHandTrackerEXT handTracker, const(XrHandJointsLocateInfoEXT)* locateInfo, XrHandJointLocationsEXT* locations);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_MSFT_hand_tracking_mesh = 1;
enum XR_MSFT_hand_tracking_mesh_SPEC_VERSION = 4;
enum XR_MSFT_HAND_TRACKING_MESH_EXTENSION_NAME = "XR_MSFT_hand_tracking_mesh";

enum XrHandPoseTypeMSFT
{
    XR_HAND_POSE_TYPE_TRACKED_MSFT = 0,
    XR_HAND_POSE_TYPE_REFERENCE_OPEN_PALM_MSFT = 1,
    XR_HAND_POSE_TYPE_MAX_ENUM_MSFT = 0x7FFFFFFF
}

// XrSystemHandTrackingMeshPropertiesMSFT extends XrSystemProperties
struct XrSystemHandTrackingMeshPropertiesMSFT
{
    XrStructureType type;
    void* next;
    XrBool32 supportsHandTrackingMesh;
    uint maxHandMeshIndexCount;
    uint maxHandMeshVertexCount;
}

struct XrHandMeshSpaceCreateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrHandPoseTypeMSFT handPoseType;
    XrPosef poseInHandMeshSpace;
}

struct XrHandMeshUpdateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrTime time;
    XrHandPoseTypeMSFT handPoseType;
}

struct XrHandMeshIndexBufferMSFT
{
    uint indexBufferKey;
    uint indexCapacityInput;
    uint indexCountOutput;
    uint* indices;
}

struct XrHandMeshVertexMSFT
{
    XrVector3f position;
    XrVector3f normal;
}

struct XrHandMeshVertexBufferMSFT
{
    XrTime vertexUpdateTime;
    uint vertexCapacityInput;
    uint vertexCountOutput;
    XrHandMeshVertexMSFT* vertices;
}

struct XrHandMeshMSFT
{
    XrStructureType type;
    void* next;
    XrBool32 isActive;
    XrBool32 indexBufferChanged;
    XrBool32 vertexBufferChanged;
    XrHandMeshIndexBufferMSFT indexBuffer;
    XrHandMeshVertexBufferMSFT vertexBuffer;
}

// XrHandPoseTypeInfoMSFT extends XrHandTrackerCreateInfoEXT
struct XrHandPoseTypeInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrHandPoseTypeMSFT handPoseType;
}

alias PFN_xrCreateHandMeshSpaceMSFT = XrResult function (XrHandTrackerEXT handTracker, const(XrHandMeshSpaceCreateInfoMSFT)* createInfo, XrSpace* space);
alias PFN_xrUpdateHandMeshMSFT = XrResult function (XrHandTrackerEXT handTracker, const(XrHandMeshUpdateInfoMSFT)* updateInfo, XrHandMeshMSFT* handMesh);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_MSFT_secondary_view_configuration = 1;
enum XR_MSFT_secondary_view_configuration_SPEC_VERSION = 1;
enum XR_MSFT_SECONDARY_VIEW_CONFIGURATION_EXTENSION_NAME = "XR_MSFT_secondary_view_configuration";
// XrSecondaryViewConfigurationSessionBeginInfoMSFT extends XrSessionBeginInfo
struct XrSecondaryViewConfigurationSessionBeginInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    uint viewConfigurationCount;
    const(XrViewConfigurationType)* enabledViewConfigurationTypes;
}

struct XrSecondaryViewConfigurationStateMSFT
{
    XrStructureType type;
    void* next;
    XrViewConfigurationType viewConfigurationType;
    XrBool32 active;
}

// XrSecondaryViewConfigurationFrameStateMSFT extends XrFrameState
struct XrSecondaryViewConfigurationFrameStateMSFT
{
    XrStructureType type;
    void* next;
    uint viewConfigurationCount;
    XrSecondaryViewConfigurationStateMSFT* viewConfigurationStates;
}

struct XrSecondaryViewConfigurationLayerInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrViewConfigurationType viewConfigurationType;
    XrEnvironmentBlendMode environmentBlendMode;
    uint layerCount;
    const(XrCompositionLayerBaseHeader*)* layers;
}

// XrSecondaryViewConfigurationFrameEndInfoMSFT extends XrFrameEndInfo
struct XrSecondaryViewConfigurationFrameEndInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    uint viewConfigurationCount;
    const(XrSecondaryViewConfigurationLayerInfoMSFT)* viewConfigurationLayersInfo;
}

// XrSecondaryViewConfigurationSwapchainCreateInfoMSFT extends XrSwapchainCreateInfo
struct XrSecondaryViewConfigurationSwapchainCreateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrViewConfigurationType viewConfigurationType;
}

enum XR_MSFT_first_person_observer = 1;
enum XR_MSFT_first_person_observer_SPEC_VERSION = 1;
enum XR_MSFT_FIRST_PERSON_OBSERVER_EXTENSION_NAME = "XR_MSFT_first_person_observer";

enum XR_MSFT_controller_model = 1;

enum XR_NULL_CONTROLLER_MODEL_KEY_MSFT = 0;

alias XrControllerModelKeyMSFT = ulong;
enum XR_MSFT_controller_model_SPEC_VERSION = 2;
enum XR_MSFT_CONTROLLER_MODEL_EXTENSION_NAME = "XR_MSFT_controller_model";
enum XR_MAX_CONTROLLER_MODEL_NODE_NAME_SIZE_MSFT = 64;

struct XrControllerModelKeyStateMSFT
{
    XrStructureType type;
    void* next;
    XrControllerModelKeyMSFT modelKey;
}

struct XrControllerModelNodePropertiesMSFT
{
    XrStructureType type;
    void* next;
    char[XR_MAX_CONTROLLER_MODEL_NODE_NAME_SIZE_MSFT] parentNodeName;
    char[XR_MAX_CONTROLLER_MODEL_NODE_NAME_SIZE_MSFT] nodeName;
}

struct XrControllerModelPropertiesMSFT
{
    XrStructureType type;
    void* next;
    uint nodeCapacityInput;
    uint nodeCountOutput;
    XrControllerModelNodePropertiesMSFT* nodeProperties;
}

struct XrControllerModelNodeStateMSFT
{
    XrStructureType type;
    void* next;
    XrPosef nodePose;
}

struct XrControllerModelStateMSFT
{
    XrStructureType type;
    void* next;
    uint nodeCapacityInput;
    uint nodeCountOutput;
    XrControllerModelNodeStateMSFT* nodeStates;
}

alias PFN_xrGetControllerModelKeyMSFT = XrResult function (XrSession session, XrPath topLevelUserPath, XrControllerModelKeyStateMSFT* controllerModelKeyState);
alias PFN_xrLoadControllerModelMSFT = XrResult function (XrSession session, XrControllerModelKeyMSFT modelKey, uint bufferCapacityInput, uint* bufferCountOutput, ubyte* buffer);
alias PFN_xrGetControllerModelPropertiesMSFT = XrResult function (XrSession session, XrControllerModelKeyMSFT modelKey, XrControllerModelPropertiesMSFT* properties);
alias PFN_xrGetControllerModelStateMSFT = XrResult function (XrSession session, XrControllerModelKeyMSFT modelKey, XrControllerModelStateMSFT* state);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_EXT_win32_appcontainer_compatible = 1;
enum XR_EXT_win32_appcontainer_compatible_SPEC_VERSION = 1;
enum XR_EXT_WIN32_APPCONTAINER_COMPATIBLE_EXTENSION_NAME = "XR_EXT_win32_appcontainer_compatible";

enum XR_EPIC_view_configuration_fov = 1;
enum XR_EPIC_view_configuration_fov_SPEC_VERSION = 2;
enum XR_EPIC_VIEW_CONFIGURATION_FOV_EXTENSION_NAME = "XR_EPIC_view_configuration_fov";
// XrViewConfigurationViewFovEPIC extends XrViewConfigurationView
struct XrViewConfigurationViewFovEPIC
{
    XrStructureType type;
    const(void)* next;
    XrFovf recommendedFov;
    XrFovf maxMutableFov;
}

enum XR_MSFT_composition_layer_reprojection = 1;
enum XR_MSFT_composition_layer_reprojection_SPEC_VERSION = 1;
enum XR_MSFT_COMPOSITION_LAYER_REPROJECTION_EXTENSION_NAME = "XR_MSFT_composition_layer_reprojection";

enum XrReprojectionModeMSFT
{
    XR_REPROJECTION_MODE_DEPTH_MSFT = 1,
    XR_REPROJECTION_MODE_PLANAR_FROM_DEPTH_MSFT = 2,
    XR_REPROJECTION_MODE_PLANAR_MANUAL_MSFT = 3,
    XR_REPROJECTION_MODE_ORIENTATION_ONLY_MSFT = 4,
    XR_REPROJECTION_MODE_MAX_ENUM_MSFT = 0x7FFFFFFF
}

// XrCompositionLayerReprojectionInfoMSFT extends XrCompositionLayerProjection
struct XrCompositionLayerReprojectionInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrReprojectionModeMSFT reprojectionMode;
}

// XrCompositionLayerReprojectionPlaneOverrideMSFT extends XrCompositionLayerProjection
struct XrCompositionLayerReprojectionPlaneOverrideMSFT
{
    XrStructureType type;
    const(void)* next;
    XrVector3f position;
    XrVector3f normal;
    XrVector3f velocity;
}

alias PFN_xrEnumerateReprojectionModesMSFT = XrResult function (XrInstance instance, XrSystemId systemId, XrViewConfigurationType viewConfigurationType, uint modeCapacityInput, uint* modeCountOutput, XrReprojectionModeMSFT* modes);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_HUAWEI_controller_interaction = 1;
enum XR_HUAWEI_controller_interaction_SPEC_VERSION = 1;
enum XR_HUAWEI_CONTROLLER_INTERACTION_EXTENSION_NAME = "XR_HUAWEI_controller_interaction";

enum XR_FB_swapchain_update_state = 1;
enum XR_FB_swapchain_update_state_SPEC_VERSION = 3;
enum XR_FB_SWAPCHAIN_UPDATE_STATE_EXTENSION_NAME = "XR_FB_swapchain_update_state";

struct XrSwapchainStateBaseHeaderFB
{
    XrStructureType type;
    void* next;
}

alias PFN_xrUpdateSwapchainFB = XrResult function (XrSwapchain swapchain, const(XrSwapchainStateBaseHeaderFB)* state);
alias PFN_xrGetSwapchainStateFB = XrResult function (XrSwapchain swapchain, XrSwapchainStateBaseHeaderFB* state);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_composition_layer_secure_content = 1;
enum XR_FB_composition_layer_secure_content_SPEC_VERSION = 1;
enum XR_FB_COMPOSITION_LAYER_SECURE_CONTENT_EXTENSION_NAME = "XR_FB_composition_layer_secure_content";
alias XrCompositionLayerSecureContentFlagsFB = ulong;

// Flag bits for XrCompositionLayerSecureContentFlagsFB
extern __gshared const XrCompositionLayerSecureContentFlagsFB XR_COMPOSITION_LAYER_SECURE_CONTENT_EXCLUDE_LAYER_BIT_FB;
extern __gshared const XrCompositionLayerSecureContentFlagsFB XR_COMPOSITION_LAYER_SECURE_CONTENT_REPLACE_LAYER_BIT_FB;

// XrCompositionLayerSecureContentFB extends XrCompositionLayerBaseHeader
struct XrCompositionLayerSecureContentFB
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerSecureContentFlagsFB flags;
}

enum XR_VALVE_analog_threshold = 1;
enum XR_VALVE_analog_threshold_SPEC_VERSION = 2;
enum XR_VALVE_ANALOG_THRESHOLD_EXTENSION_NAME = "XR_VALVE_analog_threshold";

struct XrInteractionProfileAnalogThresholdVALVE
{
    XrStructureType type;
    const(void)* next;
    XrAction action;
    XrPath binding;
    float onThreshold;
    float offThreshold;
    const(XrHapticBaseHeader)* onHaptic;
    const(XrHapticBaseHeader)* offHaptic;
}

enum XR_EXT_hand_joints_motion_range = 1;
enum XR_EXT_hand_joints_motion_range_SPEC_VERSION = 1;
enum XR_EXT_HAND_JOINTS_MOTION_RANGE_EXTENSION_NAME = "XR_EXT_hand_joints_motion_range";

enum XrHandJointsMotionRangeEXT
{
    XR_HAND_JOINTS_MOTION_RANGE_UNOBSTRUCTED_EXT = 1,
    XR_HAND_JOINTS_MOTION_RANGE_CONFORMING_TO_CONTROLLER_EXT = 2,
    XR_HAND_JOINTS_MOTION_RANGE_MAX_ENUM_EXT = 0x7FFFFFFF
}

// XrHandJointsMotionRangeInfoEXT extends XrHandJointsLocateInfoEXT
struct XrHandJointsMotionRangeInfoEXT
{
    XrStructureType type;
    const(void)* next;
    XrHandJointsMotionRangeEXT handJointsMotionRange;
}

enum XR_EXT_samsung_odyssey_controller = 1;
enum XR_EXT_samsung_odyssey_controller_SPEC_VERSION = 1;
enum XR_EXT_SAMSUNG_ODYSSEY_CONTROLLER_EXTENSION_NAME = "XR_EXT_samsung_odyssey_controller";

enum XR_EXT_hp_mixed_reality_controller = 1;
enum XR_EXT_hp_mixed_reality_controller_SPEC_VERSION = 1;
enum XR_EXT_HP_MIXED_REALITY_CONTROLLER_EXTENSION_NAME = "XR_EXT_hp_mixed_reality_controller";

enum XR_MND_swapchain_usage_input_attachment_bit = 1;
enum XR_MND_swapchain_usage_input_attachment_bit_SPEC_VERSION = 2;
enum XR_MND_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_EXTENSION_NAME = "XR_MND_swapchain_usage_input_attachment_bit";

enum XR_MSFT_scene_understanding = 1;

struct XrSceneObserverMSFT_T;
alias XrSceneObserverMSFT = XrSceneObserverMSFT_T*;

struct XrSceneMSFT_T;
alias XrSceneMSFT = XrSceneMSFT_T*;

enum XR_MSFT_scene_understanding_SPEC_VERSION = 1;
enum XR_MSFT_SCENE_UNDERSTANDING_EXTENSION_NAME = "XR_MSFT_scene_understanding";

enum XrSceneComputeFeatureMSFT
{
    XR_SCENE_COMPUTE_FEATURE_PLANE_MSFT = 1,
    XR_SCENE_COMPUTE_FEATURE_PLANE_MESH_MSFT = 2,
    XR_SCENE_COMPUTE_FEATURE_VISUAL_MESH_MSFT = 3,
    XR_SCENE_COMPUTE_FEATURE_COLLIDER_MESH_MSFT = 4,
    XR_SCENE_COMPUTE_FEATURE_SERIALIZE_SCENE_MSFT = 1000098000,
    XR_SCENE_COMPUTE_FEATURE_MAX_ENUM_MSFT = 0x7FFFFFFF
}

enum XrSceneComputeConsistencyMSFT
{
    XR_SCENE_COMPUTE_CONSISTENCY_SNAPSHOT_COMPLETE_MSFT = 1,
    XR_SCENE_COMPUTE_CONSISTENCY_SNAPSHOT_INCOMPLETE_FAST_MSFT = 2,
    XR_SCENE_COMPUTE_CONSISTENCY_OCCLUSION_OPTIMIZED_MSFT = 3,
    XR_SCENE_COMPUTE_CONSISTENCY_MAX_ENUM_MSFT = 0x7FFFFFFF
}

enum XrMeshComputeLodMSFT
{
    XR_MESH_COMPUTE_LOD_COARSE_MSFT = 1,
    XR_MESH_COMPUTE_LOD_MEDIUM_MSFT = 2,
    XR_MESH_COMPUTE_LOD_FINE_MSFT = 3,
    XR_MESH_COMPUTE_LOD_UNLIMITED_MSFT = 4,
    XR_MESH_COMPUTE_LOD_MAX_ENUM_MSFT = 0x7FFFFFFF
}

enum XrSceneComponentTypeMSFT
{
    XR_SCENE_COMPONENT_TYPE_INVALID_MSFT = -1,
    XR_SCENE_COMPONENT_TYPE_OBJECT_MSFT = 1,
    XR_SCENE_COMPONENT_TYPE_PLANE_MSFT = 2,
    XR_SCENE_COMPONENT_TYPE_VISUAL_MESH_MSFT = 3,
    XR_SCENE_COMPONENT_TYPE_COLLIDER_MESH_MSFT = 4,
    XR_SCENE_COMPONENT_TYPE_SERIALIZED_SCENE_FRAGMENT_MSFT = 1000098000,
    XR_SCENE_COMPONENT_TYPE_MAX_ENUM_MSFT = 0x7FFFFFFF
}

enum XrSceneObjectTypeMSFT
{
    XR_SCENE_OBJECT_TYPE_UNCATEGORIZED_MSFT = -1,
    XR_SCENE_OBJECT_TYPE_BACKGROUND_MSFT = 1,
    XR_SCENE_OBJECT_TYPE_WALL_MSFT = 2,
    XR_SCENE_OBJECT_TYPE_FLOOR_MSFT = 3,
    XR_SCENE_OBJECT_TYPE_CEILING_MSFT = 4,
    XR_SCENE_OBJECT_TYPE_PLATFORM_MSFT = 5,
    XR_SCENE_OBJECT_TYPE_INFERRED_MSFT = 6,
    XR_SCENE_OBJECT_TYPE_MAX_ENUM_MSFT = 0x7FFFFFFF
}

enum XrScenePlaneAlignmentTypeMSFT
{
    XR_SCENE_PLANE_ALIGNMENT_TYPE_NON_ORTHOGONAL_MSFT = 0,
    XR_SCENE_PLANE_ALIGNMENT_TYPE_HORIZONTAL_MSFT = 1,
    XR_SCENE_PLANE_ALIGNMENT_TYPE_VERTICAL_MSFT = 2,
    XR_SCENE_PLANE_ALIGNMENT_TYPE_MAX_ENUM_MSFT = 0x7FFFFFFF
}

enum XrSceneComputeStateMSFT
{
    XR_SCENE_COMPUTE_STATE_NONE_MSFT = 0,
    XR_SCENE_COMPUTE_STATE_UPDATING_MSFT = 1,
    XR_SCENE_COMPUTE_STATE_COMPLETED_MSFT = 2,
    XR_SCENE_COMPUTE_STATE_COMPLETED_WITH_ERROR_MSFT = 3,
    XR_SCENE_COMPUTE_STATE_MAX_ENUM_MSFT = 0x7FFFFFFF
}

struct XrUuidMSFT
{
    ubyte[16] bytes;
}

struct XrSceneObserverCreateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
}

struct XrSceneCreateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
}

struct XrSceneSphereBoundMSFT
{
    XrVector3f center;
    float radius;
}

struct XrSceneOrientedBoxBoundMSFT
{
    XrPosef pose;
    XrVector3f extents;
}

struct XrSceneFrustumBoundMSFT
{
    XrPosef pose;
    XrFovf fov;
    float farDistance;
}

struct XrSceneBoundsMSFT
{
    XrSpace space;
    XrTime time;
    uint sphereCount;
    const(XrSceneSphereBoundMSFT)* spheres;
    uint boxCount;
    const(XrSceneOrientedBoxBoundMSFT)* boxes;
    uint frustumCount;
    const(XrSceneFrustumBoundMSFT)* frustums;
}

struct XrNewSceneComputeInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    uint requestedFeatureCount;
    const(XrSceneComputeFeatureMSFT)* requestedFeatures;
    XrSceneComputeConsistencyMSFT consistency;
    XrSceneBoundsMSFT bounds;
}

// XrVisualMeshComputeLodInfoMSFT extends XrNewSceneComputeInfoMSFT
struct XrVisualMeshComputeLodInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrMeshComputeLodMSFT lod;
}

struct XrSceneComponentMSFT
{
    XrSceneComponentTypeMSFT componentType;
    XrUuidMSFT id;
    XrUuidMSFT parentId;
    XrTime updateTime;
}

struct XrSceneComponentsMSFT
{
    XrStructureType type;
    void* next;
    uint componentCapacityInput;
    uint componentCountOutput;
    XrSceneComponentMSFT* components;
}

struct XrSceneComponentsGetInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrSceneComponentTypeMSFT componentType;
}

struct XrSceneComponentLocationMSFT
{
    XrSpaceLocationFlags flags;
    XrPosef pose;
}

struct XrSceneComponentLocationsMSFT
{
    XrStructureType type;
    void* next;
    uint locationCount;
    XrSceneComponentLocationMSFT* locations;
}

struct XrSceneComponentsLocateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrSpace baseSpace;
    XrTime time;
    uint componentIdCount;
    const(XrUuidMSFT)* componentIds;
}

struct XrSceneObjectMSFT
{
    XrSceneObjectTypeMSFT objectType;
}

// XrSceneObjectsMSFT extends XrSceneComponentsMSFT
struct XrSceneObjectsMSFT
{
    XrStructureType type;
    void* next;
    uint sceneObjectCount;
    XrSceneObjectMSFT* sceneObjects;
}

// XrSceneComponentParentFilterInfoMSFT extends XrSceneComponentsGetInfoMSFT
struct XrSceneComponentParentFilterInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrUuidMSFT parentId;
}

// XrSceneObjectTypesFilterInfoMSFT extends XrSceneComponentsGetInfoMSFT
struct XrSceneObjectTypesFilterInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    uint objectTypeCount;
    const(XrSceneObjectTypeMSFT)* objectTypes;
}

struct XrScenePlaneMSFT
{
    XrScenePlaneAlignmentTypeMSFT alignment;
    XrExtent2Df size;
    ulong meshBufferId;
    XrBool32 supportsIndicesUint16;
}

// XrScenePlanesMSFT extends XrSceneComponentsMSFT
struct XrScenePlanesMSFT
{
    XrStructureType type;
    void* next;
    uint scenePlaneCount;
    XrScenePlaneMSFT* scenePlanes;
}

// XrScenePlaneAlignmentFilterInfoMSFT extends XrSceneComponentsGetInfoMSFT
struct XrScenePlaneAlignmentFilterInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    uint alignmentCount;
    const(XrScenePlaneAlignmentTypeMSFT)* alignments;
}

struct XrSceneMeshMSFT
{
    ulong meshBufferId;
    XrBool32 supportsIndicesUint16;
}

// XrSceneMeshesMSFT extends XrSceneComponentsMSFT
struct XrSceneMeshesMSFT
{
    XrStructureType type;
    void* next;
    uint sceneMeshCount;
    XrSceneMeshMSFT* sceneMeshes;
}

struct XrSceneMeshBuffersGetInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    ulong meshBufferId;
}

struct XrSceneMeshBuffersMSFT
{
    XrStructureType type;
    void* next;
}

struct XrSceneMeshVertexBufferMSFT
{
    XrStructureType type;
    void* next;
    uint vertexCapacityInput;
    uint vertexCountOutput;
    XrVector3f* vertices;
}

struct XrSceneMeshIndicesUint32MSFT
{
    XrStructureType type;
    void* next;
    uint indexCapacityInput;
    uint indexCountOutput;
    uint* indices;
}

struct XrSceneMeshIndicesUint16MSFT
{
    XrStructureType type;
    void* next;
    uint indexCapacityInput;
    uint indexCountOutput;
    ushort* indices;
}

alias PFN_xrEnumerateSceneComputeFeaturesMSFT = XrResult function (XrInstance instance, XrSystemId systemId, uint featureCapacityInput, uint* featureCountOutput, XrSceneComputeFeatureMSFT* features);
alias PFN_xrCreateSceneObserverMSFT = XrResult function (XrSession session, const(XrSceneObserverCreateInfoMSFT)* createInfo, XrSceneObserverMSFT* sceneObserver);
alias PFN_xrDestroySceneObserverMSFT = XrResult function (XrSceneObserverMSFT sceneObserver);
alias PFN_xrCreateSceneMSFT = XrResult function (XrSceneObserverMSFT sceneObserver, const(XrSceneCreateInfoMSFT)* createInfo, XrSceneMSFT* scene);
alias PFN_xrDestroySceneMSFT = XrResult function (XrSceneMSFT scene);
alias PFN_xrComputeNewSceneMSFT = XrResult function (XrSceneObserverMSFT sceneObserver, const(XrNewSceneComputeInfoMSFT)* computeInfo);
alias PFN_xrGetSceneComputeStateMSFT = XrResult function (XrSceneObserverMSFT sceneObserver, XrSceneComputeStateMSFT* state);
alias PFN_xrGetSceneComponentsMSFT = XrResult function (XrSceneMSFT scene, const(XrSceneComponentsGetInfoMSFT)* getInfo, XrSceneComponentsMSFT* components);
alias PFN_xrLocateSceneComponentsMSFT = XrResult function (XrSceneMSFT scene, const(XrSceneComponentsLocateInfoMSFT)* locateInfo, XrSceneComponentLocationsMSFT* locations);
alias PFN_xrGetSceneMeshBuffersMSFT = XrResult function (XrSceneMSFT scene, const(XrSceneMeshBuffersGetInfoMSFT)* getInfo, XrSceneMeshBuffersMSFT* buffers);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_MSFT_scene_understanding_serialization = 1;
enum XR_MSFT_scene_understanding_serialization_SPEC_VERSION = 1;
enum XR_MSFT_SCENE_UNDERSTANDING_SERIALIZATION_EXTENSION_NAME = "XR_MSFT_scene_understanding_serialization";

struct XrSerializedSceneFragmentDataGetInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrUuidMSFT sceneFragmentId;
}

struct XrDeserializeSceneFragmentMSFT
{
    uint bufferSize;
    const(ubyte)* buffer;
}

struct XrSceneDeserializeInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    uint fragmentCount;
    const(XrDeserializeSceneFragmentMSFT)* fragments;
}

alias PFN_xrDeserializeSceneMSFT = XrResult function (XrSceneObserverMSFT sceneObserver, const(XrSceneDeserializeInfoMSFT)* deserializeInfo);
alias PFN_xrGetSerializedSceneFragmentDataMSFT = XrResult function (XrSceneMSFT scene, const(XrSerializedSceneFragmentDataGetInfoMSFT)* getInfo, uint countInput, uint* readOutput, ubyte* buffer);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_display_refresh_rate = 1;
enum XR_FB_display_refresh_rate_SPEC_VERSION = 1;
enum XR_FB_DISPLAY_REFRESH_RATE_EXTENSION_NAME = "XR_FB_display_refresh_rate";

struct XrEventDataDisplayRefreshRateChangedFB
{
    XrStructureType type;
    const(void)* next;
    float fromDisplayRefreshRate;
    float toDisplayRefreshRate;
}

alias PFN_xrEnumerateDisplayRefreshRatesFB = XrResult function (XrSession session, uint displayRefreshRateCapacityInput, uint* displayRefreshRateCountOutput, float* displayRefreshRates);
alias PFN_xrGetDisplayRefreshRateFB = XrResult function (XrSession session, float* displayRefreshRate);
alias PFN_xrRequestDisplayRefreshRateFB = XrResult function (XrSession session, float displayRefreshRate);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_HTC_vive_cosmos_controller_interaction = 1;
enum XR_HTC_vive_cosmos_controller_interaction_SPEC_VERSION = 1;
enum XR_HTC_VIVE_COSMOS_CONTROLLER_INTERACTION_EXTENSION_NAME = "XR_HTC_vive_cosmos_controller_interaction";

enum XR_HTCX_vive_tracker_interaction = 1;
enum XR_HTCX_vive_tracker_interaction_SPEC_VERSION = 1;
enum XR_HTCX_VIVE_TRACKER_INTERACTION_EXTENSION_NAME = "XR_HTCX_vive_tracker_interaction";

struct XrViveTrackerPathsHTCX
{
    XrStructureType type;
    void* next;
    XrPath persistentPath;
    XrPath rolePath;
}

struct XrEventDataViveTrackerConnectedHTCX
{
    XrStructureType type;
    const(void)* next;
    XrViveTrackerPathsHTCX* paths;
}

alias PFN_xrEnumerateViveTrackerPathsHTCX = XrResult function (XrInstance instance, uint pathCapacityInput, uint* pathCountOutput, XrViveTrackerPathsHTCX* paths);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_HTC_facial_tracking = 1;

enum XR_FACIAL_EXPRESSION_EYE_COUNT_HTC = 14;

enum XR_FACIAL_EXPRESSION_LIP_COUNT_HTC = 37;

struct XrFacialTrackerHTC_T;
alias XrFacialTrackerHTC = XrFacialTrackerHTC_T*;
enum XR_HTC_facial_tracking_SPEC_VERSION = 1;
enum XR_HTC_FACIAL_TRACKING_EXTENSION_NAME = "XR_HTC_facial_tracking";

enum XrEyeExpressionHTC
{
    XR_EYE_EXPRESSION_LEFT_BLINK_HTC = 0,
    XR_EYE_EXPRESSION_LEFT_WIDE_HTC = 1,
    XR_EYE_EXPRESSION_RIGHT_BLINK_HTC = 2,
    XR_EYE_EXPRESSION_RIGHT_WIDE_HTC = 3,
    XR_EYE_EXPRESSION_LEFT_SQUEEZE_HTC = 4,
    XR_EYE_EXPRESSION_RIGHT_SQUEEZE_HTC = 5,
    XR_EYE_EXPRESSION_LEFT_DOWN_HTC = 6,
    XR_EYE_EXPRESSION_RIGHT_DOWN_HTC = 7,
    XR_EYE_EXPRESSION_LEFT_OUT_HTC = 8,
    XR_EYE_EXPRESSION_RIGHT_IN_HTC = 9,
    XR_EYE_EXPRESSION_LEFT_IN_HTC = 10,
    XR_EYE_EXPRESSION_RIGHT_OUT_HTC = 11,
    XR_EYE_EXPRESSION_LEFT_UP_HTC = 12,
    XR_EYE_EXPRESSION_RIGHT_UP_HTC = 13,
    XR_EYE_EXPRESSION_MAX_ENUM_HTC = 0x7FFFFFFF
}

enum XrLipExpressionHTC
{
    XR_LIP_EXPRESSION_JAW_RIGHT_HTC = 0,
    XR_LIP_EXPRESSION_JAW_LEFT_HTC = 1,
    XR_LIP_EXPRESSION_JAW_FORWARD_HTC = 2,
    XR_LIP_EXPRESSION_JAW_OPEN_HTC = 3,
    XR_LIP_EXPRESSION_MOUTH_APE_SHAPE_HTC = 4,
    XR_LIP_EXPRESSION_MOUTH_UPPER_RIGHT_HTC = 5,
    XR_LIP_EXPRESSION_MOUTH_UPPER_LEFT_HTC = 6,
    XR_LIP_EXPRESSION_MOUTH_LOWER_RIGHT_HTC = 7,
    XR_LIP_EXPRESSION_MOUTH_LOWER_LEFT_HTC = 8,
    XR_LIP_EXPRESSION_MOUTH_UPPER_OVERTURN_HTC = 9,
    XR_LIP_EXPRESSION_MOUTH_LOWER_OVERTURN_HTC = 10,
    XR_LIP_EXPRESSION_MOUTH_POUT_HTC = 11,
    XR_LIP_EXPRESSION_MOUTH_SMILE_RIGHT_HTC = 12,
    XR_LIP_EXPRESSION_MOUTH_SMILE_LEFT_HTC = 13,
    XR_LIP_EXPRESSION_MOUTH_SAD_RIGHT_HTC = 14,
    XR_LIP_EXPRESSION_MOUTH_SAD_LEFT_HTC = 15,
    XR_LIP_EXPRESSION_CHEEK_PUFF_RIGHT_HTC = 16,
    XR_LIP_EXPRESSION_CHEEK_PUFF_LEFT_HTC = 17,
    XR_LIP_EXPRESSION_CHEEK_SUCK_HTC = 18,
    XR_LIP_EXPRESSION_MOUTH_UPPER_UPRIGHT_HTC = 19,
    XR_LIP_EXPRESSION_MOUTH_UPPER_UPLEFT_HTC = 20,
    XR_LIP_EXPRESSION_MOUTH_LOWER_DOWNRIGHT_HTC = 21,
    XR_LIP_EXPRESSION_MOUTH_LOWER_DOWNLEFT_HTC = 22,
    XR_LIP_EXPRESSION_MOUTH_UPPER_INSIDE_HTC = 23,
    XR_LIP_EXPRESSION_MOUTH_LOWER_INSIDE_HTC = 24,
    XR_LIP_EXPRESSION_MOUTH_LOWER_OVERLAY_HTC = 25,
    XR_LIP_EXPRESSION_TONGUE_LONGSTEP1_HTC = 26,
    XR_LIP_EXPRESSION_TONGUE_LEFT_HTC = 27,
    XR_LIP_EXPRESSION_TONGUE_RIGHT_HTC = 28,
    XR_LIP_EXPRESSION_TONGUE_UP_HTC = 29,
    XR_LIP_EXPRESSION_TONGUE_DOWN_HTC = 30,
    XR_LIP_EXPRESSION_TONGUE_ROLL_HTC = 31,
    XR_LIP_EXPRESSION_TONGUE_LONGSTEP2_HTC = 32,
    XR_LIP_EXPRESSION_TONGUE_UPRIGHT_MORPH_HTC = 33,
    XR_LIP_EXPRESSION_TONGUE_UPLEFT_MORPH_HTC = 34,
    XR_LIP_EXPRESSION_TONGUE_DOWNRIGHT_MORPH_HTC = 35,
    XR_LIP_EXPRESSION_TONGUE_DOWNLEFT_MORPH_HTC = 36,
    XR_LIP_EXPRESSION_MAX_ENUM_HTC = 0x7FFFFFFF
}

enum XrFacialTrackingTypeHTC
{
    XR_FACIAL_TRACKING_TYPE_EYE_DEFAULT_HTC = 1,
    XR_FACIAL_TRACKING_TYPE_LIP_DEFAULT_HTC = 2,
    XR_FACIAL_TRACKING_TYPE_MAX_ENUM_HTC = 0x7FFFFFFF
}

// XrSystemFacialTrackingPropertiesHTC extends XrSystemProperties
struct XrSystemFacialTrackingPropertiesHTC
{
    XrStructureType type;
    void* next;
    XrBool32 supportEyeFacialTracking;
    XrBool32 supportLipFacialTracking;
}

struct XrFacialExpressionsHTC
{
    XrStructureType type;
    const(void)* next;
    XrBool32 isActive;
    XrTime sampleTime;
    uint expressionCount;
    float* expressionWeightings;
}

struct XrFacialTrackerCreateInfoHTC
{
    XrStructureType type;
    const(void)* next;
    XrFacialTrackingTypeHTC facialTrackingType;
}

alias PFN_xrCreateFacialTrackerHTC = XrResult function (XrSession session, const(XrFacialTrackerCreateInfoHTC)* createInfo, XrFacialTrackerHTC* facialTracker);
alias PFN_xrDestroyFacialTrackerHTC = XrResult function (XrFacialTrackerHTC facialTracker);
alias PFN_xrGetFacialExpressionsHTC = XrResult function (XrFacialTrackerHTC facialTracker, XrFacialExpressionsHTC* facialExpressions);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_HTC_vive_focus3_controller_interaction = 1;
enum XR_HTC_vive_focus3_controller_interaction_SPEC_VERSION = 1;
enum XR_HTC_VIVE_FOCUS3_CONTROLLER_INTERACTION_EXTENSION_NAME = "XR_HTC_vive_focus3_controller_interaction";

enum XR_FB_color_space = 1;
enum XR_FB_color_space_SPEC_VERSION = 2;
enum XR_FB_COLOR_SPACE_EXTENSION_NAME = "XR_FB_color_space";

enum XrColorSpaceFB
{
    XR_COLOR_SPACE_UNMANAGED_FB = 0,
    XR_COLOR_SPACE_REC2020_FB = 1,
    XR_COLOR_SPACE_REC709_FB = 2,
    XR_COLOR_SPACE_RIFT_CV1_FB = 3,
    XR_COLOR_SPACE_RIFT_S_FB = 4,
    XR_COLOR_SPACE_QUEST_FB = 5,
    XR_COLOR_SPACE_P3_FB = 6,
    XR_COLOR_SPACE_ADOBE_RGB_FB = 7,
    XR_COLOR_SPACE_MAX_ENUM_FB = 0x7FFFFFFF
}

// XrSystemColorSpacePropertiesFB extends XrSystemProperties
struct XrSystemColorSpacePropertiesFB
{
    XrStructureType type;
    void* next;
    XrColorSpaceFB colorSpace;
}

alias PFN_xrEnumerateColorSpacesFB = XrResult function (XrSession session, uint colorSpaceCapacityInput, uint* colorSpaceCountOutput, XrColorSpaceFB* colorSpaces);
alias PFN_xrSetColorSpaceFB = XrResult function (XrSession session, const XrColorSpaceFB colorspace);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_hand_tracking_mesh = 1;
enum XR_FB_hand_tracking_mesh_SPEC_VERSION = 1;
enum XR_FB_HAND_TRACKING_MESH_EXTENSION_NAME = "XR_FB_hand_tracking_mesh";

struct XrVector4sFB
{
    short x;
    short y;
    short z;
    short w;
}

struct XrHandTrackingMeshFB
{
    XrStructureType type;
    void* next;
    uint jointCapacityInput;
    uint jointCountOutput;
    XrPosef* jointBindPoses;
    float* jointRadii;
    XrHandJointEXT* jointParents;
    uint vertexCapacityInput;
    uint vertexCountOutput;
    XrVector3f* vertexPositions;
    XrVector3f* vertexNormals;
    XrVector2f* vertexUVs;
    XrVector4sFB* vertexBlendIndices;
    XrVector4f* vertexBlendWeights;
    uint indexCapacityInput;
    uint indexCountOutput;
    short* indices;
}

// XrHandTrackingScaleFB extends XrHandJointsLocateInfoEXT
struct XrHandTrackingScaleFB
{
    XrStructureType type;
    void* next;
    float sensorOutput;
    float currentOutput;
    XrBool32 overrideHandScale;
    float overrideValueInput;
}

alias PFN_xrGetHandMeshFB = XrResult function (XrHandTrackerEXT handTracker, XrHandTrackingMeshFB* mesh);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_hand_tracking_aim = 1;
enum XR_FB_hand_tracking_aim_SPEC_VERSION = 1;
enum XR_FB_HAND_TRACKING_AIM_EXTENSION_NAME = "XR_FB_hand_tracking_aim";
alias XrHandTrackingAimFlagsFB = ulong;

// Flag bits for XrHandTrackingAimFlagsFB
extern __gshared const XrHandTrackingAimFlagsFB XR_HAND_TRACKING_AIM_COMPUTED_BIT_FB;
extern __gshared const XrHandTrackingAimFlagsFB XR_HAND_TRACKING_AIM_VALID_BIT_FB;
extern __gshared const XrHandTrackingAimFlagsFB XR_HAND_TRACKING_AIM_INDEX_PINCHING_BIT_FB;
extern __gshared const XrHandTrackingAimFlagsFB XR_HAND_TRACKING_AIM_MIDDLE_PINCHING_BIT_FB;
extern __gshared const XrHandTrackingAimFlagsFB XR_HAND_TRACKING_AIM_RING_PINCHING_BIT_FB;
extern __gshared const XrHandTrackingAimFlagsFB XR_HAND_TRACKING_AIM_LITTLE_PINCHING_BIT_FB;
extern __gshared const XrHandTrackingAimFlagsFB XR_HAND_TRACKING_AIM_SYSTEM_GESTURE_BIT_FB;
extern __gshared const XrHandTrackingAimFlagsFB XR_HAND_TRACKING_AIM_DOMINANT_HAND_BIT_FB;
extern __gshared const XrHandTrackingAimFlagsFB XR_HAND_TRACKING_AIM_MENU_PRESSED_BIT_FB;

// XrHandTrackingAimStateFB extends XrHandJointsLocateInfoEXT
struct XrHandTrackingAimStateFB
{
    XrStructureType type;
    void* next;
    XrHandTrackingAimFlagsFB status;
    XrPosef aimPose;
    float pinchStrengthIndex;
    float pinchStrengthMiddle;
    float pinchStrengthRing;
    float pinchStrengthLittle;
}

enum XR_FB_hand_tracking_capsules = 1;
enum XR_HAND_TRACKING_CAPSULE_POINT_COUNT_FB = 2;
enum XR_FB_HAND_TRACKING_CAPSULE_POINT_COUNT = XR_HAND_TRACKING_CAPSULE_POINT_COUNT_FB;
enum XR_HAND_TRACKING_CAPSULE_COUNT_FB = 19;
enum XR_FB_HAND_TRACKING_CAPSULE_COUNT = XR_HAND_TRACKING_CAPSULE_COUNT_FB;
enum XR_FB_hand_tracking_capsules_SPEC_VERSION = 2;
enum XR_FB_HAND_TRACKING_CAPSULES_EXTENSION_NAME = "XR_FB_hand_tracking_capsules";

struct XrHandCapsuleFB
{
    XrVector3f[XR_FB_HAND_TRACKING_CAPSULE_POINT_COUNT] points;
    float radius;
    XrHandJointEXT joint;
}

// XrHandTrackingCapsulesStateFB extends XrHandJointsLocateInfoEXT
struct XrHandTrackingCapsulesStateFB
{
    XrStructureType type;
    void* next;
    XrHandCapsuleFB[XR_FB_HAND_TRACKING_CAPSULE_COUNT] capsules;
}

enum XR_FB_foveation = 1;
struct XrFoveationProfileFB_T;
alias XrFoveationProfileFB = XrFoveationProfileFB_T*;
enum XR_FB_foveation_SPEC_VERSION = 1;
enum XR_FB_FOVEATION_EXTENSION_NAME = "XR_FB_foveation";
alias XrSwapchainCreateFoveationFlagsFB = ulong;

// Flag bits for XrSwapchainCreateFoveationFlagsFB
extern __gshared const XrSwapchainCreateFoveationFlagsFB XR_SWAPCHAIN_CREATE_FOVEATION_SCALED_BIN_BIT_FB;
extern __gshared const XrSwapchainCreateFoveationFlagsFB XR_SWAPCHAIN_CREATE_FOVEATION_FRAGMENT_DENSITY_MAP_BIT_FB;

alias XrSwapchainStateFoveationFlagsFB = ulong;

// Flag bits for XrSwapchainStateFoveationFlagsFB

struct XrFoveationProfileCreateInfoFB
{
    XrStructureType type;
    void* next;
}

// XrSwapchainCreateInfoFoveationFB extends XrSwapchainCreateInfo
struct XrSwapchainCreateInfoFoveationFB
{
    XrStructureType type;
    void* next;
    XrSwapchainCreateFoveationFlagsFB flags;
}

struct XrSwapchainStateFoveationFB
{
    XrStructureType type;
    void* next;
    XrSwapchainStateFoveationFlagsFB flags;
    XrFoveationProfileFB profile;
}

alias PFN_xrCreateFoveationProfileFB = XrResult function (XrSession session, const(XrFoveationProfileCreateInfoFB)* createInfo, XrFoveationProfileFB* profile);
alias PFN_xrDestroyFoveationProfileFB = XrResult function (XrFoveationProfileFB profile);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_foveation_configuration = 1;
enum XR_FB_foveation_configuration_SPEC_VERSION = 1;
enum XR_FB_FOVEATION_CONFIGURATION_EXTENSION_NAME = "XR_FB_foveation_configuration";

enum XrFoveationLevelFB
{
    XR_FOVEATION_LEVEL_NONE_FB = 0,
    XR_FOVEATION_LEVEL_LOW_FB = 1,
    XR_FOVEATION_LEVEL_MEDIUM_FB = 2,
    XR_FOVEATION_LEVEL_HIGH_FB = 3,
    XR_FOVEATION_LEVEL_MAX_ENUM_FB = 0x7FFFFFFF
}

enum XrFoveationDynamicFB
{
    XR_FOVEATION_DYNAMIC_DISABLED_FB = 0,
    XR_FOVEATION_DYNAMIC_LEVEL_ENABLED_FB = 1,
    XR_FOVEATION_DYNAMIC_MAX_ENUM_FB = 0x7FFFFFFF
}

// XrFoveationLevelProfileCreateInfoFB extends XrFoveationProfileCreateInfoFB
struct XrFoveationLevelProfileCreateInfoFB
{
    XrStructureType type;
    void* next;
    XrFoveationLevelFB level;
    float verticalOffset;
    XrFoveationDynamicFB dynamic;
}

enum XR_FB_keyboard_tracking = 1;
enum XR_FB_keyboard_tracking_SPEC_VERSION = 1;
enum XR_FB_KEYBOARD_TRACKING_EXTENSION_NAME = "XR_FB_keyboard_tracking";
enum XR_MAX_KEYBOARD_TRACKING_NAME_SIZE_FB = 128;
alias XrKeyboardTrackingFlagsFB = ulong;

// Flag bits for XrKeyboardTrackingFlagsFB
extern __gshared const XrKeyboardTrackingFlagsFB XR_KEYBOARD_TRACKING_EXISTS_BIT_FB;
extern __gshared const XrKeyboardTrackingFlagsFB XR_KEYBOARD_TRACKING_LOCAL_BIT_FB;
extern __gshared const XrKeyboardTrackingFlagsFB XR_KEYBOARD_TRACKING_REMOTE_BIT_FB;
extern __gshared const XrKeyboardTrackingFlagsFB XR_KEYBOARD_TRACKING_CONNECTED_BIT_FB;

alias XrKeyboardTrackingQueryFlagsFB = ulong;

// Flag bits for XrKeyboardTrackingQueryFlagsFB
extern __gshared const XrKeyboardTrackingQueryFlagsFB XR_KEYBOARD_TRACKING_QUERY_LOCAL_BIT_FB;
extern __gshared const XrKeyboardTrackingQueryFlagsFB XR_KEYBOARD_TRACKING_QUERY_REMOTE_BIT_FB;

// XrSystemKeyboardTrackingPropertiesFB extends XrSystemProperties
struct XrSystemKeyboardTrackingPropertiesFB
{
    XrStructureType type;
    void* next;
    XrBool32 supportsKeyboardTracking;
}

struct XrKeyboardTrackingDescriptionFB
{
    ulong trackedKeyboardId;
    XrVector3f size;
    XrKeyboardTrackingFlagsFB flags;
    char[XR_MAX_KEYBOARD_TRACKING_NAME_SIZE_FB] name;
}

struct XrKeyboardSpaceCreateInfoFB
{
    XrStructureType type;
    void* next;
    ulong trackedKeyboardId;
}

struct XrKeyboardTrackingQueryFB
{
    XrStructureType type;
    void* next;
    XrKeyboardTrackingQueryFlagsFB flags;
}

alias PFN_xrQuerySystemTrackedKeyboardFB = XrResult function (XrSession session, const(XrKeyboardTrackingQueryFB)* queryInfo, XrKeyboardTrackingDescriptionFB* keyboard);
alias PFN_xrCreateKeyboardSpaceFB = XrResult function (XrSession session, const(XrKeyboardSpaceCreateInfoFB)* createInfo, XrSpace* keyboardSpace);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_triangle_mesh = 1;
struct XrTriangleMeshFB_T;
alias XrTriangleMeshFB = XrTriangleMeshFB_T*;
enum XR_FB_triangle_mesh_SPEC_VERSION = 1;
enum XR_FB_TRIANGLE_MESH_EXTENSION_NAME = "XR_FB_triangle_mesh";

enum XrWindingOrderFB
{
    XR_WINDING_ORDER_UNKNOWN_FB = 0,
    XR_WINDING_ORDER_CW_FB = 1,
    XR_WINDING_ORDER_CCW_FB = 2,
    XR_WINDING_ORDER_MAX_ENUM_FB = 0x7FFFFFFF
}

alias XrTriangleMeshFlagsFB = ulong;

// Flag bits for XrTriangleMeshFlagsFB
extern __gshared const XrTriangleMeshFlagsFB XR_TRIANGLE_MESH_MUTABLE_BIT_FB;

struct XrTriangleMeshCreateInfoFB
{
    XrStructureType type;
    const(void)* next;
    XrTriangleMeshFlagsFB flags;
    XrWindingOrderFB windingOrder;
    uint vertexCount;
    const(XrVector3f)* vertexBuffer;
    uint triangleCount;
    const(uint)* indexBuffer;
}

alias PFN_xrCreateTriangleMeshFB = XrResult function (XrSession session, const(XrTriangleMeshCreateInfoFB)* createInfo, XrTriangleMeshFB* outTriangleMesh);
alias PFN_xrDestroyTriangleMeshFB = XrResult function (XrTriangleMeshFB mesh);
alias PFN_xrTriangleMeshGetVertexBufferFB = XrResult function (XrTriangleMeshFB mesh, XrVector3f** outVertexBuffer);
alias PFN_xrTriangleMeshGetIndexBufferFB = XrResult function (XrTriangleMeshFB mesh, uint** outIndexBuffer);
alias PFN_xrTriangleMeshBeginUpdateFB = XrResult function (XrTriangleMeshFB mesh);
alias PFN_xrTriangleMeshEndUpdateFB = XrResult function (XrTriangleMeshFB mesh, uint vertexCount, uint triangleCount);
alias PFN_xrTriangleMeshBeginVertexBufferUpdateFB = XrResult function (XrTriangleMeshFB mesh, uint* outVertexCount);
alias PFN_xrTriangleMeshEndVertexBufferUpdateFB = XrResult function (XrTriangleMeshFB mesh);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_passthrough = 1;
struct XrPassthroughFB_T;
alias XrPassthroughFB = XrPassthroughFB_T*;
struct XrPassthroughLayerFB_T;
alias XrPassthroughLayerFB = XrPassthroughLayerFB_T*;
struct XrGeometryInstanceFB_T;
alias XrGeometryInstanceFB = XrGeometryInstanceFB_T*;
enum XR_FB_passthrough_SPEC_VERSION = 1;
enum XR_FB_PASSTHROUGH_EXTENSION_NAME = "XR_FB_passthrough";
enum XR_PASSTHROUGH_COLOR_MAP_MONO_SIZE_FB = 256;

enum XrPassthroughLayerPurposeFB
{
    XR_PASSTHROUGH_LAYER_PURPOSE_RECONSTRUCTION_FB = 0,
    XR_PASSTHROUGH_LAYER_PURPOSE_PROJECTED_FB = 1,
    XR_PASSTHROUGH_LAYER_PURPOSE_TRACKED_KEYBOARD_HANDS_FB = 1000203001,
    XR_PASSTHROUGH_LAYER_PURPOSE_MAX_ENUM_FB = 0x7FFFFFFF
}

alias XrPassthroughFlagsFB = ulong;

// Flag bits for XrPassthroughFlagsFB
extern __gshared const XrPassthroughFlagsFB XR_PASSTHROUGH_IS_RUNNING_AT_CREATION_BIT_FB;

alias XrPassthroughStateChangedFlagsFB = ulong;

// Flag bits for XrPassthroughStateChangedFlagsFB
extern __gshared const XrPassthroughStateChangedFlagsFB XR_PASSTHROUGH_STATE_CHANGED_REINIT_REQUIRED_BIT_FB;
extern __gshared const XrPassthroughStateChangedFlagsFB XR_PASSTHROUGH_STATE_CHANGED_NON_RECOVERABLE_ERROR_BIT_FB;
extern __gshared const XrPassthroughStateChangedFlagsFB XR_PASSTHROUGH_STATE_CHANGED_RECOVERABLE_ERROR_BIT_FB;
extern __gshared const XrPassthroughStateChangedFlagsFB XR_PASSTHROUGH_STATE_CHANGED_RESTORED_ERROR_BIT_FB;

// XrSystemPassthroughPropertiesFB extends XrSystemProperties
struct XrSystemPassthroughPropertiesFB
{
    XrStructureType type;
    const(void)* next;
    XrBool32 supportsPassthrough;
}

struct XrPassthroughCreateInfoFB
{
    XrStructureType type;
    const(void)* next;
    XrPassthroughFlagsFB flags;
}

struct XrPassthroughLayerCreateInfoFB
{
    XrStructureType type;
    const(void)* next;
    XrPassthroughFB passthrough;
    XrPassthroughFlagsFB flags;
    XrPassthroughLayerPurposeFB purpose;
}

// XrCompositionLayerPassthroughFB extends XrCompositionLayerBaseHeader
struct XrCompositionLayerPassthroughFB
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerFlags flags;
    XrSpace space;
    XrPassthroughLayerFB layerHandle;
}

struct XrGeometryInstanceCreateInfoFB
{
    XrStructureType type;
    const(void)* next;
    XrPassthroughLayerFB layer;
    XrTriangleMeshFB mesh;
    XrSpace baseSpace;
    XrPosef pose;
    XrVector3f scale;
}

struct XrGeometryInstanceTransformFB
{
    XrStructureType type;
    const(void)* next;
    XrSpace baseSpace;
    XrTime time;
    XrPosef pose;
    XrVector3f scale;
}

struct XrPassthroughStyleFB
{
    XrStructureType type;
    const(void)* next;
    float textureOpacityFactor;
    XrColor4f edgeColor;
}

struct XrPassthroughColorMapMonoToRgbaFB
{
    XrStructureType type;
    const(void)* next;
    XrColor4f[XR_PASSTHROUGH_COLOR_MAP_MONO_SIZE_FB] textureColorMap;
}

struct XrPassthroughColorMapMonoToMonoFB
{
    XrStructureType type;
    const(void)* next;
    ubyte[XR_PASSTHROUGH_COLOR_MAP_MONO_SIZE_FB] textureColorMap;
}

struct XrEventDataPassthroughStateChangedFB
{
    XrStructureType type;
    const(void)* next;
    XrPassthroughStateChangedFlagsFB flags;
}

alias PFN_xrCreatePassthroughFB = XrResult function (XrSession session, const(XrPassthroughCreateInfoFB)* createInfo, XrPassthroughFB* outPassthrough);
alias PFN_xrDestroyPassthroughFB = XrResult function (XrPassthroughFB passthrough);
alias PFN_xrPassthroughStartFB = XrResult function (XrPassthroughFB passthrough);
alias PFN_xrPassthroughPauseFB = XrResult function (XrPassthroughFB passthrough);
alias PFN_xrCreatePassthroughLayerFB = XrResult function (XrSession session, const(XrPassthroughLayerCreateInfoFB)* createInfo, XrPassthroughLayerFB* outLayer);
alias PFN_xrDestroyPassthroughLayerFB = XrResult function (XrPassthroughLayerFB layer);
alias PFN_xrPassthroughLayerPauseFB = XrResult function (XrPassthroughLayerFB layer);
alias PFN_xrPassthroughLayerResumeFB = XrResult function (XrPassthroughLayerFB layer);
alias PFN_xrPassthroughLayerSetStyleFB = XrResult function (XrPassthroughLayerFB layer, const(XrPassthroughStyleFB)* style);
alias PFN_xrCreateGeometryInstanceFB = XrResult function (XrSession session, const(XrGeometryInstanceCreateInfoFB)* createInfo, XrGeometryInstanceFB* outGeometryInstance);
alias PFN_xrDestroyGeometryInstanceFB = XrResult function (XrGeometryInstanceFB instance);
alias PFN_xrGeometryInstanceSetTransformFB = XrResult function (XrGeometryInstanceFB instance, const(XrGeometryInstanceTransformFB)* transformation);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_render_model = 1;

enum XR_NULL_RENDER_MODEL_KEY_FB = 0;

alias XrRenderModelKeyFB = ulong;
enum XR_FB_render_model_SPEC_VERSION = 1;
enum XR_FB_RENDER_MODEL_EXTENSION_NAME = "XR_FB_render_model";
enum XR_MAX_RENDER_MODEL_NAME_SIZE_FB = 64;
alias XrRenderModelFlagsFB = ulong;

// Flag bits for XrRenderModelFlagsFB

struct XrRenderModelPathInfoFB
{
    XrStructureType type;
    void* next;
    XrPath path;
}

struct XrRenderModelPropertiesFB
{
    XrStructureType type;
    void* next;
    uint vendorId;
    char[XR_MAX_RENDER_MODEL_NAME_SIZE_FB] modelName;
    XrRenderModelKeyFB modelKey;
    uint modelVersion;
    XrRenderModelFlagsFB flags;
}

struct XrRenderModelBufferFB
{
    XrStructureType type;
    void* next;
    uint bufferCapacityInput;
    uint bufferCountOutput;
    ubyte* buffer;
}

struct XrRenderModelLoadInfoFB
{
    XrStructureType type;
    void* next;
    XrRenderModelKeyFB modelKey;
}

// XrSystemRenderModelPropertiesFB extends XrSystemProperties
struct XrSystemRenderModelPropertiesFB
{
    XrStructureType type;
    void* next;
    XrBool32 supportsRenderModelLoading;
}

alias PFN_xrEnumerateRenderModelPathsFB = XrResult function (XrSession session, uint pathCapacityInput, uint* pathCountOutput, XrRenderModelPathInfoFB* paths);
alias PFN_xrGetRenderModelPropertiesFB = XrResult function (XrSession session, XrPath path, XrRenderModelPropertiesFB* properties);
alias PFN_xrLoadRenderModelFB = XrResult function (XrSession session, const(XrRenderModelLoadInfoFB)* info, XrRenderModelBufferFB* buffer);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_VARJO_foveated_rendering = 1;
enum XR_VARJO_foveated_rendering_SPEC_VERSION = 2;
enum XR_VARJO_FOVEATED_RENDERING_EXTENSION_NAME = "XR_VARJO_foveated_rendering";
// XrViewLocateFoveatedRenderingVARJO extends XrViewLocateInfo
struct XrViewLocateFoveatedRenderingVARJO
{
    XrStructureType type;
    const(void)* next;
    XrBool32 foveatedRenderingActive;
}

// XrFoveatedViewConfigurationViewVARJO extends XrViewConfigurationView
struct XrFoveatedViewConfigurationViewVARJO
{
    XrStructureType type;
    void* next;
    XrBool32 foveatedRenderingActive;
}

// XrSystemFoveatedRenderingPropertiesVARJO extends XrSystemProperties
struct XrSystemFoveatedRenderingPropertiesVARJO
{
    XrStructureType type;
    void* next;
    XrBool32 supportsFoveatedRendering;
}

enum XR_VARJO_composition_layer_depth_test = 1;
enum XR_VARJO_composition_layer_depth_test_SPEC_VERSION = 2;
enum XR_VARJO_COMPOSITION_LAYER_DEPTH_TEST_EXTENSION_NAME = "XR_VARJO_composition_layer_depth_test";
// XrCompositionLayerDepthTestVARJO extends XrCompositionLayerProjection
struct XrCompositionLayerDepthTestVARJO
{
    XrStructureType type;
    const(void)* next;
    float depthTestRangeNearZ;
    float depthTestRangeFarZ;
}

enum XR_VARJO_environment_depth_estimation = 1;
enum XR_VARJO_environment_depth_estimation_SPEC_VERSION = 1;
enum XR_VARJO_ENVIRONMENT_DEPTH_ESTIMATION_EXTENSION_NAME = "XR_VARJO_environment_depth_estimation";
alias PFN_xrSetEnvironmentDepthEstimationVARJO = XrResult function (XrSession session, XrBool32 enabled);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_VARJO_marker_tracking = 1;
enum XR_VARJO_marker_tracking_SPEC_VERSION = 1;
enum XR_VARJO_MARKER_TRACKING_EXTENSION_NAME = "XR_VARJO_marker_tracking";
// XrSystemMarkerTrackingPropertiesVARJO extends XrSystemProperties
struct XrSystemMarkerTrackingPropertiesVARJO
{
    XrStructureType type;
    void* next;
    XrBool32 supportsMarkerTracking;
}

struct XrEventDataMarkerTrackingUpdateVARJO
{
    XrStructureType type;
    const(void)* next;
    ulong markerId;
    XrBool32 isActive;
    XrBool32 isPredicted;
    XrTime time;
}

struct XrMarkerSpaceCreateInfoVARJO
{
    XrStructureType type;
    const(void)* next;
    ulong markerId;
    XrPosef poseInMarkerSpace;
}

alias PFN_xrSetMarkerTrackingVARJO = XrResult function (XrSession session, XrBool32 enabled);
alias PFN_xrSetMarkerTrackingTimeoutVARJO = XrResult function (XrSession session, ulong markerId, XrDuration timeout);
alias PFN_xrSetMarkerTrackingPredictionVARJO = XrResult function (XrSession session, ulong markerId, XrBool32 enabled);
alias PFN_xrGetMarkerSizeVARJO = XrResult function (XrSession session, ulong markerId, XrExtent2Df* size);
alias PFN_xrCreateMarkerSpaceVARJO = XrResult function (XrSession session, const(XrMarkerSpaceCreateInfoVARJO)* createInfo, XrSpace* space);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_MSFT_spatial_anchor_persistence = 1;
struct XrSpatialAnchorStoreConnectionMSFT_T;
alias XrSpatialAnchorStoreConnectionMSFT = XrSpatialAnchorStoreConnectionMSFT_T*;
enum XR_MAX_SPATIAL_ANCHOR_NAME_SIZE_MSFT = 256;
enum XR_MSFT_spatial_anchor_persistence_SPEC_VERSION = 2;
enum XR_MSFT_SPATIAL_ANCHOR_PERSISTENCE_EXTENSION_NAME = "XR_MSFT_spatial_anchor_persistence";

struct XrSpatialAnchorPersistenceNameMSFT
{
    char[XR_MAX_SPATIAL_ANCHOR_NAME_SIZE_MSFT] name;
}

struct XrSpatialAnchorPersistenceInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrSpatialAnchorPersistenceNameMSFT spatialAnchorPersistenceName;
    XrSpatialAnchorMSFT spatialAnchor;
}

struct XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT
{
    XrStructureType type;
    const(void)* next;
    XrSpatialAnchorStoreConnectionMSFT spatialAnchorStore;
    XrSpatialAnchorPersistenceNameMSFT spatialAnchorPersistenceName;
}

alias PFN_xrCreateSpatialAnchorStoreConnectionMSFT = XrResult function (XrSession session, XrSpatialAnchorStoreConnectionMSFT* spatialAnchorStore);
alias PFN_xrDestroySpatialAnchorStoreConnectionMSFT = XrResult function (XrSpatialAnchorStoreConnectionMSFT spatialAnchorStore);
alias PFN_xrPersistSpatialAnchorMSFT = XrResult function (XrSpatialAnchorStoreConnectionMSFT spatialAnchorStore, const(XrSpatialAnchorPersistenceInfoMSFT)* spatialAnchorPersistenceInfo);
alias PFN_xrEnumeratePersistedSpatialAnchorNamesMSFT = XrResult function (XrSpatialAnchorStoreConnectionMSFT spatialAnchorStore, uint spatialAnchorNamesCapacityInput, uint* spatialAnchorNamesCountOutput, XrSpatialAnchorPersistenceNameMSFT* persistedAnchorNames);
alias PFN_xrCreateSpatialAnchorFromPersistedNameMSFT = XrResult function (XrSession session, const(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT)* spatialAnchorCreateInfo, XrSpatialAnchorMSFT* spatialAnchor);
alias PFN_xrUnpersistSpatialAnchorMSFT = XrResult function (XrSpatialAnchorStoreConnectionMSFT spatialAnchorStore, const(XrSpatialAnchorPersistenceNameMSFT)* spatialAnchorPersistenceName);
alias PFN_xrClearSpatialAnchorStoreMSFT = XrResult function (XrSpatialAnchorStoreConnectionMSFT spatialAnchorStore);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_space_warp = 1;
enum XR_FB_space_warp_SPEC_VERSION = 1;
enum XR_FB_SPACE_WARP_EXTENSION_NAME = "XR_FB_space_warp";
alias XrCompositionLayerSpaceWarpInfoFlagsFB = ulong;

// Flag bits for XrCompositionLayerSpaceWarpInfoFlagsFB

// XrCompositionLayerSpaceWarpInfoFB extends XrCompositionLayerProjectionView
struct XrCompositionLayerSpaceWarpInfoFB
{
    XrStructureType type;
    const(void)* next;
    XrCompositionLayerSpaceWarpInfoFlagsFB layerFlags;
    XrSwapchainSubImage motionVectorSubImage;
    XrPosef appSpaceDeltaPose;
    XrSwapchainSubImage depthSubImage;
    float minDepth;
    float maxDepth;
    float nearZ;
    float farZ;
}

// XrSystemSpaceWarpPropertiesFB extends XrSystemProperties
struct XrSystemSpaceWarpPropertiesFB
{
    XrStructureType type;
    void* next;
    uint recommendedMotionVectorImageRectWidth;
    uint recommendedMotionVectorImageRectHeight;
}

enum XR_ALMALENCE_digital_lens_control = 1;
enum XR_ALMALENCE_digital_lens_control_SPEC_VERSION = 1;
enum XR_ALMALENCE_DIGITAL_LENS_CONTROL_EXTENSION_NAME = "XR_ALMALENCE_digital_lens_control";
alias XrDigitalLensControlFlagsALMALENCE = ulong;

// Flag bits for XrDigitalLensControlFlagsALMALENCE
extern __gshared const XrDigitalLensControlFlagsALMALENCE XR_DIGITAL_LENS_CONTROL_PROCESSING_DISABLE_BIT_ALMALENCE;

struct XrDigitalLensControlALMALENCE
{
    XrStructureType type;
    const(void)* next;
    XrDigitalLensControlFlagsALMALENCE flags;
}

alias PFN_xrSetDigitalLensControlALMALENCE = XrResult function (XrSession session, const(XrDigitalLensControlALMALENCE)* digitalLensControl);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_FB_passthrough_keyboard_hands = 1;
enum XR_FB_passthrough_keyboard_hands_SPEC_VERSION = 1;
enum XR_FB_PASSTHROUGH_KEYBOARD_HANDS_EXTENSION_NAME = "XR_FB_passthrough_keyboard_hands";

struct XrPassthroughKeyboardHandsIntensityFB
{
    XrStructureType type;
    const(void)* next;
    float leftHandIntensity;
    float rightHandIntensity;
}

alias PFN_xrPassthroughLayerSetKeyboardHandsIntensityFB = XrResult function (XrPassthroughLayerFB layer, const(XrPassthroughKeyboardHandsIntensityFB)* intensity);

/* XR_EXTENSION_PROTOTYPES */
/* !XR_NO_PROTOTYPES */

enum XR_EXT_uuid = 1;
enum XR_EXT_uuid_SPEC_VERSION = 1;
enum XR_EXT_UUID_EXTENSION_NAME = "XR_EXT_uuid";
enum XR_UUID_SIZE_EXT = 16;

struct XrUuidEXT
{
    ubyte[XR_UUID_SIZE_EXT] data;
}
