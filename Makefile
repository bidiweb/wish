draft-yoshino-wish.xml: draft-yoshino-wish.mkd
	# https://github.com/cabo/kramdown-rfc
	#
	# https://rubygems.org/gems/kramdown-rfc/versions/1.7.38
	kramdown-rfc draft-yoshino-wish.mkd > draft-yoshino-wish.xml

draft-yoshino-wish.html: draft-yoshino-wish.xml
	# https://github.com/ietf-tools/xml2rfc#docker-container
	#
	# v3.33.0
	# https://github.com/ietf-tools/xml2rfc/pkgs/container/xml2rfc-slim/versions?filters%5Bversion_type%5D=tagged
	docker run --rm -v "$(shell pwd):/data" ghcr.io/ietf-tools/xml2rfc-slim@sha256:6599afa9a10e8c0da7d5e0dc05bb6c2445b78167af94664984f9ee32a8d6c7fd /data/draft-yoshino-wish.xml --html

draft-yoshino-wish.txt: draft-yoshino-wish.xml
	docker run --rm -v "$(shell pwd):/data" ghcr.io/ietf-tools/xml2rfc-slim@sha256:6599afa9a10e8c0da7d5e0dc05bb6c2445b78167af94664984f9ee32a8d6c7fd /data/draft-yoshino-wish.xml

.PHONY: all
all: draft-yoshino-wish.xml draft-yoshino-wish.html draft-yoshino-wish.txt
