package com.camalot.solution

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import android.util.Log

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        try {
            Log.d("MainActivity", "Starting onCreate")
            super.onCreate(savedInstanceState)
            Log.d("MainActivity", "onCreate completed")
        } catch (e: Exception) {
            Log.e("MainActivity", "Error in onCreate", e)
            e.printStackTrace()
        }
    }
}
