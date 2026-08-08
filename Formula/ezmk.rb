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
  url "https://github.com/3667808244/EazyMake/releases/download/v1.1.1/ezmk-linux-x64.tar.gz"
  sha256 "c9ed14a5b88fac0ddd0118c66cc4924535fc9fa9fa0fc9e114cbaa5c0dbfb13e"
  version "1.1.1"
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
