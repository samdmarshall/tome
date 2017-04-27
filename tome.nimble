# Package
version = "0.1.0"
author = "Samantha Marshall"
description = "bookmarks storage and management"
license = "BSD 3-Clause"

srcDir = "src"

bin = @["tome"]

skipExt = @["nim"]

# Dependencies
requires "nim >= 0.16.0"
requires "parsetoml >= 0.2"
requires "cmd >= 0.1.0"
