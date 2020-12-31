ExUnit.start()

defmodule Router do
  use Phoenix.Router
end

defmodule Endpoint do
  use Phoenix.Endpoint, otp_app: :phoenix_feathers
  plug(Router)
end

Application.put_env(:phoenix_feathers, Endpoint,
  secret_key_base: "J4lTFt000ENUVhu3dbIB2P2vRVl2nDBH6FLefnPUImL8mHYNX8Kln/N9J0HH19Mq",
  live_view: [
    signing_salt: "xQUi3+AJTOAv/bxZ00bJ7uUSukZFI3j3"
  ]
)

Endpoint.start_link()
