package stringsway.co.flutterapp

import android.os.Handler
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val methodChannel: String = "username";
    private val methodChannelFromAndroidToFlutter: String = "androidToFlutter";
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor, methodChannel).setMethodCallHandler { call, result ->
            if (call.method.equals("getUserName")) {
                result.success("viveky259")
            }
        }

        var methodChannelFromAndroid:
                MethodChannel = MethodChannel(flutterEngine.dartExecutor, methodChannelFromAndroidToFlutter);
        Handler().postDelayed({
            methodChannelFromAndroid.invokeMethod("publish", "How to call flutter from android")
        }, 4000)
    }
}
