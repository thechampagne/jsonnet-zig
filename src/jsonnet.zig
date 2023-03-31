// Copyright 2023 XXIV
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
pub const LIB_JSONNET_VERSION = "v0.19.1";

pub const JsonnetVm = opaque {};
pub const JsonnetJsonValue = opaque {};

pub extern "C" fn jsonnet_version() [*c]const u8;
pub extern "C" fn jsonnet_make() ?*JsonnetVm;
pub extern "C" fn jsonnet_max_stack(vm: ?*JsonnetVm, v: c_uint) void;
pub extern "C" fn jsonnet_gc_min_objects(vm: ?*JsonnetVm, v: c_uint) void;
pub extern "C" fn jsonnet_gc_growth_trigger(vm: ?*JsonnetVm, v: f64) void;
pub extern "C" fn jsonnet_string_output(vm: ?*JsonnetVm, v: c_int) void;
pub const JsonnetImportCallback = fn (?*anyopaque, [*c]const u8, [*c]const u8, [*c][*c]u8, [*c][*c]u8, [*c]usize) callconv(.C) c_int;
pub extern "C" fn jsonnet_json_extract_string(vm: ?*JsonnetVm, v: ?*const JsonnetJsonValue) [*c]const u8;
pub extern "C" fn jsonnet_json_extract_number(vm: ?*JsonnetVm, v: ?*const JsonnetJsonValue, out: [*c]f64) c_int;
pub extern "C" fn jsonnet_json_extract_bool(vm: ?*JsonnetVm, v: ?*const JsonnetJsonValue) c_int;
pub extern "C" fn jsonnet_json_extract_null(vm: ?*JsonnetVm, v: ?*const JsonnetJsonValue) c_int;
pub extern "C" fn jsonnet_json_make_string(vm: ?*JsonnetVm, v: [*c]const u8) ?*JsonnetJsonValue;
pub extern "C" fn jsonnet_json_make_number(vm: ?*JsonnetVm, v: f64) ?*JsonnetJsonValue;
pub extern "C" fn jsonnet_json_make_bool(vm: ?*JsonnetVm, v: c_int) ?*JsonnetJsonValue;
pub extern "C" fn jsonnet_json_make_null(vm: ?*JsonnetVm) ?*JsonnetJsonValue;
pub extern "C" fn jsonnet_json_make_array(vm: ?*JsonnetVm) ?*JsonnetJsonValue;
pub extern "C" fn jsonnet_json_array_append(vm: ?*JsonnetVm, arr: ?*JsonnetJsonValue, v: ?*JsonnetJsonValue) void;
pub extern "C" fn jsonnet_json_make_object(vm: ?*JsonnetVm) ?*JsonnetJsonValue;
pub extern "C" fn jsonnet_json_object_append(vm: ?*JsonnetVm, obj: ?*JsonnetJsonValue, f: [*c]const u8, v: ?*JsonnetJsonValue) void;
pub extern "C" fn jsonnet_json_destroy(vm: ?*JsonnetVm, v: ?*JsonnetJsonValue) void;
pub const JsonnetNativeCallback = fn (?*anyopaque, [*c]const ?*const JsonnetJsonValue, [*c]c_int) callconv(.C) ?*JsonnetJsonValue;
pub extern "C" fn jsonnet_realloc(vm: ?*JsonnetVm, buf: [*c]u8, sz: usize) [*c]u8;
pub extern "C" fn jsonnet_import_callback(vm: ?*JsonnetVm, cb: ?JsonnetImportCallback, ctx: ?*anyopaque) void;
pub extern "C" fn jsonnet_native_callback(vm: ?*JsonnetVm, name: [*c]const u8, cb: ?JsonnetNativeCallback, ctx: ?*anyopaque, params: [*c]const [*c]const u8) void;
pub extern "C" fn jsonnet_ext_var(vm: ?*JsonnetVm, key: [*c]const u8, val: [*c]const u8) void;
pub extern "C" fn jsonnet_ext_code(vm: ?*JsonnetVm, key: [*c]const u8, val: [*c]const u8) void;
pub extern "C" fn jsonnet_tla_var(vm: ?*JsonnetVm, key: [*c]const u8, val: [*c]const u8) void;
pub extern "C" fn jsonnet_tla_code(vm: ?*JsonnetVm, key: [*c]const u8, val: [*c]const u8) void;
pub extern "C" fn jsonnet_max_trace(vm: ?*JsonnetVm, v: c_uint) void;
pub extern "C" fn jsonnet_jpath_add(vm: ?*JsonnetVm, v: [*c]const u8) void;
pub extern "C" fn jsonnet_evaluate_file(vm: ?*JsonnetVm, filename: [*c]const u8, @"error": [*c]c_int) [*c]u8;
pub extern "C" fn jsonnet_evaluate_snippet(vm: ?*JsonnetVm, filename: [*c]const u8, snippet: [*c]const u8, @"error": [*c]c_int) [*c]u8;
pub extern "C" fn jsonnet_evaluate_file_multi(vm: ?*JsonnetVm, filename: [*c]const u8, @"error": [*c]c_int) [*c]u8;
pub extern "C" fn jsonnet_evaluate_snippet_multi(vm: ?*JsonnetVm, filename: [*c]const u8, snippet: [*c]const u8, @"error": [*c]c_int) [*c]u8;
pub extern "C" fn jsonnet_evaluate_file_stream(vm: ?*JsonnetVm, filename: [*c]const u8, @"error": [*c]c_int) [*c]u8;
pub extern "C" fn jsonnet_evaluate_snippet_stream(vm: ?*JsonnetVm, filename: [*c]const u8, snippet: [*c]const u8, @"error": [*c]c_int) [*c]u8;
pub extern "C" fn jsonnet_destroy(vm: ?*JsonnetVm) void;
pub extern "C" fn jsonnet_fmt_indent(vm: ?*JsonnetVm, n: c_int) void;
pub extern "C" fn jsonnet_fmt_max_blank_lines(vm: ?*JsonnetVm, n: c_int) void;
pub extern "C" fn jsonnet_fmt_string(vm: ?*JsonnetVm, c: c_int) void;
pub extern "C" fn jsonnet_fmt_comment(vm: ?*JsonnetVm, c: c_int) void;
pub extern "C" fn jsonnet_fmt_pad_arrays(vm: ?*JsonnetVm, v: c_int) void;
pub extern "C" fn jsonnet_fmt_pad_objects(vm: ?*JsonnetVm, v: c_int) void;
pub extern "C" fn jsonnet_fmt_pretty_field_names(vm: ?*JsonnetVm, v: c_int) void;
pub extern "C" fn jsonnet_fmt_sort_imports(vm: ?*JsonnetVm, v: c_int) void;
pub extern "C" fn jsonnet_fmt_debug_desugaring(vm: ?*JsonnetVm, v: c_int) void;
pub extern "C" fn jsonnet_fmt_file(vm: ?*JsonnetVm, filename: [*c]const u8, @"error": [*c]c_int) [*c]u8;
pub extern "C" fn jsonnet_fmt_snippet(vm: ?*JsonnetVm, filename: [*c]const u8, snippet: [*c]const u8, @"error": [*c]c_int) [*c]u8;
