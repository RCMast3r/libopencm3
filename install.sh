    
mkdir -p $out/lib
    find . -maxdepth 2 -type f -name "*.a" -exec cp {} $out/lib \;
    mkdir -p $out/include
    find include -type f -name "*.h" -exec rsync --relative {} $out/include \;

