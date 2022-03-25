# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Rundown < Formula
  desc "Rundown runs Markdown files, making them powerful and pretty console applications"
  homepage "https://github.com/elseano/rundown"
  version "0.4.0-beta.5"
  license "MIT"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/elseano/rundown/releases/download/v0.4.0-beta.5/rundown_0.4.0-beta.5_Darwin_x86_64.tar.gz"
    sha256 "272e2130a92ae25ec07323b516a04bf3c1cc3dc28ca2a72c43e06ed4f6ac88e5"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/elseano/rundown/releases/download/v0.4.0-beta.5/rundown_0.4.0-beta.5_Darwin_arm64.tar.gz"
    sha256 "e715f39b3fae49226e4a0eb9d5de7f73940697bdd930f44fa6731cb47aaacdb6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/elseano/rundown/releases/download/v0.4.0-beta.5/rundown_0.4.0-beta.5_Linux_x86_64.tar.gz"
    sha256 "c8ae97baf7a16ae8d14f1d85a8bc42837ad803295fd9c6090f9fc29627b933d2"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/elseano/rundown/releases/download/v0.4.0-beta.5/rundown_0.4.0-beta.5_Linux_arm64.tar.gz"
    sha256 "0183ad7dd3d6947fef8de10f464a0937dbe64a71548d3bf358da0c8f59ab9884"
  end

  def install
    bin.install "rundown"

    output = Utils.safe_popen_read("#{bin}/rundown", "--completions", "bash")
    (bash_completion/"rundown").write output

    output = Utils.safe_popen_read("#{bin}/rundown", "--completions", "zsh")
    (zsh_completion/"rundown").write output

    output = Utils.safe_popen_read("#{bin}/rundown", "--completions", "fish")
    (fish_completion/"rundown").write output
  end

  test do
    assert_match "rundown version #{version}", shell_output("#{bin}/rundown --version")
  end
end
