class Ossutil < Formula
    desc "The command line interface of oss of aliyun."
    homepage "https://github.com/aliyun/ossutil"
    version "1.7.1"
    url "http://gosspublic.alicdn.com/ossutil/1.7.1/ossutilmac64"
    sha256 "cdab34aa7e46fe4f4398e7abac1efb24ce44876af4bb9d240cf1caebff05062c"


    def install
        bin.install "ossutilmac64" => "ossutil"
    end
    
    test do
        system "false"
    end
end
