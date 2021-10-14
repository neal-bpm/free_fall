defmodule FreeFallWeb.GameLive do
  # use FreeFallWeb, :live_view
  use Surface.LiveView
  alias FreeFall.Game.Tetro
  alias FreeFall.Game.Shape
  alias FreeFallWeb.Live.Components.{Title, Button, Point}

  @impl true
  def render(assigns) do
    ~F"""
    <Title message={@title} id="title" />
    <pre>
    { inspect Shape.from_tetro(@tetro) }
    </pre>

    <Button action="left" label="Left" id="left-button" />
    <Button action="right" label="Right" id="right-button" />
    <Button action="rotate" label="Rotate" id="rotate-button" />


    <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
    <Point x="1" y="1" color="red" id="hello"/>
    </svg>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, tetro: Tetro.new(:j), title: "Welcome to FreeFall!")}
  end

  @impl true
  def handle_event("left", _value, %{assigns: %{tetro: tetro}} = socket) do
    {:noreply, assign(socket, tetro: Tetro.left(tetro))}
  end

  @impl true
  def handle_event("right", _value, %{assigns: %{tetro: tetro}} = socket) do
    {:noreply, assign(socket, tetro: Tetro.right(tetro))}
  end

  @impl true
  def handle_event("rotate", _value, %{assigns: %{tetro: tetro}} = socket) do
    {:noreply, assign(socket, tetro: Tetro.rotate(tetro))}
  end
end
