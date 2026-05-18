# WebSocket over WiSH

## Philosophy

- Web applications should be able to benefit from WebSocket over WiSH without modifying their code
  - No special scheme
  - No additional API parameter or API method call

## Design options

- [Chosen] CSP like capability announcing attached to the main resource
- CORS like mechiansm
  - CORS preflight cache like cache for remembering capability with expiration (max-age)
  - CORS preflight like capability probing
  - Suggest issue of preflight for cross-origin targets

## Processing `ws-alt` response header

A server MAY include a header in an HTTP response named `ws-alt` to let the user agent use WebSocket over WiSH to establish WebSocket connections to specified origins.

The value of the `ws-alt` header MUST be one or more entries of alternative protocol descriptors separated with a comma (0x2C).

```
ws-alternative: wish-h2, wish-h2; origin="ws://foo.com"
```

An alternative protocol descriptor consists of a protocol identifier (only `"wish-h2"` is available for now) followed by one or more parameters.

An alternative protocol descriptor MAY have an optional parameter named `origin`. The value of the `origin` parameter MUST be a `quoted-string` containing `an ASCII serialization of an origin`.

The `HTTP-network fetch` algorithm of the WHATWG Fetch Standard and the `Initializing a new Document object` algorithm of the WHATWG HTML Standard should be modified to propagate the data in the `ws-alt` HTTP response header to the global object.

## Establishing a WebSocket connection over WiSH

A client MAY use WebSocket over WiSH to establish a WebSocket connection to the server instead of the transport specified in RFC 6455 if running these steps returns **true**:
- Let _origin_ be the origin of the current settings object.
- If _origin_ is a tuple origin,
  - If the scheme of _origin_ is `"https"`, set _origin_'s scheme to `"wss"`.
  - Otherwise, if the scheme of _origin_ is `"http"`, set the _origin_'s scheme to `"ws"`.
- Let _descriptors_ be `WebSocket alternative protocol descriptors` of the global object of the current settings object.
- If the origin of `urlRecord` of the WebSocket and _origin_ are same origin,
  - If the following conditions hold for any of entries in _descriptors_, return **true**:
    - The protocol identifier of the entry is `"wish-h2"`
    - The entry doesn't have the origin parameter
- Otherwise,
  - If the following conditions hold for any of entries in _descriptors_, return **true**:
    - The protocol identifier of the entry is `"wish-h2"`
    - The entry has the origin parameter and is equal to the origin of `urlRecord` of the WebSocket, serialized
- Return **false**.

## CORS check

The HTTP response header MUST pass `CORS check`.

