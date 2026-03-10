{ config, pkgs, ... }:
{
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.amdgpu.initrd.enable = true;
}
