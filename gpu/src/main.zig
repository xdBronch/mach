const std = @import("std");

pub const array_layer_count_undefined = 0xffffffff;
pub const copy_stride_undefined = 0xffffffff;
pub const limit_u32_undefined = 0xffffffff;
pub const limit_u64_undefined = 0xffffffffffffffff;
pub const mip_level_count_undefined = 0xffffffff;
pub const stride_undefined = 0xffffffff;
pub const whole_map_size = std.math.maxInt(usize);
pub const whole_size = 0xffffffffffffffff;

pub const Adapter = @import("adapter.zig").Adapter;
pub const BindGroup = @import("bind_group.zig").BindGroup;
pub const BindGroupLayout = @import("bind_group_layout.zig").BindGroupLayout;
pub const Buffer = @import("buffer.zig").Buffer;
pub const CommandBuffer = @import("CommandBuffer.zig");
pub const CommandEncoder = @import("CommandEncoder.zig");
pub const ComputePassEncoder = @import("ComputePassEncoder.zig");
pub const ComputePipeline = @import("ComputePipeline.zig");
pub const Device = @import("Device.zig");
pub const ExternalTexture = @import("ExternalTexture.zig");
pub const Instance = @import("Instance.zig");
pub const PipelineLayout = @import("PipelineLayout.zig");
pub const QuerySet = @import("QuerySet.zig");
pub const Queue = @import("Queue.zig");
pub const RenderBundle = @import("RenderBundle.zig");
pub const RenderBundleEncoder = @import("RenderBundleEncoder.zig");
pub const RenderPassEncoder = @import("RenderPassEncoder.zig");
pub const RenderPipeline = @import("RenderPipeline.zig");
pub const Sampler = @import("Sampler.zig");
pub const ShaderModule = @import("ShaderModule.zig");
pub const Surface = @import("Surface.zig");
pub const SwapChain = @import("SwapChain.zig");
pub const Texture = @import("Texture.zig");
pub const TextureView = @import("TextureView.zig");

pub const AlphaMode = @import("types.zig").AlphaMode;

test {
    refAllDecls(@import("adapter.zig"));
    refAllDecls(@import("bind_group.zig"));
    refAllDecls(@import("bind_group_layout.zig"));
    refAllDecls(@import("buffer.zig"));
    refAllDecls(@import("CommandBuffer.zig"));
    refAllDecls(@import("CommandEncoder.zig"));
    refAllDecls(@import("ComputePassEncoder.zig"));
    refAllDecls(@import("ComputePipeline.zig"));
    refAllDecls(@import("Device.zig"));
    refAllDecls(@import("ExternalTexture.zig"));
    refAllDecls(@import("Instance.zig"));
    refAllDecls(@import("PipelineLayout.zig"));
    refAllDecls(@import("QuerySet.zig"));
    refAllDecls(@import("Queue.zig"));
    refAllDecls(@import("RenderBundle.zig"));
    refAllDecls(@import("RenderBundleEncoder.zig"));
    refAllDecls(@import("RenderPassEncoder.zig"));
    refAllDecls(@import("RenderPipeline.zig"));
    refAllDecls(@import("Sampler.zig"));
    refAllDecls(@import("ShaderModule.zig"));
    refAllDecls(@import("Surface.zig"));
    refAllDecls(@import("SwapChain.zig"));
    refAllDecls(@import("Texture.zig"));
    refAllDecls(@import("TextureView.zig"));
    refAllDecls(@import("types.zig"));
}

fn refAllDecls(comptime T: type) void {
    @setEvalBranchQuota(10000);
    inline for (comptime @import("std").meta.declarations(T)) |decl| {
        if (decl.is_pub) {
            if (@TypeOf(@field(T, decl.name)) == type) {
                switch (@typeInfo(@field(T, decl.name))) {
                    .Struct, .Enum, .Union, .Opaque => refAllDecls(@field(T, decl.name)),
                    else => {},
                }
            }
            _ = @field(T, decl.name);
        }
    }
}
