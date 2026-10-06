package com.example.gempaku

import com.example.gempaku.data.model.Earthquake
import com.example.gempaku.data.model.EarthquakeResponse
import com.example.gempaku.data.model.InfoGempa
import com.example.gempaku.data.remote.BmkgApiService
import com.example.gempaku.data.repository.EarthquakeRepository
import com.example.gempaku.ui.UiState
import com.example.gempaku.ui.viewmodel.EarthquakeViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class EarthquakeViewModelTest {

    private val testDispatcher = StandardTestDispatcher()

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    private val sampleEarthquakes = listOf(
        Earthquake(
            tanggal = "06 Okt 2026",
            jam = "20:11:23 WIB",
            magnitude = "5.3",
            kedalaman = "10 km",
            wilayah = "Tarakan Kalimantan Utara",
            potensi = "Tidak berpotensi tsunami"
        ),
        Earthquake(
            tanggal = "04 Okt 2026",
            jam = "06:37:31 WIB",
            magnitude = "5.9",
            kedalaman = "26 km",
            wilayah = "Pelabuhan Ratu Jawa Barat",
            potensi = "Tidak berpotensi tsunami"
        ),
        Earthquake(
            tanggal = "14 Sep 2026",
            jam = "08:42:08 WIB",
            magnitude = "5.2",
            kedalaman = "10 km",
            wilayah = "Pacitan Jawa Timur",
            potensi = "Tidak berpotensi tsunami"
        )
    )

    private class FakeApiService(
        private val list: List<Earthquake>,
        private val shouldThrow: Boolean = false
    ) : BmkgApiService {
        override suspend fun getRecentEarthquakes(): EarthquakeResponse {
            if (shouldThrow) {
                throw RuntimeException("Network error occurred")
            }
            return EarthquakeResponse(
                infoGempa = InfoGempa(gempa = list)
            )
        }
    }

    @Test
    fun testFetchEarthquakesSuccess() = runTest {
        val fakeApi = FakeApiService(sampleEarthquakes)
        val repository = EarthquakeRepository(apiService = fakeApi)
        val viewModel = EarthquakeViewModel(repository = repository)

        // Advance coroutine
        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertTrue(state is UiState.Success)
        val successState = state as UiState.Success
        assertEquals(3, successState.data.size)
    }

    @Test
    fun testFetchEarthquakesError() = runTest {
        val fakeApi = FakeApiService(emptyList(), shouldThrow = true)
        val repository = EarthquakeRepository(apiService = fakeApi)
        val viewModel = EarthquakeViewModel(repository = repository)

        advanceUntilIdle()

        val state = viewModel.uiState.value
        assertTrue(state is UiState.Error)
        val errorState = state as UiState.Error
        assertEquals("Network error occurred", errorState.message)
    }

    @Test
    fun testSearchFilteringByWilayah() = runTest {
        val fakeApi = FakeApiService(sampleEarthquakes)
        val repository = EarthquakeRepository(apiService = fakeApi)
        val viewModel = EarthquakeViewModel(repository = repository)

        advanceUntilIdle()

        // Search for "jawa"
        viewModel.onSearchQueryChange("jawa")
        val state = viewModel.uiState.value
        assertTrue(state is UiState.Success)
        val successState = state as UiState.Success
        assertEquals(2, successState.data.size)

        // Clear search
        viewModel.onSearchQueryChange("")
        val clearedState = viewModel.uiState.value as UiState.Success
        assertEquals(3, clearedState.data.size)
    }

    @Test
    fun testSelectEarthquake() = runTest {
        val fakeApi = FakeApiService(sampleEarthquakes)
        val repository = EarthquakeRepository(apiService = fakeApi)
        val viewModel = EarthquakeViewModel(repository = repository)

        advanceUntilIdle()

        val selected = sampleEarthquakes[1]
        viewModel.selectEarthquake(selected)

        assertEquals(selected, viewModel.selectedEarthquake.value)
    }
}
