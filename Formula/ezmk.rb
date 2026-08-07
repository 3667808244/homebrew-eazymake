# EazyMake Homebrew formula
#
# Installs the prebuilt linux-x64 binary from the EazyMake GitHub Release.
# The release tarball ezmk-linux-x64.tar.gz contains `ezmk` (the binary)
# and `_ezmk` (zsh completion).
#
#   brew tap 3667808244/eazymake
#   brew install ezmk
#
# Repo: https://github.com/3667808244/EazyMake
# Release assets: https://github.com/3667808244/EazyMake/releases

class Ezmk < Formula
  desc "A simple C/C++ build tool (GCC/Clang/MSVC)"
  homepage "https://github.com/3667808244/EazyMake"
  url "https://github.com/3667808244/EazyMake/releases/download/v1.1.0/ezmk-linux-x64.tar.gz"
  sha256 "938f7ca8b15f5a4a3f383c2866a8997d9de5e9d841f0e477d65ff726e2727bf7"
  version "1.1.0"
  license "MIT"

  def install
    chdir "ezmk-linux-x64" do
      bin.install "ezmk"
      zsh_completion.install "_ezmk"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ezmk version")
  end
end
