import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

///
/// 开启https
/// https protocol not found, recompile FFmpeg with openssl, gnutls or securetransport enabled.
///
/// ./init-android-openssl.sh
/// ./compile-openssl.sh all
/// export COMMON_FF_CFG_FLAGS="$COMMON_FF_CFG_FLAGS --enable-openssl"
///
///

class OptionUtils {
  static void addDefaultOptions(IjkMediaController controller) {
    controller.addIjkPlayerOptions(
      [TargetPlatform.iOS, TargetPlatform.android],
      createIJKOptions(),
    );
  }

  static Set<IjkOption> createIJKOptions() {
    return <IjkOption>[
      IjkOption(IjkOptionCategory.player, "mediacodec", 1), ///打开硬解
      IjkOption(IjkOptionCategory.player, "mediacodec-hevc", 0),///h265
      IjkOption(IjkOptionCategory.player, "videotoolbox", 1),

      /// Open Sound Layer ES
      /// 范围应该是0-1
      /// rtsp外网，0:不OK，1:OK，2:相当于1
      IjkOption(IjkOptionCategory.player, "opensles", 1),//1

      IjkOption(IjkOptionCategory.player, "mediacodec-handle-resolution-change", 1),
      IjkOption(IjkOptionCategory.player, "mediacodec-auto-rotate", 1),
      IjkOption(IjkOptionCategory.player, "overlay-format", 0x32335652),
      IjkOption(IjkOptionCategory.player, "framedrop", 1),
      IjkOption(IjkOptionCategory.player, "start-on-prepared", 1),
      IjkOption(IjkOptionCategory.format, "http-detect-range-support", 0),
      IjkOption(IjkOptionCategory.format, "ijkapplication", 547488968448),
      IjkOption(IjkOptionCategory.codec, "skip_loop_filter", 48),
    ].toSet();
  }
}
