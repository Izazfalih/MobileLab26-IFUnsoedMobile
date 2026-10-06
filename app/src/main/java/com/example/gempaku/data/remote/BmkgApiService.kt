package com.example.gempaku.data.remote

import com.example.gempaku.data.model.EarthquakeResponse
import retrofit2.http.GET

/**
 * Retrofit service interface defining BMKG REST API endpoints.
 */
interface BmkgApiService {

    /**
     * Retrieves the latest earthquake data from BMKG.
     * Endpoint: DataMKG/TEWS/gempaterkini.json
     */
    @GET("DataMKG/TEWS/gempaterkini.json")
    suspend fun getRecentEarthquakes(): EarthquakeResponse
}
