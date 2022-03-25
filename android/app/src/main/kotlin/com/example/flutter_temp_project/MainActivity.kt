package com.example.flutter_bloc_rx_stream

import android.content.Intent
import com.example.test_native.MainActivity2
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, "callNative"
        ).setMethodCallHandler { call, result ->
            if(call.method == "start")
            {
                startActivity(Intent(this, MainActivity2::class.java))
            }

        }
    }

}
