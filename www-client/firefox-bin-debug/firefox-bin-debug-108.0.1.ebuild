# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

SRC_URI="
amd64? (
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libnss3.so/D2189079DA9697D211EBDB3FB8BF0CD80/libnss3.so.dbg.gz -> ${P}-799018d296dad29711ebdb3fb8bf0cd83f189f0a.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libmozwayland.so/791F462D40C11C55463DD23DFAFA67710/libmozwayland.so.dbg.gz -> ${P}-2d461f79c140551c463dd23dfafa67719f8f28de.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libmozavutil.so/E56E65DC690768A288B511CA9F0A4A2C0/libmozavutil.so.dbg.gz -> ${P}-dc656ee50769a26888b511ca9f0a4a2c41f742c2.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/plugin-container/104CA04303159B67B492B7E9D6219DF00/plugin-container.dbg.gz -> ${P}-43a04c101503679bb492b7e9d6219df039f1f625.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/crashreporter/539979EE79BD66F49DCCA6744E5D72B90/crashreporter.dbg.gz -> ${P}-ee799953bd79f4669dcca6744e5d72b9b3e6aae1.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libmozgtk.so/C66D37854738D4633E8E4C99BFAC1E8F0/libmozgtk.so.dbg.gz -> ${P}-85376dc6384763d43e8e4c99bfac1e8f887bbbc5.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libplc4.so/B9347DE41EAF52EB938E66CD7AC878C30/libplc4.so.dbg.gz -> ${P}-e47d34b9af1eeb52938e66cd7ac878c3d539b64e.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libsmime3.so/A190B8F7A99B99DB11C777951DE713800/libsmime3.so.dbg.gz -> ${P}-f7b890a19ba9db9911c777951de713807ccd7f8a.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libnssckbi.so/001EFDB47FBD444748BA091AC3DD2E5A0/libnssckbi.so.dbg.gz -> ${P}-b4fd1e00bd7f474448ba091ac3dd2e5ad19d95c3.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libssl3.so/B89059BEC7C589836D440AB9DB94692D0/libssl3.so.dbg.gz -> ${P}-be5990b8c5c783896d440ab9db94692defceb14f.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/minidump-analyzer/D957100DDDA722D64D8C45C2563694CB0/minidump-analyzer.dbg.gz -> ${P}-0d1057d9a7ddd6224d8c45c2563694cbf4671500.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libfreeblpriv3.so/08D278CA542BD4D218E2B72578827E830/libfreeblpriv3.so.dbg.gz -> ${P}-ca78d2082b54d2d418e2b72578827e833d43524b.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libmozsqlite3.so/44BF793ED82483649B40F4ABD919F4CD0/libmozsqlite3.so.dbg.gz -> ${P}-3e79bf4424d864839b40f4abd919f4cd2d363765.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libmozsandbox.so/F3F0D8880407D5B1495B01C00B1193F80/libmozsandbox.so.dbg.gz -> ${P}-88d8f0f30704b1d5495b01c00b1193f85eed46f1.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libsoftokn3.so/0C44EE31ABAA757FC3D1AC907354515D0/libsoftokn3.so.dbg.gz -> ${P}-31ee440caaab7f75c3d1ac907354515de7b7b8e4.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libipcclientcerts.so/867EE503EB9FD49445DDA800A9D99E4F0/libipcclientcerts.so.dbg.gz -> ${P}-03e57e869feb94d445dda800a9d99e4f3387335f.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/liblgpllibs.so/B511582682C44A9DAD642D7527F1C0BF0/liblgpllibs.so.dbg.gz -> ${P}-265811b5c4829d4aad642d7527f1c0bf9dd327b6.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/firefox/2C819910847E388BB028BE63E2B53A900/firefox.dbg.gz -> ${P}-1099812c7e848b38b028be63e2b53a90b7355f03.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libxul.so/46897555BAABA781F6D056785CE992450/libxul.so.dbg.gz -> ${P}-55758946abba81a7f6d056785ce9924501a81531.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libnspr4.so/3DD35D3DC117C8AA31FE04E117F1FBF10/libnspr4.so.dbg.gz -> ${P}-3d5dd33d17c1aac831fe04e117f1fbf1354cd886.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libplds4.so/9E1D844F70CE30D210C4BF448B835A530/libplds4.so.dbg.gz -> ${P}-4f841d9ece70d23010c4bf448b835a535229b74d.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/updater/6151BC4E91496BE5FC66412DDDC1294B0/updater.dbg.gz -> ${P}-4ebc51614991e56bfc66412dddc1294b29992c2d.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libnssutil3.so/694AFD22195799E52CC5F3167F8E10A00/libnssutil3.so.dbg.gz -> ${P}-22fd4a695719e5992cc5f3167f8e10a0ee6973d2.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/firefox-bin/7AD720C79E34662F1A56C97E371985580/firefox-bin.dbg.gz -> ${P}-c720d77a349e2f661a56c97e37198558c675c82c.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libmozavcodec.so/2DC68287BA5B5303AAB6E21D16F2B6260/libmozavcodec.so.dbg.gz -> ${P}-8782c62d5bba0353aab6e21d16f2b626b6262779.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/pingsender/9C534B696BD3BA17C9C69AFE601196370/pingsender.dbg.gz -> ${P}-694b539cd36b17bac9c69afe601196374eacde1d.debug.gz
	http://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/libclearkey.so/FF31789527E3AA01C51305A969CD619B0/libclearkey.so.dbg.gz -> ${P}-957831ffe32701aac51305a969cd619b95d87508.debug.gz
)
"

DESCRIPTION="Debug symbols for Firefox"
HOMEPAGE="https://www.mozilla.com/firefox"

KEYWORDS="-* amd64 x86"
SLOT="0"
LICENSE="MPL-2.0 GPL-2 LGPL-2.1"
IUSE=""

RESTRICT="strip"

DEPEND="=www-client/firefox-bin-${PV}"

RDEPEND="${DEPEND}"

src_unpack() {
	mkdir "${S}" || die
}

src_install() {
	DDIR=/usr/lib/debug/.build-id/
	dodir $DDIR
	pushd "$ED/$DDIR" &>/dev/null || die

	local src
	for src in ${A}; do
		dest="${src#${P}-}"
		dest="${dest%.gz}"
		unpack "$src" || die
		mkdir -p "${dest:0:2}" || die
		mv "${src%.gz}" "${dest:0:2}/${dest:2}" || die
	done
}
