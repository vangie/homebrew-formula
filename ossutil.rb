class Ossutil < Formula
    desc "The command line interface of oss of aliyun."
    homepage "https://github.com/aliyun/ossutil"
    version "1.7.1"
    url "http://gosspublic.alicdn.com/ossutil/1.7.1/ossutilmac64"
    sha256 "f8a3f7cb8c2c3f7125dfa96cab5c88e2548c334cf1573938a13e8cbd73f28a96"


    def install
        bin.install "ossutilmac64" => "ossutil"
    end
    
    test do
        system "false"
    end
end