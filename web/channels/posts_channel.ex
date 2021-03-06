defmodule Microscope.PostChannel do
  use Microscope.Web, :channel

  alias Microscope.Endpoint

  def join("posts:lobby", _payload, socket) do
    {:ok, socket}
  end

  def broadcast_all(event, payload)  do
    Endpoint.broadcast_from!(self, "posts:lobby", "posts:#{event}", payload)
  end
end
