package com.example.gempaku.data.model

import com.google.gson.annotations.SerializedName

/**
 * Root response object from the BMKG earthquake REST API endpoint.
 * Corresponds to: {"Infogempa": {"gempa": [...]}}
 */
data class EarthquakeResponse(
    @SerializedName("Infogempa")
    val infoGempa: InfoGempa? = null
)

/**
 * Wrapper object containing the list of earthquakes.
 */
data class InfoGempa(
    @SerializedName("gempa")
    val gempa: List<Earthquake> = emptyList()
)

/**
 * Model representing an individual earthquake event returned by BMKG.
 */
data class Earthquake(
    @SerializedName("Tanggal")
    val tanggal: String = "",

    @SerializedName("Jam")
    val jam: String = "",

    @SerializedName("DateTime")
    val dateTime: String? = null,

    @SerializedName("Coordinates")
    val coordinates: String = "",

    @SerializedName("Lintang")
    val lintang: String? = null,

    @SerializedName("Bujur")
    val bujur: String? = null,

    @SerializedName("Magnitude")
    val magnitude: String = "",

    @SerializedName("Kedalaman")
    val kedalaman: String = "",

    @SerializedName("Wilayah")
    val wilayah: String = "",

    @SerializedName("Potensi")
    val potensi: String = ""
)
