require 'formula'

class Parrot < Formula
  homepage 'http://www.parrot.org/'
  url 'ftp://ftp.parrot.org/pub/parrot/releases/supported/4.9.0/parrot-4.9.0.tar.bz2'
  sha256 '638cba16b47bd5c6dfb4c9106f17961b0496d65c321279a16032ef6667d3ae4d'

  devel do
    url 'ftp://ftp.parrot.org/pub/parrot/releases/devel/4.10.0/parrot-4.10.0.tar.bz2'
    sha256 '7d6a592c386d25bcee429a269cc571ae81c5c080b15d14a884401a27fe3f5d4b'
  end

  head 'https://github.com/parrot/parrot.git'

  depends_on 'gmp' => :optional
  depends_on 'icu4c' => :optional
  depends_on 'pcre' => :optional

  def install
    system "perl", "Configure.pl", "--prefix=#{prefix}",
                                   "--debugging=0",
                                   "--cc=#{ENV.cc}"

    system "make"
    system "make install"
    # Don't install this file in HOMEBREW_PREFIX/lib
    rm_rf lib/'VERSION'
  end
end
