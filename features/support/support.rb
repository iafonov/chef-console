def fixture_file(name)
  IO.read(File.join("features", "fixture_files", name))
end