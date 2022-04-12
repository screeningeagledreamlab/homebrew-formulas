class Carthage < Formula
  desc "Decentralized dependency manager for Cocoa (nsoperations+screeningeagledreamlab)"
  homepage "https://github.com/screeningeagledreamlab/Carthage"
  url "https://github.com/screeningeagledreamlab/Carthage.git",
      tag:      "0.46.1+nsoperations+screeningeagledreamlab",
      version:  "0.46.1",
      revision: "c119507c18d5490b8397d7aa154663aa60d9b4ab",
      shallow:  false
  head "https://github.com/screeningeagledreamlab/Carthage.git", shallow: false

  # bottle do
  #   root_url "https://dl.bintray.com/nsoperations/bottles-formulas"
  #   sha256 cellar: :any_skip_relocation, mojave: "ff88e7f289576f70ad6f4eabc3208e72e6e59b22e71622f8d407e9d45af475e0"
  # end

  depends_on xcode: ["13.3", :build]

  def install
    # if MacOS::Xcode.version >= "10.2" && MacOS.full_version < "10.14.4" && MacOS.version >= "10.14"
    #   odie "Xcode >=10.2 requires macOS >=10.14.4 to build Swift formulae."
    # end

    system "make", "prefix_install", "PREFIX=#{prefix}"
    bash_completion.install "Source/Scripts/carthage-bash-completion" => "carthage"
    zsh_completion.install "Source/Scripts/carthage-zsh-completion" => "_carthage"
    fish_completion.install "Source/Scripts/carthage-fish-completion" => "carthage.fish"
  end

  test do
    system bin/"carthage", "version"
  end
end
