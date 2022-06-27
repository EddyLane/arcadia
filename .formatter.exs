[
  import_deps: [:phoenix, :surface],
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs}", "{lib,test}/**/*.sface"],
  subdirectories: ["apps/*"],
  plugins: [Surface.Formatter.Plugin]
]
