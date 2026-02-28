class AdsCli < Formula
  desc "CLI for searching and working with Google Docs"
  homepage "https://github.com/czerwix/ads-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/czerwix/ads-cli/releases/download/v#{version}/ads-macos-arm64.tar.gz"
      sha256 "b840eab09526e882f3c93e8996231f1d304ba623b6bba1e8f37193dc2e9c7c75"
    else
      url "https://github.com/czerwix/ads-cli/releases/download/v#{version}/ads-macos-x86_64.tar.gz"
      sha256 "2fdcc693c2f3d992c55ffb65404c78bb76549827f7cdb4b9c0520d633cbd0d39"
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
