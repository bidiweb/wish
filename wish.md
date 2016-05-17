# wish
WiSH Spec: websocket (framing) over HTTP (semantics)

WiSH Protocol Spec (v0.2, 4/12/2016)

WiSH follows the basic WebSocket framing (https://tools.ietf.org/html/rfc6455)
in the following ways:
1. opcode (8 bit)
2. length (64bit)
3. payload

WiSH always uses HTTP/* as the underlying "multiplexed byte-stream transport"
and therefore, many WS-specific framing details such as masking,
handshake/status and fragmentation are not needed.

Compression, extensions are not needed now.

Relevance of WS status code is TBD.

A high-level protocol such as WebChannel (https://github.com/bidiweb/webchannel)
may use WiSH as the framing protocol to support bi-directional communication
over HTTP and for Web and Internet clients.
