Swift UI lib inspired by the Haiku OS Application/Interface Kits

g++ -c -fPIC skia_bridge.cpp \
    -I$HOME/skia \
    -I$HOME/skia/include \
    -I$HOME/skia/include/core \
    -std=c++17

ar rcs libskia_bridge.a skia_bridge.o
sudo cp libskia_bridge.a /usr/local/lib/
