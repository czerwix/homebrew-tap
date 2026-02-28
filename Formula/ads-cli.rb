class AdsCli < Formula
  desc "CLI for searching and working with Google Docs"
  homepage "https://github.com/czerwix/ads-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/czerwix/ads-cli/releases/download/v#{version}/ads-macos-arm64.tar.gz"
      sha256 "071e0a9bf2eba857617e18d4c65515206cb88c0da35a1ae5b116ce8d11cd0d71"
    else
      url "https://github.com/czerwix/ads-cli/releases/download/v#{version}/ads-macos-x86_64.tar.gz"
      sha256 "9f9e2e1f229ec8e3463b1d306add5c074fbb2ac97f31a56bbbec0f7b5bf264e9"
    end
  end

  head "https://github.com/czerwix/ads-cli.git", branch: "main" do
    depends_on "swift" => :build
  end

  def install
    if build.head?
      system "swift", "build", "-c", "release"
      bin.install ".build/release/ads"
    else
      bin.install "ads"
    end
  end

  test do
    system "#{bin}/ads", "--help"
  end
end
