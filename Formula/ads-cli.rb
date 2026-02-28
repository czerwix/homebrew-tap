class AdsCli < Formula
  desc "CLI for searching and working with Google Docs"
  homepage "https://github.com/czerwix/ads-cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/czerwix/ads-cli/releases/download/v#{version}/ads-macos-arm64.tar.gz"
      sha256 "163a87a8abf5f4e925a9f67957eb89d43bee517238e5c87fbcff0c545f999a5b"
    else
      url "https://github.com/czerwix/ads-cli/releases/download/v#{version}/ads-macos-x86_64.tar.gz"
      sha256 "81a8ba64dabf61b04fa5becc4345a24f491540508bfe0167f413a69ee17c03f1"
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
