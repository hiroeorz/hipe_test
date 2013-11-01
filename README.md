HiPEのテストです
======================================================================

実行環境
-----------------------------------------------------------------------

MacOSX Mavericks On MacBookPro

Erlang コンパイル時のオプション

    ./configure --prefix=/usr/local/erlang/R16B02 \
                --enable-threads --enable-smp-support --enable-shared-zlib \
                --enable-m64-build --with-ssl --without-javac \
                --enable-darwin-64bit

HiPEあり
-----------------------------------------------------------------------
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
-----------------------------------------------------------------------
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
