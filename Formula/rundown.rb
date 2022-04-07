# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Rundown < Formula
  desc "Rundown runs Markdown files, making them powerful and pretty console applications"
  homepage "https://github.com/elseano/rundown"
  version "0.4.0-beta.16"
  license "MIT"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/elseano/rundown/releases/download/v0.4.0-beta.16/rundown_0.4.0-beta.16_Darwin_x86_64.tar.gz"
    sha256 "d8f8329334d269436458a72def15ca1598f41339619a24c5d764fc96f6af6a71"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/elseano/rundown/releases/download/v0.4.0-beta.16/rundown_0.4.0-beta.16_Darwin_arm64.tar.gz"
    sha256 "9f64e6b7fa7c8977372ca79ceb634bf58af104e061aac812195ae3b9686a67d1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/elseano/rundown/releases/download/v0.4.0-beta.16/rundown_0.4.0-beta.16_Linux_x86_64.tar.gz"
    sha256 "d045f73c93b38ba4ece1d9b48bc0eb42f007be7c0a0dc014d63b0d9f43f86b16"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/elseano/rundown/releases/download/v0.4.0-beta.16/rundown_0.4.0-beta.16_Linux_arm64.tar.gz"
    sha256 "b78a1efacd0c75753f27249c85befa3c8ee553d586088b46afd034b8510bb19f"
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
