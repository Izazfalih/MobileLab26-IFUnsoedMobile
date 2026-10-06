package com.example.gempaku.ui

import com.example.gempaku.data.model.Earthquake

/**
 * Represents the distinct UI states of the earthquake feature.
 */
sealed interface UiState {
    data object Loading : UiState
    data class Success(val data: List<Earthquake>) : UiState
    data class Error(val message: String) : UiState
}
