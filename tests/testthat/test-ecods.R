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