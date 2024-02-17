return {
  settings = {
    texlab = {
      build = {
        executable = "tectonic",
        onSave = true,
        args = {
          "-X",
          "compile",
          "%f",
          "--synctex",
          "--keep-logs",
          "--keep-intermediates"
        }
      },
      forwardSearch = {
        executable = "okular",
        args = {
          "--unique",
          "file:%p#src%l%f"
        }
      }
    }
  }
}

