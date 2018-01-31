defmodule JesseHostedWeb.LandingView do
    use JesseHostedWeb, :view

    alias Plug.Conn

    #TODO: make this randomly generate an image?
    def image_path(%Conn{private: private} = conn, path) do
        private.phoenix_endpoint.static_path("/images/landing/" <> path)
    end
end