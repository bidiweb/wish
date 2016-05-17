# WiSH: WebSocket over HTTP

##Core Spec (v0.2)

WiSH  essentially layers a WS compatible framing over HTTP (semantics only).

WiSH follows the basic [WebSocket framing] [1] as following:

1. opcode (8 bit)
2. length (64bit)
3. payload

##Notes

WiSH always uses HTTP/* as the underlying "multiplexed byte-stream transport" and therefore, many WS-specific framing details such as masking, handshake/status and fragmentation are not needed.

Compression, extensions are not needed now.

Relevance of WS status code is TBD.

A high-level protocol such as [WebChannel] [2] may use WiSH as the framing protocol to support bi-directional communication over HTTP and for Web and Internet clients.

[1]: https://tools.ietf.org/html/rfc6455
[2]: https://github.com/bidiweb/webchannel
