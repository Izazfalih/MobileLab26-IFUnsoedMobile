package com.pemmob.izazfalih

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import com.pemmob.izazfalih.ui.screen.DaftarProdukScreen
import com.pemmob.izazfalih.ui.theme.JualanTheme

class HomeActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            JualanTheme {
                DaftarProdukScreen()
            }
        }
    }
}
