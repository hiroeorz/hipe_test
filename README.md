HiPEのテストです
======================================================================

* コンパイルオプションに "native, {'O2'}" をつけたりつけなかったりして試してみました。

* ただし、実際のアプリではIOとかがボトルネックになると思われるので、どの程度差が出るかはわかりません。

実行環境
-----------------------------------------------------------------------

MacOSX Mavericks On MacBookPro

Erlang コンパイル時のオプション

    ./configure --prefix=/usr/local/erlang/R16B02 \
                --enable-threads --enable-smp-support --enable-shared-zlib \
                --enable-m64-build --with-ssl --without-javac \
                --enable-darwin-64bit

速度比較
-----------------------------------------------------------------------

結論: HiPEありのが(こういうテストだと)8倍くらい速い。

HiPEあり
***********************************************************************
    shin$ ./rebar clean compile -C rebar_hipe.config && ./start-dev
    
    ==> hipe_test (clean)
    ==> hipe_test (compile)
    
    Compiled src/hipe_test_sup.erl
    Compiled src/hipe_test_app.erl
    Compiled src/hipe_test.erl
    
    Erlang R16B02 (erts-5.10.3) [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]
    
    Eshell V5.10.3  (abort with ^G)
    1> 47572
    59871
    63670
    60411
    50053
    48022
    53161
    48069
    50440
    51276
    --------------average-------------
    53254.5



HiPEなし
***********************************************************************
    shin$ ./rebar clean compile -C rebar.config && ./start-dev
    
    ==> hipe_test (clean)
    ==> hipe_test (compile)
    
    Compiled src/hipe_test_sup.erl
    Compiled src/hipe_test_app.erl
    Compiled src/hipe_test.erl
    
    Erlang R16B02 (erts-5.10.3) [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]
    
    Eshell V5.10.3  (abort with ^G)
    1> 460762
    484704
    465362
    488086
    455625
    465452
    464920
    464943
    493286
    461811
    --------------average-------------
    470495.1


beamサイズ比較
-----------------------------------------------------------------------

HiPEありのが大きい。

HiPEあり
***********************************************************************

    shin$ ./rebar clean compile -C rebar_hipe.config && ls -l ebin/
    
     289 11  1 19:50 hipe_test.app
    5040 11  1 19:50 hipe_test.beam
    1580 11  1 19:50 hipe_test_app.beam
    1932 11  1 19:50 hipe_test_sup.beam

HiPEなし
***********************************************************************

    shin$ ./rebar clean compile -C rebar.config && ls -l ebin/

     289 11  1 19:50 hipe_test.app
    1840 11  1 19:50 hipe_test.beam
    1028 11  1 19:50 hipe_test_app.beam
    1156 11  1 19:50 hipe_test_sup.beam
