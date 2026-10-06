package com.example.gempaku

import com.example.gempaku.data.model.EarthquakeResponse
import com.google.gson.Gson
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

class EarthquakeModelTest {

    @Test
    fun testBmkgJsonParsing() {
        val json = """
        {
          "Infogempa": {
            "gempa": [
              {
                "Tanggal": "06 Okt 2026",
                "Jam": "20:11:23 WIB",
                "DateTime": "2026-10-06T13:11:23+00:00",
                "Coordinates": "4.94,118.77",
                "Lintang": "4.94 LU",
                "Bujur": "118.77 BT",
                "Magnitude": "5.3",
                "Kedalaman": "10 km",
                "Wilayah": "219 km TimurLaut TARAKAN-KALTARA",
                "Potensi": "Tidak berpotensi tsunami"
              },
              {
                "Tanggal": "04 Okt 2026",
                "Jam": "06:37:31 WIB",
                "DateTime": "2026-10-03T23:37:31+00:00",
                "Coordinates": "4.56,94.97",
                "Lintang": "4.56 LU",
                "Bujur": "94.97 BT",
                "Magnitude": "5.9",
                "Kedalaman": "26 km",
                "Wilayah": "68 km BaratDaya JAWA BARAT",
                "Potensi": "Tidak berpotensi tsunami"
              }
            ]
          }
        }
        """.trimIndent()

        val gson = Gson()
        val response = gson.fromJson(json, EarthquakeResponse::class.java)

        assertNotNull(response)
        assertNotNull(response.infoGempa)
        assertEquals(2, response.infoGempa?.gempa?.size)

        val first = response.infoGempa?.gempa?.get(0)
        assertNotNull(first)
        assertEquals("06 Okt 2026", first?.tanggal)
        assertEquals("20:11:23 WIB", first?.jam)
        assertEquals("4.94,118.77", first?.coordinates)
        assertEquals("5.3", first?.magnitude)
        assertEquals("10 km", first?.kedalaman)
        assertEquals("219 km TimurLaut TARAKAN-KALTARA", first?.wilayah)
        assertEquals("Tidak berpotensi tsunami", first?.potensi)
    }

    @Test
    fun testLocalSearchFilteringByWilayah() {
        val list = listOf(
            com.example.gempaku.data.model.Earthquake(
                tanggal = "06 Okt 2026",
                jam = "20:11:23 WIB",
                magnitude = "5.3",
                kedalaman = "10 km",
                wilayah = "219 km TimurLaut TARAKAN-KALTARA",
                potensi = "Tidak berpotensi tsunami"
            ),
            com.example.gempaku.data.model.Earthquake(
                tanggal = "04 Okt 2026",
                jam = "06:37:31 WIB",
                magnitude = "5.9",
                kedalaman = "26 km",
                wilayah = "68 km BaratDaya Pelabuhan Ratu, Jawa Barat",
                potensi = "Tidak berpotensi tsunami"
            ),
            com.example.gempaku.data.model.Earthquake(
                tanggal = "14 Sep 2026",
                jam = "08:42:08 WIB",
                magnitude = "5.2",
                kedalaman = "10 km",
                wilayah = "156 km Tenggara Pacitan, Jawa Timur",
                potensi = "Tidak berpotensi tsunami"
            )
        )

        // Case-insensitive search "jawa" should match both Jawa Barat and Jawa Timur
        val queryJawa = "jawa"
        val filteredJawa = list.filter { it.wilayah.contains(queryJawa, ignoreCase = true) }
        assertEquals(2, filteredJawa.size)

        // Case-insensitive search "kaltara"
        val filteredKaltara = list.filter { it.wilayah.contains("kaltara", ignoreCase = true) }
        assertEquals(1, filteredKaltara.size)
        assertEquals("219 km TimurLaut TARAKAN-KALTARA", filteredKaltara[0].wilayah)

        // Empty query should keep all
        val emptyQuery = ""
        val all = if (emptyQuery.isBlank()) list else list.filter { it.wilayah.contains(emptyQuery, ignoreCase = true) }
        assertEquals(3, all.size)
    }
}
