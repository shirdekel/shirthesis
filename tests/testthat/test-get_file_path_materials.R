test_that("outputs correctly", {
  expect_match(
      get_file_path_materials("test_dir", "test_material_path"),
      file.path("test_dir", "test_material_path.png")
  )
})
