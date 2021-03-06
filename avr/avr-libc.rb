require 'formula'

def relative(name)
  return name if name.kind_of? Formula
  File.join(File.split(__FILE__)[0], name) + '.rb'
end

class AvrLibc < Formula
  url 'http://download.savannah.gnu.org/releases/avr-libc/avr-libc-1.8.0.tar.bz2'
  homepage 'http://www.nongnu.org/avr-libc/'
  md5 '54c71798f24c96bab206be098062344f'

  depends_on relative 'avr-gcc'

  # brew's build environment is in our way
  ENV.delete 'CFLAGS'
  ENV.delete 'CXXFLAGS'
  ENV.delete 'LD'
  ENV.delete 'CC'
  ENV.delete 'CXX'

  def install
    avr_gcc = Formula.factory(relative 'avr-gcc')
    build = `./config.guess`.chomp
    system "./configure", "--build=#{build}", "--prefix=#{prefix}", "--host=avr"
    system "make install"
    avr = File.join prefix, 'avr'
    # copy include and lib files where avr-gcc searches for them
    # this wouldn't be necessary with a standard prefix
    ohai "copying #{avr} -> #{avr_gcc.prefix}"
    cp_r avr, avr_gcc.prefix
  end
end

