require 'formula'

class Pngout < Formula
  homepage 'http://www.advsys.net/ken/util/pngout.htm'
  url 'http://static.jonof.id.au/dl/kenutils/pngout-20130221-darwin.tar.gz'


  def install
    bin.install 'pngout'
  end

  def caveats; <<-EOS.undent
    We agreed to the PNGOUT license for you.
    If this is unacceptable you should uninstall.

    License information at:
    http://advsys.net/ken/utils.htm#pngoutkziplicense
    EOS
  end
end
