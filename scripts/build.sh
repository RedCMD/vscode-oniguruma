# https://github.com/emscripten-core/emscripten/blob/master/src/settings.js

emcc -O2 \
    deps/Onigmo/.libs/libonig.so \
    src/onig.cc \
    -Isrc -Ideps/Onigmo \
    -o out/onig.js \
    -s ENVIRONMENT=shell \
    -s FILESYSTEM=0 \
    -s MODULARIZE=1 \
    -s EXPORT_NAME=Onig \
    -s ALLOW_MEMORY_GROWTH=1 \
    -s EXPORTED_RUNTIME_METHODS="['UTF8ToString']" \
    --bind

# can be removed when https://github.com/emscripten-core/emscripten/issues/9829 is fixed.
node ./scripts/remove-print.js
