class Koala < Formula
  desc "Linux VMs for development and CI on Apple silicon (preview)"
  homepage "https://github.com/kunalkushwaha/koala-releases"
  url "https://github.com/kunalkushwaha/koala-releases/releases/download/v0.1.0-preview.1/koala-0.1.0-preview.1-darwin-arm64.tar.gz"
  version "0.1.0-preview.1"
  sha256 "31dc0a6f14f8e1f5aa3b497f5957061704103c2f12002a3a46cdb2d800b16365"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    # The keg is the release payload that `koala system install` checks.
    bin.install "bin/koala", "bin/koala-transfer"
    (libexec/"koala").install Dir["libexec/koala/*"]
    (share/"koala").install Dir["share/koala/*"]
    prefix.install "LICENSE", "NOTICE"
  end

  def caveats
    <<~EOS
      Koala 0.1.0-preview.1 is a preview: its security proofs are not complete.
      Finish the installation for your user (no sudo):
        koala system install
      Before `brew uninstall koala`, run:
        koala system uninstall
      It keeps your VMs, volumes and images; add --purge --yes to delete them.
    EOS
  end

  test do
    assert_match "koala 0.1.0-preview.1", shell_output("#{bin}/koala --version")
  end
end
