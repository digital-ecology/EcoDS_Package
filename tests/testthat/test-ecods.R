library(testthat)

# Basic test for the ecods function

test_that("ecods function works",{
  
  result <- ecods(sample_site_boundary)
  
  # Test that the returned dataframe contains the expected columns
  expect_true(all(c("name", "designation", "gridref", "distance_to_site", "geometry") %in% colnames(result)))
  
  # Test that distance_to_site is a number
  expect_true(is.numeric(result$distance_to_site))
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_sssi function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  site <- sf::st_buffer(site, 5000)
  result <- fetch_sssi(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
  # Test that the returned dataframe contains the expected columns
  expect_true(all(c("name", "designation", "gridref", "distance_to_site", "geometry") %in% colnames(result)))
  
})

test_that("fetch_aonb function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  site <- sf::st_buffer(site, 5000)
  result <- fetch_aonb(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
  # Test that the returned dataframe contains the expected columns
  # Can return NULL if there are no sites.
  #expect_true(all(c("name", "designation", "gridref", "distance_to_site", "geometry") %in% colnames(result)))
  
})

test_that("fetch_awi function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  result <- fetch_awi(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_aonb function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  site <- sf::st_buffer(site, 5000)
  
  result <- fetch_aonb(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_irreplaceable function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  result <- fetch_irreplaceable(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_lnr function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  site <- sf::st_buffer(site, 2000)
  result <- fetch_lnr(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_lpa function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  result <- fetch_lpa(site)
  
  # Test result is of class sf
  expect_true(is.character(result))
  
})

test_that("fetch_nca function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  result <- fetch_nca(site)
  
  # Test result is of class sf
  expect_true(is.character(result))
  
})

test_that("fetch_natpark function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  site <- sf::st_buffer(site, 5000)
  result <- fetch_natpark(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_nnr function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  site <- sf::st_buffer(site, 5000)
  result <- fetch_nnr(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_phi_buffer function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  result <- fetch_phi_buffer(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_phi_site function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  result <- fetch_phi_site(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_ramsar function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  site <- sf::st_buffer(site, 10000)
  result <- fetch_ramsar(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_sac function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  site <- sf::st_buffer(site, 10000)
  result <- fetch_sac(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("fetch_spa function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  site <- sf::st_buffer(site, 10000)
  result <- fetch_spa(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
})

test_that("getbuffers function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  result <- getbuffers(site)
  
  # Test result is of class sf
  expect_true(isClass("sf", result))
  
  # Test result is a list
  expect_true(is.list(result))
  
})

test_that("getgridref function works",{
  
  site <- sf::st_transform(sample_site_boundary, 4326)
  result <- getgridref(site)
  
  # Test result is a list
  expect_true(is.list(result))
  
})
