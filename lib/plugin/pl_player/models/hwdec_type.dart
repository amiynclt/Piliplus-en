// mpv --hwdec=help
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kDebugMode;

enum HwDecType {
  no('no', 'Enable soft decryption'),
  auto('auto', 'Enable any available codec'),
  autoSafe('auto-safe', 'Enable best codec'),
  autoCopy('auto-copy', 'Enable best codec with copy function'),
  d3d12va('d3d12va', 'DirectX 12 (Windows10 and above)'),
  d3d12vaCopy('d3d12va-copy', 'DirectX 12 (Windows10 and above) (non-passthrough)'),
  d3d11va('d3d11va', 'DirectX 11 (Windows8 and above)'),
  d3d11vaCopy('d3d11va-copy', 'DirectX 11 (Windows8 and above) (non-passthrough)'),
  dxva2('dxva2', 'DXVA2 (Windows7 and above)'),
  dxva2Copy('dxva2-copy', 'DXVA2 (Windows7 and above) (non-passthrough)'),
  videotoolbox('videotoolbox', 'VideoToolbox (macOS / iOS)'),
  videotoolboxCopy('videotoolbox-copy', 'VideoToolbox (macOS / iOS) (non-passthrough)'),
  vaapi('vaapi', 'VAAPI (Linux)'),
  vaapiCopy('vaapi-copy', 'VAAPI (Linux) (non-passthrough)'),
  nvdec('nvdec', 'NVDEC (exclusive to NVIDIA)'),
  nvdecCopy('nvdec-copy', 'NVDEC (NVIDIA exclusive) (non-passthrough)'),
  drm('drm', 'DRM (Linux)'),
  drmCopy('drm-copy', 'DRM (Linux) (non-passthrough)'),
  vulkan('vulkan', 'Vulkan (all platforms) (experimental)'),
  vulkanCopy('vulkan-copy', 'Vulkan (all platforms) (experimental) (non-passthrough)'),
  vdpau('vdpau', 'VDPAU (Linux)'),
  vdpauCopy('vdpau-copy', 'VDPAU (Linux) (non-passthrough)'),
  mediacodec('mediacodec', 'MediaCodec (Android)'),
  mediacodecCopy('mediacodec-copy', 'MediaCodec (Android) (non-passthrough)'),
  cuda('cuda', 'CUDA (NVIDIA exclusive) (obsolete)'),
  cudaCopy('cuda-copy', 'CUDA (NVIDIA exclusive) (obsolete) (non-passthrough)'),
  crystalhd('crystalhd', 'CrystalHD (all platforms) (obsolete)'),
  rkmpp('rkmpp', 'Rockchip MPP (only some Rockchip chips)'),
  amf('amf', 'AMF (AMD exclusive)'),
  amfCopy('amf-copy', 'AMF (AMD exclusive) (non-passthrough)'),
  qsv('qsv', 'Quick Sync Video (Intel exclusive)'),
  qsvCopy('qsv-copy', 'Quick Sync Video (Intel exclusive) (non-passthrough)'),
  ;

  final String hwdec;
  final String desc;
  const HwDecType(this.hwdec, this.desc);

  static final String kHwdec = Platform.isAndroid
      ? kDebugMode
            ? autoSafe.hwdec
            : [mediacodec.hwdec, autoSafe.hwdec].join(',')
      : auto.hwdec;
}
