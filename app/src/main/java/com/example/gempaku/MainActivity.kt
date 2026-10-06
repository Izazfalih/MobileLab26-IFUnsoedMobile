package com.example.gempaku

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.gempaku.ui.screen.DetailScreen
import com.example.gempaku.ui.screen.HomeScreen
import com.example.gempaku.ui.theme.GempaKuTheme
import com.example.gempaku.ui.viewmodel.EarthquakeViewModel

/**
 * Main activity of the application hosting the Navigation Compose graph.
 */
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            GempaKuTheme {
                val navController = rememberNavController()
                // Shared ViewModel instance for navigation graph
                val viewModel: EarthquakeViewModel = viewModel()

                NavHost(
                    navController = navController,
                    startDestination = "home"
                ) {
                    // Screen 1: Home Screen
                    composable("home") {
                        HomeScreen(
                            viewModel = viewModel,
                            onEarthquakeClick = { earthquake ->
                                viewModel.selectEarthquake(earthquake)
                                navController.navigate("detail")
                            }
                        )
                    }

                    // Screen 2: Detail Screen
                    composable("detail") {
                        DetailScreen(
                            viewModel = viewModel,
                            onBackClick = {
                                navController.popBackStack()
                            }
                        )
                    }
                }
            }
        }
    }
}
