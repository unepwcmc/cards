# CARDS: CARds Dashboard System

Welcome to the *CARDS* repository! 👋 CARDS is a dashboard system for TVs on kiosk mode,
and it's written in Elixir, with a Phoenix frontend.

## Alright, let's get you started!

If you haven't got it yet, install the [`asdf` version manager](https://github.com/asdf-vm/asdf),
and add the plugins for erlang and elixir.

```
# follow the instructions on the asdf repo, then

$ asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
$ asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
```

Clone the CARDS repo and let `asdf` install the right versions stored in the `.tool-versions` file.

```
$ git clone git@github.com:unepwcmc/cards.git
$ cd cards
$ asdf install
…
$ mix phx.server
```

Visit `http://localhost:4000` and you're good to go! 🎉🚀
