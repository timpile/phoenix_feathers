# Phoenix Feathers

> This project is still in early development

A UI component library built for Phoenix LiveView.

## Live Demo

Check it out here: [Phoenix Feathers Demo](https://demo.phoenixfeathers.live){:target="_blank"}

## Installation

The package can be installed by adding `phoenix_feathers` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:phoenix_feathers, "~> 1.1.0-alpha"}
  ]
end
```

In the root of your Phoenix project run:

```bash
$ mix phx.feathers --styles
```

This will create the file `./assets/css/phoenix_feathers.scss` with a base set of styles for this components library. The styles are meant to extend the default css generated for a phoenix project, so add the following import to your project's `./assets/css/app.scss` file after `phoenix.css`.

```css
@import './phoenix.css';
@import './phoenix_feathers.scss';
```

## Mix tasks

```bash
$ mix phx.feathers --help
```
