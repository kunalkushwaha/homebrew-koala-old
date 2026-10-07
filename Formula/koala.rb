class Koala < Formula
  desc "Linux VMs for development and CI on Apple silicon (preview)"
  homepage "https://github.com/kunalkushwaha/koala-releases"
  url "https://github.com/kunalkushwaha/koala-releases/releases/download/v0.1.0-preview.1/koala-0.1.0-preview.1-darwin-arm64.tar.gz"
  version "0.1.0-preview.1"
  sha256 "9d0d1473fbdae2e17c814a0e3584b37dda8e7d279575986b3c771b8115c49615"
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
