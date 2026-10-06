package com.example.gempaku.ui.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.gempaku.data.model.Earthquake
import com.example.gempaku.data.repository.EarthquakeRepository
import com.example.gempaku.ui.UiState
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

/**
 * ViewModel responsible for managing earthquake data, local filtering,
 * and exposing UI state to Composables.
 */
class EarthquakeViewModel(
    private val repository: EarthquakeRepository = EarthquakeRepository()
) : ViewModel() {

    // UI state exposed to Composables via StateFlow
    private val _uiState = MutableStateFlow<UiState>(UiState.Loading)
    val uiState: StateFlow<UiState> = _uiState.asStateFlow()

    // Current search text query entered by the user
    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()

    // Store the original unfiltered earthquake list locally in memory
    private var allEarthquakes: List<Earthquake> = emptyList()

    // Currently selected earthquake for viewing details
    private val _selectedEarthquake = MutableStateFlow<Earthquake?>(null)
    val selectedEarthquake: StateFlow<Earthquake?> = _selectedEarthquake.asStateFlow()

    init {
        fetchEarthquakes()
    }

    /**
     * Fetches earthquake data from BMKG via the Repository.
     * Manages Loading, Success, and Error states.
     */
    fun fetchEarthquakes() {
        viewModelScope.launch {
            _uiState.value = UiState.Loading
            try {
                val earthquakes = repository.getRecentEarthquakes()
                allEarthquakes = earthquakes
                applyFilter(_searchQuery.value)
            } catch (e: Exception) {
                _uiState.value = UiState.Error(
                    e.localizedMessage ?: "Failed to load earthquake data."
                )
            }
        }
    }

    /**
     * Updates the search query and applies local filtering without hitting the API.
     */
    fun onSearchQueryChange(newQuery: String) {
        _searchQuery.value = newQuery
        applyFilter(newQuery)
    }

    /**
     * Filters the locally stored earthquake list by region (Wilayah) case-insensitively.
     */
    private fun applyFilter(query: String) {
        if (query.isBlank()) {
            _uiState.value = UiState.Success(allEarthquakes)
        } else {
            val filtered = allEarthquakes.filter {
                it.wilayah.contains(query.trim(), ignoreCase = true)
            }
            _uiState.value = UiState.Success(filtered)
        }
    }

    /**
     * Selects an earthquake item to display in the Detail Screen.
     */
    fun selectEarthquake(earthquake: Earthquake) {
        _selectedEarthquake.value = earthquake
    }
}
