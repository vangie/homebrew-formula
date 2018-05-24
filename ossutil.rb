class Ossutil < Formula
    desc "The command line interface of oss of aliyun."
    homepage "https://github.com/aliyun/ossutil"
    version "1.4.1"
    url "http://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/assets/attach/50452/cn_zh/1524644116085/ossutilmac64" 
    sha256 "f8a3f7cb8c2c3f7125dfa96cab5c88e2548c334cf1573938a13e8cbd73f28a96"


    def install
        bin.install "ossutilmac64" => "ossutil"
    end
    
    test do
        system "false"
    end
end