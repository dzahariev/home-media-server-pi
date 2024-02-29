FROM --platform=$BUILDPLATFORM alpine:3 AS build
RUN apk --no-cache add autoconf automake busybox cmake g++ git jansson-dev lame-dev libass-dev libjpeg-turbo-dev libtheora-dev libtool libvorbis-dev libvpx-dev libxml2-dev m4 make meson nasm ninja numactl-dev opus-dev patch pkgconf python3 speex-dev tar x264-dev
RUN PKG_CONFIG=/usr/bin/pkg-config && PKG_CONFIG_PATH=/usr/lib/pkgconfig
RUN git clone https://github.com/HandBrake/HandBrake.git /HandBrake
RUN cp -n /HandBrake/contrib/x264/module.defs /HandBrake/contrib/x264/module.defs.bak && sed '/format\=420/a X264.CONFIGURE.extra \+\= \-\-disable\-asm \-\-disable-opencl' /HandBrake/contrib/x264/module.defs.bak > /HandBrake/contrib/x264/module.defs
RUN cp -n /HandBrake/contrib/x265/module.defs /HandBrake/contrib/x265/module.defs.bak && sed '/LIBNUMA\=OFF/a X265.CONFIGURE.extra \+\= \-DENABLE\_ASSEMBLY\=OFF \-DENABLE\_PIC\=ON \-DENABLE\_AGGRESSIVE\_CHECKS\=ON \-DENABLE\_TESTS\=ON \-DCMAKE\_SKIP\_RPATH\=ON' /HandBrake/contrib/x265/module.defs.bak > /HandBrake/contrib/x265/module.defs
WORKDIR /HandBrake
RUN ./configure --disable-gtk
WORKDIR /HandBrake/build
RUN make

FROM alpine:3 AS release
WORKDIR /app
COPY --from=build /HandBrake/build/HandBrakeCLI /app/HandBrakeCLI
ENTRYPOINT [ "./app/HandBrakeCLI" ]
