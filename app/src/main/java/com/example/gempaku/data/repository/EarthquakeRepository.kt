package com.example.gempaku.data.repository

import com.example.gempaku.data.model.Earthquake
import com.example.gempaku.data.remote.BmkgApiService
import com.example.gempaku.data.remote.RetrofitInstance

/**
 * Repository class that abstracts data access for earthquake records.
 * Acts as a single source of truth between the data sources and the ViewModel.
 */
class EarthquakeRepository(
    private val apiService: BmkgApiService = RetrofitInstance.api
) {

    /**
     * Fetches recent earthquakes from BMKG REST API.
     */
    suspend fun getRecentEarthquakes(): List<Earthquake> {
        val response = apiService.getRecentEarthquakes()
        return response.infoGempa?.gempa ?: emptyList()
    }
}
